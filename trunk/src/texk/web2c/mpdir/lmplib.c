/* $Id$ */

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mplib.h"
#include "mpmp.h"
#include "mppsout.h" /* for mp_edge_object */

#define MPLIB_METATABLE     "MPlib"
#define MPLIB_FIG_METATABLE "MPlib.fig"
#define MPLIB_GR_METATABLE  "MPlib.gr"

#define xfree(A) if (A!=NULL) free(A)

#define is_mp(L,b) (MP *)luaL_checkudata(L,b,MPLIB_METATABLE)
#define is_fig(L,b) (struct mp_edge_object **)luaL_checkudata(L,b,MPLIB_FIG_METATABLE)
#define is_gr_object(L,b) (struct mp_graphic_object **)luaL_checkudata(L,b,MPLIB_GR_METATABLE)

typedef enum {  
  P__ZERO,       P_ERROR_LINE,  P_HALF_LINE,   P_MAX_LINE,    P_MAIN_MEMORY, 
  P_HASH_SIZE,   P_HASH_PRIME,  P_PARAM_SIZE,  P_IN_OPEN,     P_RANDOM_SEED, 
  P_INTERACTION, P_INI_VERSION, P_TROFF_MODE,  P_PRINT_NAMES, P_COMMAND_LINE,
  P_MEM_NAME,    P_JOB_NAME,    P_FIND_FILE,   P_OPEN_FILE,   P_CLOSE_FILE,  
  P_EOF_FILE,    P_FLUSH_FILE,  P_WRITE_ASCII, P_READ_ASCII,  P_WRITE_BINARY,
  P_READ_BINARY, P_RUN_EDITOR,  P_RUN_MAKEMPX, P_SHIPOUT,     P__SENTINEL,
} parm_idx;

typedef struct {
    const char *name;           /* parameter name */
    parm_idx idx;               /* parameter index */
    int class;                  /* parameter class */
} parm_struct;

const char *interaction_options[] = 
  { "unknownmode","batchmode","nonstopmode","scrollmode","errorstopmode", NULL};

/* the third field (type) is currently not used */

parm_struct img_parms[] = {
  {NULL,                P__ZERO,       0   },  /* dummy; lua indices run from 1 */
  {"error_line",        P_ERROR_LINE,  'i' },
  {"half_error_line",   P_HALF_LINE,   'i' },
  {"max_print_line",    P_MAX_LINE,    'i' },
  {"main_memory",       P_MAIN_MEMORY, 'i' },
  {"hash_size",         P_HASH_SIZE,   'i' },
  {"hash_prime",        P_HASH_PRIME,  'i' },
  {"param_size",        P_PARAM_SIZE,  'i' },
  {"max_in_open",       P_IN_OPEN,     'i' },
  {"random_seed",       P_RANDOM_SEED, 'i' },
  {"interaction",       P_INTERACTION, 'e' },
  {"ini_version",       P_INI_VERSION, 'b' },
  {"troff_mode",        P_TROFF_MODE,  'b' },
  {"print_found_names", P_PRINT_NAMES, 'b' },
  {"command_line",      P_COMMAND_LINE,'s' },
  {"mem_name",          P_MEM_NAME,    's' },
  {"job_name",          P_JOB_NAME,    's' },
  {"find_file",         P_FIND_FILE,   'p' }, /* intercepted */
  {NULL,                P__SENTINEL,   0   }
};

typedef struct _FILE_ITEM {
  FILE *f;
} _FILE_ITEM ;

typedef struct _FILE_ITEM File;

/* Start by defining all the callback routines for the library 
 * except |run_make_mpx| and |run_editor|.
 */

char *mplib_filetype_names[] = {"term", "error", "mp", "log", "ps",
                              "mem", "tfm", "map", "pfb", "enc", NULL};

lua_State *LL = NULL;

char *mplib_find_file (char *fname, char *fmode, int ftype)  {
  if (LL!=NULL) {
    lua_State *L = LL;
    lua_checkstack(L,4);
    lua_getfield(L,LUA_REGISTRYINDEX,"mplib_file_finder");
    if (lua_isfunction(L,-1)) {
      char *s = NULL, *x = NULL;
      lua_pushstring(L, fname);
      lua_pushstring(L, fmode);
      if (ftype >= mp_filetype_text) {
        lua_pushnumber(L, ftype-mp_filetype_text);
      } else {
        lua_pushstring(L, mplib_filetype_names[ftype]);
      }
      if(lua_pcall(L,3,1,0) != 0) {
	fprintf(stdout,"Error in mp.find_file: %s\n", (char *)lua_tostring(L,-1));
	return NULL;
      }
      x = (char *)lua_tostring(L,-1);
      if (x!=NULL)
        s = strdup(x);
      lua_pop(L,1); /* pop the string */
      return s;
    } else {
      lua_pop(L,1);
    }
  }
  if (fmode[0] != 'r' || (! access (fname,R_OK)) || ftype) {  
     return strdup(fname);
  }
  return NULL;
}

static int 
mplib_find_file_function (lua_State *L) {
  if (lua_isfunction(L,-1)) {
    LL =  L;
  } else if (lua_isnil(L,-1)) {
    LL = NULL;
  } else {
    return 1; /* error */
  }
  lua_pushstring(L, "mplib_file_finder");
  lua_pushvalue(L,-2);
  lua_rawset(L,LUA_REGISTRYINDEX);
  return 0;
}

void *term_file_ptr = NULL;
void *err_file_ptr = NULL;
void *log_file_ptr = NULL;
void *ps_file_ptr = NULL;

void *mplib_open_file(char *fname, char *fmode, int ftype)  {
  File *ff = malloc(sizeof (File));
  if (ff) {
    ff->f = NULL;
    if (ftype==mp_filetype_terminal) {
      if (fmode[0] == 'r') {
	ff->f = stdin;
      } else {
	xfree(term_file_ptr); 
	ff->f = malloc(1);
	term_file_ptr = ff->f;
      }
    } else if (ftype==mp_filetype_error) {
      xfree(err_file_ptr); 
      ff->f = malloc(1);
      err_file_ptr = ff->f;
    } else if (ftype == mp_filetype_log) {
      xfree(log_file_ptr); 
      ff->f = malloc(1);
      log_file_ptr = ff->f;
    } else if (ftype == mp_filetype_postscript) {
      xfree(ps_file_ptr); 
      ff->f = malloc(1);
      ps_file_ptr = ff->f;
    } else { 
      char *f = fname;
      if (fmode[0] == 'r') {
	f = mplib_find_file(fname,fmode,ftype);
	if (f==NULL)
	  return NULL;
      }
      ff->f = fopen(f, fmode);
      if ((fmode[0] == 'r') && (ff->f == NULL)) {
	free(ff);
	return NULL;  
      }
    }
    return ff;
  }
  return NULL;
}

static char * input_data = NULL;
static char * input_data_ptr = NULL;
static size_t input_data_len = 0;

#define GET_CHAR() do {							\
    if (f==stdin && input_data != NULL) {				\
      if (input_data_len==0) {						\
	if (input_data_ptr!=NULL) 					\
	  input_data_ptr = NULL;					\
	else								\
	  input_data = NULL;						\
	c = EOF;							\
      } else {								\
	input_data_len--;						\
	c = *input_data_ptr++;						\
      }									\
    } else {								\
      c = fgetc(f);							\
    }									\
  } while (0)

#define UNGET_CHAR() do {						\
    if (f==stdin && input_data != NULL) {				\
      input_data_len++;	input_data_ptr--;				\
    } else {								\
      ungetc(c,f);							\
    }									\
  } while (0)


char *mplib_read_ascii_file (void *ff, size_t *size) {
  int c;
  size_t len = 0, lim = 128;
  char *s = NULL;
  if (ff!=NULL) {
    FILE *f = ((File *)ff)->f;
    if (f==NULL)
      return NULL;
    *size = 0;
    GET_CHAR();
    if (c==EOF)
      return NULL;
    s = malloc(lim); 
    if (s==NULL) return NULL;
    while (c!=EOF && c!='\n' && c!='\r') { 
      if (len==lim) {
	s =realloc(s, (lim+(lim>>2)));
	if (s==NULL) return NULL;
	lim+=(lim>>2);
      }
      s[len++] = c;
      GET_CHAR();
    }
    if (c=='\r') {
      GET_CHAR();
      if (c!=EOF && c!='\n')
	UNGET_CHAR();
    }
    s[len] = 0;
    *size = len;
  }
  return s;
}

static char *term_out = NULL;
static char *error_out = NULL;
static char *log_out = NULL;
static char *ps_out = NULL;

#define APPEND_STRING(a,b) do {			\
    if (a==NULL) {				\
      a = strdup(b);				\
    } else {					\
      a = realloc(a, strlen(a)+strlen(b)+1);	\
      strcpy(a+strlen(a),b);			\
    }						\
  } while (0)

void mplib_write_ascii_file (void *ff, char *s) {
  if (ff!=NULL) {
    void *f = ((File *)ff)->f;
    if (f!=NULL) {
      if (f==term_file_ptr) {
	APPEND_STRING(term_out,s);
      } else if (f==err_file_ptr) {
	APPEND_STRING(error_out,s);
      } else if (f==log_file_ptr) {
	APPEND_STRING(log_out,s);
      } else if (f==ps_file_ptr) {
        APPEND_STRING(ps_out,s);
      } else {
	fprintf((FILE *)f,s);
      }
    }
  }
}

void mplib_read_binary_file (void *ff, void **data, size_t *size) {
  size_t len = 0;
  if (ff!=NULL) {
    FILE *f = ((File *)ff)->f;
    if (f!=NULL) 
      len = fread(*data,1,*size,f);
    *size = len;
  }
}

void mplib_write_binary_file (void *ff, void *s, size_t size) {
  if (ff!=NULL) {
    FILE *f = ((File *)ff)->f;
    if (f!=NULL)
      fwrite(s,size,1,f);
  }
}


void mplib_close_file (void *ff) {
  if (ff!=NULL) {
    void *f = ((File *)ff)->f;
    if (f != NULL && f != term_file_ptr && f != err_file_ptr
	&& f != log_file_ptr && f != ps_file_ptr) {
      fclose(f);
    }
    free(ff);
  }
}

int mplib_eof_file (void *ff) {
  if (ff!=NULL) {
    FILE *f = ((File *)ff)->f;
    if (f==NULL)
      return 1;
    if (f==stdin && input_data != NULL) {	
      return (input_data_len==0);
    }
    return feof(f);
  }
  return 1;
}

void mplib_flush_file (void *ff) {
  return ;
}

static struct mp_edge_object *edges = NULL;

#define APPEND_TO_EDGES(a) do {			\
    if (edges==NULL) {				\
      edges = hh;				\
    } else {					\
      struct mp_edge_object *p = edges;		\
      while (p->_next!=NULL) { p = p->_next; }	\
      p->_next = hh;				\
    }						\
} while (0)

void mplib_shipout_backend (MP mp, int h) {
  struct mp_edge_object *hh; 
  hh = mp_gr_export(mp, h);
  if (hh) {
    APPEND_TO_EDGES(hh); 
  }
}


static void 
mplib_setup_file_ops(struct MP_options * options) {
  options->find_file         = mplib_find_file;
  options->open_file         = mplib_open_file;
  options->close_file        = mplib_close_file;
  options->eof_file          = mplib_eof_file;
  options->flush_file        = mplib_flush_file;
  options->write_ascii_file  = mplib_write_ascii_file;
  options->read_ascii_file   = mplib_read_ascii_file;
  options->write_binary_file = mplib_write_binary_file;
  options->read_binary_file  = mplib_read_binary_file;
  options->shipout_backend   = mplib_shipout_backend;
}

static int 
mplib_new (lua_State *L) {
  MP *mp_ptr;
  int h,i;
  struct MP_options * options; /* instance options */
  mp_ptr = lua_newuserdata(L, sizeof(MP *));
  if (mp_ptr) {
    options = mp_options();
    mplib_setup_file_ops(options);
    options->noninteractive = 1; /* required ! */
    options->print_found_names = 0;
    if (lua_type(L,1)==LUA_TTABLE) {
      for (i=1;img_parms[i].name!=NULL;i++) {
	lua_getfield(L,1,img_parms[i].name);
	if (lua_isnil(L,-1)) {
          lua_pop(L,1);
	  continue; /* skip unset */
	}
        switch(img_parms[i].idx) {
	case P_ERROR_LINE: 
	  options->error_line = lua_tointeger(L,-1);
          break;
	case P_HALF_LINE:   
	  options->half_error_line = lua_tointeger(L,-1);
          break;
	case P_MAX_LINE:
	  options->max_print_line = lua_tointeger(L,-1);
          break;
	case P_MAIN_MEMORY:
	  options->main_memory = lua_tointeger(L,-1);
          break;
	case P_HASH_SIZE:
	  options->hash_size = lua_tointeger(L,-1);
          break;
	case P_HASH_PRIME:
	  options->hash_prime = lua_tointeger(L,-1);
          break;
	case P_PARAM_SIZE:
	  options->param_size = lua_tointeger(L,-1);
          break;
	case P_IN_OPEN:
	  options->max_in_open = lua_tointeger(L,-1);
          break;
	case P_RANDOM_SEED:
	  options->random_seed = lua_tointeger(L,-1);
          break;
	case P_INTERACTION:
          options->interaction = luaL_checkoption(L,-1,"errorstopmode", interaction_options);
	  break;
	case P_INI_VERSION:
	  options->ini_version = lua_toboolean(L,-1);
          break;
	case P_TROFF_MODE:
	  options->troff_mode = lua_toboolean(L,-1);
          break;
	case P_PRINT_NAMES:
	  options->print_found_names = lua_toboolean(L,-1);
          break;
	case P_COMMAND_LINE:
	  options->command_line = strdup((char *)lua_tostring(L,-1));
          break;
	case P_MEM_NAME:
	  options->mem_name = strdup((char *)lua_tostring(L,-1));
          break;
	case P_JOB_NAME:
	  options->job_name = strdup((char *)lua_tostring(L,-1));
          break;
	case P_FIND_FILE:  
	  if(mplib_find_file_function(L)) { /* error here */
	    fprintf(stdout,"Invalid arguments to mp.new({find_file=...})\n");
	  }
	  break;
        default:
	  break;
	}
        lua_pop(L,1);
      }
    }
    *mp_ptr = mp_new(options);
    xfree(options->command_line);
    xfree(options->mem_name);
    xfree(options->job_name);
    free(options);
    if (*mp_ptr) {
      h = mp_initialize(*mp_ptr);
      if (!h) {
	luaL_getmetatable(L,MPLIB_METATABLE);
	lua_setmetatable(L,-2);
	return 1;
      }
    }
  }
  lua_pushnil(L);
  return 1;
}

static int
mplib_collect (lua_State *L) {
  MP *mp_ptr = is_mp(L,1);
  if (*mp_ptr!=NULL) {
    mp_free(*mp_ptr);
    *mp_ptr=NULL;
  }
  return 0;
}

static int
mplib_tostring (lua_State *L) {
  MP *mp_ptr = is_mp(L,1);
  if (*mp_ptr!=NULL) {
    lua_pushfstring(L,"<MP %p>",*mp_ptr);
	return 1;
  }
  return 0;
}

static int
mplib_run (lua_State *L) {
  MP *mp_ptr = is_mp(L,1);
  if (*mp_ptr!=NULL) {
	int h = mp_run(*mp_ptr);
	lua_pushnumber(L,h);
  } else {
	lua_pushnil(L);
  }
  return 1;
}

static int 
mplib_wrapresults(lua_State *L,int h) {
   lua_checkstack(L,5);
   lua_newtable(L);
   if (term_out != NULL) {
     lua_pushstring(L,term_out);
     lua_setfield(L,-2,"term");
     free(term_out); term_out = NULL;
   }
   if (error_out != NULL) {
     lua_pushstring(L,error_out);
     lua_setfield(L,-2,"error");
     free(error_out); error_out = NULL;
   } 
   if (log_out != NULL ) {
     lua_pushstring(L,log_out);
     lua_setfield(L,-2,"log");
     free(log_out); log_out = NULL;
   }
   if (edges != NULL ) {
     struct mp_edge_object **v;
     struct mp_edge_object *p = edges;
     int i = 1;
     lua_newtable(L);
     while (p!=NULL) { 
       v = lua_newuserdata (L, sizeof(struct mp_edge_object *));
       *v = p;
       luaL_getmetatable(L,MPLIB_FIG_METATABLE);
       lua_setmetatable(L,-2);
       lua_rawseti(L,-2,i); i++;
       p = p->_next;
     }
     lua_setfield(L,-2,"fig");
     edges = NULL;
   }
   lua_pushnumber(L,h);
   lua_setfield(L,-2,"status");
   return 1;
}

static int
mplib_execute (lua_State *L) {
  MP *mp_ptr = is_mp(L,1);
  if (*mp_ptr!=NULL && lua_isstring(L,2)) {
    if (input_data_len>0) {  /* this should NOT happen */
      fprintf(stderr,"Can't do concurrency yet!\n");
    } else {
      input_data = (char *)lua_tolstring(L,2, &input_data_len);
      input_data_ptr = input_data;
      int h = mp_execute(*mp_ptr);
      return mplib_wrapresults(L, h);
    } 

  } else {
    lua_pushnil(L);
  }
  return 1;
}

static int
mplib_finish (lua_State *L) {
  MP *mp_ptr = is_mp(L,1);
  if (*mp_ptr!=NULL) {
    int h = mp_finish(*mp_ptr);
    return mplib_wrapresults(L, h);
  } else {
    lua_pushnil(L);
  }
  return 1;
}

/* figure methods */

static int
mplib_fig_collect (lua_State *L) {
  struct mp_edge_object **hh = is_fig(L,1);
  if (*hh!=NULL) {
    mp_gr_toss_objects (*hh);
    *hh=NULL;
  }
  return 0;
}

static int
mplib_fig_body (lua_State *L) {
  int i = 1;
  struct mp_graphic_object **v;
  struct mp_graphic_object *p;
  struct mp_edge_object **hh = is_fig(L,1);
  lua_newtable(L);
  p = (*hh)->body;
  while (p!=NULL) {
    v = lua_newuserdata (L, sizeof(struct mp_graphic_object *));
    *v = p;
    luaL_getmetatable(L,MPLIB_GR_METATABLE);
    lua_setmetatable(L,-2);
    lua_rawseti(L,-2,i); i++;
    p = p->_link_field;
  }
  (*hh)->body = NULL; /* prevent double free */
  return 1;
}


static int
mplib_fig_tostring (lua_State *L) {
  struct mp_edge_object **hh = is_fig(L,1);
  lua_pushfstring(L,"<figure %p>",*hh);
  return 1;
}



static int 
mp_wrapped_shipout (struct mp_edge_object *hh, int prologues, int procset) {
  MP mp = hh->_parent;
  if (setjmp(mp->jump_buf)) {
    return 0;
  }
  mp_gr_ship_out(hh,prologues,procset);
  return 1;
}

static int
mplib_fig_postscript (lua_State *L) {
  struct mp_edge_object **hh = is_fig(L,1);
  int prologues = luaL_optnumber(L,2,-1);
  int procset = luaL_optnumber(L,3,-1);
  if (ps_out == NULL) {
    if (mp_wrapped_shipout(*hh,prologues, procset)) {
      if (ps_out!=NULL ) {
	lua_pushstring(L, ps_out);
	free(ps_out); ps_out = NULL;
      } else {
	lua_pushnil(L);
      }
      return 1;
    } else {
      lua_pushnil(L);
      lua_pushstring(L,log_out);
      free(ps_out); ps_out = NULL;
      return 2;
    }
  }
  lua_pushnil(L);
  return 1;
}

static int
mplib_fig_bb (lua_State *L) {
  struct mp_edge_object **hh = is_fig(L,1);
  lua_newtable(L);
  lua_pushnumber(L, (double)(*hh)->_minx/65536.0);
  lua_rawseti(L,-2,1);
  lua_pushnumber(L, (double)(*hh)->_miny/65536.0);
  lua_rawseti(L,-2,2);
  lua_pushnumber(L, (double)(*hh)->_maxx/65536.0);
  lua_rawseti(L,-2,3);
  lua_pushnumber(L, (double)(*hh)->_maxy/65536.0);
  lua_rawseti(L,-2,4);
  return 1;
}

/* object methods */

static int
mplib_gr_collect (lua_State *L) {
  struct mp_graphic_object **hh = is_gr_object(L,1);
  if (*hh!=NULL) {
    mp_gr_toss_object(*hh);
    *hh=NULL;
  }
  return 0;
}

static int
mplib_gr_tostring (lua_State *L) {
  struct mp_graphic_object **hh = is_gr_object(L,1);
  lua_pushfstring(L,"<object %p>",*hh);
  return 1;
}


char *knot_type_enum[]  = {
  "endpoint", "explicit", "given", "curl", "open", "end_cycle" 
};

char *knot_originator_enum[]  = { "program" ,"user" };



static void 
mplib_push_path (lua_State *L, struct mp_knot *h ) {
  struct mp_knot *p; /* for scanning the path */
  int i=1;
  p=h;
  if (p!=NULL) {
    lua_newtable(L);
    do {  
      lua_newtable(L);
      lua_pushstring(L,knot_originator_enum[p->originator_field]);
      lua_setfield(L,-2,"originator");
      lua_pushstring(L,knot_type_enum[p->left_type_field]);
      lua_setfield(L,-2,"left_type");
      lua_pushstring(L,knot_type_enum[p->right_type_field]);
      lua_setfield(L,-2,"right_type");
      lua_pushnumber(L,p->x_coord_field);
      lua_setfield(L,-2,"x_coord");
      lua_pushnumber(L,p->y_coord_field);
      lua_setfield(L,-2,"y_coord");
      lua_pushnumber(L,p->left_x_field);
      lua_setfield(L,-2,"left_x");
      lua_pushnumber(L,p->left_y_field);
      lua_setfield(L,-2,"left_y");
      lua_pushnumber(L,p->right_x_field);
      lua_setfield(L,-2,"right_x");
      lua_pushnumber(L,p->right_y_field);
      lua_setfield(L,-2,"right_y");
      lua_rawseti(L,-2,i); i++;
      if ( p->right_type_field==mp_endpoint ) { 
	return;
      }
      p=p->next_field;
    } while (p!=h) ;
  } else {
    lua_pushnil(L);
  }
}

char *color_model_enum[] = { NULL, "none",  NULL, "grey",
  NULL, "rgb", NULL, "cmyk", NULL, "uninitialized" };



/* this is a bit silly, a better color model representation is needed */
static void 
mplib_push_color (lua_State *L, struct mp_graphic_object *h ) {
  if (h!=NULL) {
    lua_newtable(L);
    lua_pushstring(L,color_model_enum[h->color_model_field]);
    lua_setfield(L,-2,"model");

    if (h->color_model_field == mp_rgb_model ||
	h->color_model_field == mp_uninitialized_model) {
      lua_newtable(L);
      lua_pushnumber(L,h->color_field.rgb._red_val);
      lua_rawseti(L,-2,1);
      lua_pushnumber(L,h->color_field.rgb._green_val);
      lua_rawseti(L,-2,2);
      lua_pushnumber(L,h->color_field.rgb._blue_val);
      lua_rawseti(L,-2,3);
      lua_setfield(L,-2,"rgb");
    }

    if (h->color_model_field == mp_cmyk_model ||
	h->color_model_field == mp_uninitialized_model) {
      lua_newtable(L);
      lua_pushnumber(L,h->color_field.cmyk._cyan_val);
      lua_rawseti(L,-2,1);
      lua_pushnumber(L,h->color_field.cmyk._magenta_val);
      lua_rawseti(L,-2,2);
      lua_pushnumber(L,h->color_field.cmyk._yellow_val);
      lua_rawseti(L,-2,3);
      lua_pushnumber(L,h->color_field.cmyk._black_val);
      lua_rawseti(L,-2,4);
      lua_setfield(L,-2,"cmyk");
    }
    if (h->color_model_field == mp_grey_model ||
	h->color_model_field == mp_uninitialized_model) {
      lua_newtable(L);
      lua_pushnumber(L,h->color_field.grey._grey_val);
      lua_rawseti(L,-2,1);
      lua_setfield(L,-2,"grey");
    }
    
  } else {
    lua_pushnil(L);
  }
}

/* dashes are complicated, perhaps it would be better if the
  object had a PS-compatible representation */
static void 
mplib_push_dash (lua_State *L, struct mp_graphic_object *h ) {
  if (h!=NULL) {
    lua_newtable(L);
    lua_pushnumber(L,h->dash_scale_field);
    lua_setfield(L,-2,"scale");
    /* todo */
    lua_pushnumber(L,(int)h->dash_p_field);
    lua_setfield(L,-2,"dashes");
  } else {
    lua_pushnil(L);
  }
}

static void 
mplib_push_transform (lua_State *L, struct mp_graphic_object *h ) {
  int i = 1;
  if (h!=NULL) {
    lua_newtable(L);
    lua_pushnumber(L,h->tx_field);
    lua_rawseti(L,-2,i); i++;
    lua_pushnumber(L,h->ty_field);
    lua_rawseti(L,-2,i); i++;
    lua_pushnumber(L,h->txx_field);
    lua_rawseti(L,-2,i); i++;
    lua_pushnumber(L,h->txy_field);
    lua_rawseti(L,-2,i); i++;
    lua_pushnumber(L,h->tyx_field);
    lua_rawseti(L,-2,i); i++;
    lua_pushnumber(L,h->tyy_field);
    lua_rawseti(L,-2,i); i++;
  } else {
    lua_pushnil(L);
  }
}

static char *fill_fields[] = { "type", "path", "htap", "pen", "color", "ljoin", "miterlim", "prescript", "postscript", NULL };

#define FIELD(A) (strcmp(field,#A)==0)

static void 
mplib_fill_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (FIELD(type)) {
    lua_pushstring(L,"fill");
  } else if (FIELD(path)) {
    mplib_push_path(L, h->path_p_field);
  } else if (FIELD(htap)) {
    mplib_push_path(L, h->htap_p_field);
  } else if (FIELD(pen)) {
    mplib_push_path(L, h->pen_p_field);
  } else if (FIELD(color)) {
    mplib_push_color(L, h);
  } else if (FIELD(ljoin)) {
    lua_pushnumber(L,h->ljoin_field);
  } else if (FIELD(miterlim)) {
    lua_pushnumber(L,h->miterlim_field);
  } else if (FIELD(prescript)) {
    lua_pushstring(L,h->pre_script_field);
  } else if (FIELD(postscript)) {
    lua_pushstring(L,h->post_script_field);
  } else {
    lua_pushnil(L);
  }
}

static char *stroked_fields[] = {"type", "path", "pen", "color", "ljoin", "miterlim", "lcap", "dash", "prescript", "postscript", NULL };

static void 
mplib_stroked_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (FIELD(type)) {
    lua_pushstring(L,"stroked");
  } else if (FIELD(path)) {
    mplib_push_path(L, h->path_p_field);
  } else if (FIELD(pen)) {
    mplib_push_path(L, h->pen_p_field);
  } else if (FIELD(color)) {
    mplib_push_color(L, h);
  } else if (FIELD(dash)) {
    mplib_push_dash(L, h);
  } else if (FIELD(lcap)) {
    lua_pushnumber(L,h->lcap_field);
  } else if (FIELD(ljoin)) {
    lua_pushnumber(L,h->ljoin_field);
  } else if (FIELD(miterlim)) {
    lua_pushnumber(L,h->miterlim_field);
  } else if (FIELD(prescript)) {
    lua_pushstring(L,h->pre_script_field);
  } else if (FIELD(postscript)) {
    lua_pushstring(L,h->post_script_field);
  } else {
    lua_pushnil(L);
  }
}

static char *text_fields[] = { "type", "text", "nametype" "font", "color", "width", "height", "depth", "transform", "prescript", "postscript", NULL };

/* todo: name_type and font_n do not make sense */

static void 
mplib_text_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (FIELD(type)) {
    lua_pushstring(L,"text");
  } else if (FIELD(text)) {
    lua_pushstring(L,h->text_p_field);
  } else if (FIELD(nametype)) {
    lua_pushnumber(L,h->name_type_field);
  } else if (FIELD(font)) {
    lua_pushnumber(L,h->font_n_field);
  } else if (FIELD(color)) {
    mplib_push_color(L, h);
  } else if (FIELD(width)) {
    lua_pushnumber(L,h->width_field);
  } else if (FIELD(height)) {
    lua_pushnumber(L,h->height_field);
  } else if (FIELD(depth)) {
    lua_pushnumber(L,h->depth_field);
  } else if (FIELD(transform)) {
    mplib_push_transform(L,h);
  } else if (FIELD(prescript)) {
    lua_pushstring(L,h->pre_script_field);
  } else if (FIELD(postscript)) {
    lua_pushstring(L,h->post_script_field);
  } else {
    lua_pushnil(L);
  }
}

static char *special_fields[] = { "type", "prescript", NULL };

static void 
mplib_special_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (FIELD(type)) {
    lua_pushstring(L,"special");
  } else if (FIELD(prescript)) {
    lua_pushstring(L,h->pre_script_field);
  } else {
    lua_pushnil(L);
  }
}

static char *start_bounds_fields[] = { "type", "path", NULL };

static void 
mplib_start_bounds_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (FIELD(type)) {
    lua_pushstring(L,"start_bounds");
  } else if (FIELD(path)) {
    mplib_push_path(L,h->path_p_field);
  } else {
    lua_pushnil(L);
  }
}

static char *start_clip_fields[] = { "type", "path", NULL };

static void 
mplib_start_clip_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (FIELD(type)) {
    lua_pushstring(L,"start_clip");
  } else if (FIELD(path)) {
    mplib_push_path(L,h->path_p_field);
  } else {
    lua_pushnil(L);
  }
}

static char *stop_bounds_fields[] = { "type", NULL };

static void 
mplib_stop_bounds_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (h!=NULL && FIELD(type)) {
    lua_pushstring(L,"stop_bounds");
  } else {
    lua_pushnil(L);
  }
}

static char *stop_clip_fields[] = { "type", NULL };

static void 
mplib_stop_clip_field (lua_State *L, struct mp_graphic_object *h, char *field) {
  if (h!=NULL && FIELD(type)) {
    lua_pushstring(L,"stop_clip");
  } else {
    lua_pushnil(L);
  }
}

static char *no_fields[] =  { NULL };

static int
mplib_gr_fields (lua_State *L) {
  char **fields;
  char *f;
  int i = 1;
  struct mp_graphic_object **hh = is_gr_object(L,1);
  if (*hh) {
    switch ((*hh)->_type_field) {
    case mp_fill_code:         fields = fill_fields;         break;
    case mp_stroked_code:      fields = stroked_fields;      break;
    case mp_text_code:         fields = text_fields;         break;
    case mp_special_code:      fields = special_fields;      break;
    case mp_start_clip_code:   fields = start_clip_fields;   break;
    case mp_start_bounds_code: fields = start_bounds_fields; break;
    case mp_stop_clip_code:    fields = stop_clip_fields;    break;
    case mp_stop_bounds_code:  fields = stop_bounds_fields;  break;
    default:                   fields = no_fields;
    }
    lua_newtable(L);
    for (f = *fields; f != NULL; f++) {
      lua_pushstring(L,f);
      lua_rawseti(L,-2,i); i++;
    }
  } else {
    lua_pushnil(L);
  }
  return 1;
}

static int
mplib_gr_index (lua_State *L) {
  struct mp_graphic_object **hh = is_gr_object(L,1);
  char *field = (char *)luaL_checkstring(L,2);
  if (*hh) {
    switch ((*hh)->_type_field) {
    case mp_fill_code:         mplib_fill_field(L,*hh,field);         break;
    case mp_stroked_code:      mplib_stroked_field(L,*hh,field);      break;
    case mp_text_code:         mplib_text_field(L,*hh,field);         break;
    case mp_special_code:      mplib_special_field(L,*hh,field);      break;
    case mp_start_clip_code:   mplib_start_clip_field(L,*hh,field);   break;
    case mp_start_bounds_code: mplib_start_bounds_field(L,*hh,field); break;
    case mp_stop_clip_code:    mplib_stop_clip_field(L,*hh,field);    break;
    case mp_stop_bounds_code:  mplib_stop_bounds_field(L,*hh,field);  break;
    default:                   lua_pushnil(L);
    }    
  } else {
    lua_pushnil(L);
  }
  return 1;
}


static const struct luaL_reg mplib_meta[] = {
  {"__gc",               mplib_collect}, 
  {"__tostring",         mplib_tostring},
  {NULL, NULL}                /* sentinel */
};

static const struct luaL_reg mplib_fig_meta[] = {
  {"__gc",               mplib_fig_collect    },
  {"__tostring",         mplib_fig_tostring   },
  {"objects",            mplib_fig_body       },
  {"postscript",         mplib_fig_postscript },
  {"boundingbox",        mplib_fig_bb         },
  {NULL, NULL}                /* sentinel */
};

static const struct luaL_reg mplib_gr_meta[] = {
  {"__gc",               mplib_gr_collect  },
  {"__tostring",         mplib_gr_tostring },
  {"fields",             mplib_gr_fields   },
  {"__index",            mplib_gr_index    },
  {NULL, NULL}                /* sentinel */
};


static const struct luaL_reg mplib_d [] = {
  {"run",                mplib_run },
  {"execute",            mplib_execute },
  {"finish",             mplib_finish },
  {NULL, NULL}  /* sentinel */
};


static const struct luaL_reg mplib_m[] = {
  {"new",               mplib_new},
  {NULL, NULL}                /* sentinel */
};


int 
luaopen_mp (lua_State *L) {
  luaL_newmetatable(L,MPLIB_GR_METATABLE);
  lua_pushvalue(L, -1); /* push metatable */
  lua_setfield(L, -2, "__index"); /* metatable.__index = metatable */
  luaL_register(L, NULL, mplib_gr_meta);  /* object meta methods */
  lua_pop(L,1);

  luaL_newmetatable(L,MPLIB_FIG_METATABLE);
  lua_pushvalue(L, -1); /* push metatable */
  lua_setfield(L, -2, "__index"); /* metatable.__index = metatable */
  luaL_register(L, NULL, mplib_fig_meta);  /* figure meta methods */
  lua_pop(L,1);

  luaL_newmetatable(L,MPLIB_METATABLE);
  lua_pushvalue(L, -1); /* push metatable */
  lua_setfield(L, -2, "__index"); /* metatable.__index = metatable */
  luaL_register(L, NULL, mplib_meta);  /* meta methods */
  luaL_register(L, NULL, mplib_d);  /* dict methods */
  luaL_register(L, "mp", mplib_m); /* module functions */
  return 1;
}

