% $Id: mp.web,v 1.8 2005/08/24 10:54:02 taco Exp $
% MetaPost, by John Hobby.  Public domain.

% Much of this program was copied with permission from MF.web Version 1.9
% It interprets a language very similar to D.E. Knuth's METAFONT, but with
% changes designed to make it more suitable for PostScript output.

% TeX is a trademark of the American Mathematical Society.
% METAFONT is a trademark of Addison-Wesley Publishing Company.
% PostScript is a trademark of Adobe Systems Incorporated.

% Here is TeX material that gets inserted after \input webmac
\def\hang{\hangindent 3em\noindent\ignorespaces}
\def\textindent#1{\hangindent2.5em\noindent\hbox to2.5em{\hss#1 }\ignorespaces}
\def\PASCAL{Pascal}
\def\ps{PostScript}
\def\ph{\hbox{Pascal-H}}
\def\psqrt#1{\sqrt{\mathstrut#1}}
\def\k{_{k+1}}
\def\pct!{{\char`\%}} % percent sign in ordinary text
\font\tenlogo=logo10 % font used for the METAFONT logo
\font\logos=logosl10
\def\MF{{\tenlogo META}\-{\tenlogo FONT}}
\def\MP{{\tenlogo META}\-{\tenlogo POST}}
\def\<#1>{$\langle#1\rangle$}
\def\section{\mathhexbox278}
\let\swap=\leftrightarrow
\def\round{\mathop{\rm round}\nolimits}
\mathchardef\vb="026A % synonym for `\|'
\def\[#1]{} % from pascal web
\def\(#1){} % this is used to make section names sort themselves better
\def\9#1{} % this is used for sort keys in the index via @@:sort key}{entry@@>

\let\?=\relax % we want to be able to \write a \?

\def\title{MetaPost \ps\ output}
\def\topofcontents{\hsize 5.5in
  \vglue -30pt plus 1fil minus 1.5in
  \def\?##1]{\hbox to 1in{\hfil##1.\ }}
  }
\def\botofcontents{\vskip 0pt plus 1fil minus 1.5in}
\pdfoutput=1
\pageno=3

@ 
@d true 1
@d false 0
@d null_font 0
@d print_err(A) mp_print_err(mp,(A))
@d negate(A)   (A)=-(A) /* change the sign of a variable */

@c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <assert.h>
#include "avl.h"
#include "mplib.h"
#include "mpmp.h" /* internal header */
#include "mppsout.h" /* internal header */
@h
@<Declarations@>;
@<Static variables in the outer block@>;

@ There is a small bit of code from the backend that bleads through
to the frontend because I do not know how to set up the includes
properly. Those are the definitions of |struct libavl_allocator|
and |typedef struct psout_data_struct * psout_data|.

The |libavl_allocator| is a trick that makes sure that frontends 
do not need |avl.h|, and the |psout_data| is needed for the backend 
data structure.

@ @(mppsout.h@>=
@<Types...@>;
typedef struct psout_data_struct {
  @<Globals@>;
} psout_data_struct ;
@<Exported function headers@>

@ @<Exported function headers@>=
void mp_backend_initialize (MP mp) ;
void mp_backend_free (MP mp) ;

@
@c void mp_backend_initialize (MP mp) {
  mp->ps = mp_xmalloc(1,sizeof(psout_data_struct));
  @<Set initial values@>;
}
void mp_backend_free (MP mp) {
  @<Dealloc variables@>;
  enc_free(mp);
  t1_free(mp);
  fm_free(mp);
  mp_xfree(mp->ps);
  mp->ps = NULL;
}


@* Traditional {psfonts.map} loading.

TODO: It is likely that this code can be removed after a few minor tweaks.

@ The file |ps_tab_file| gives a table of \TeX\ font names and corresponding
PostScript names for fonts that do not have to be downloaded, i.e., fonts that
can be used when |internal[prologues]>0|.  Each line consists of a \TeX\ name,
one or more spaces, a PostScript name, and possibly a space and some other junk.
This routine reads the table, updates |font_ps_name| entries starting after
|last_ps_fnum|, and sets |last_ps_fnum:=last_fnum|.  If the file |ps_tab_file|
is missing, we assume that the existing font names are OK and nothing needs to
be done.

@d ps_tab_name "psfonts.map"  /* locates font name translation table */

@<Exported ...@>=
void mp_read_psname_table (MP mp) ;

@ @c void mp_read_psname_table (MP mp) {
  font_number k; /* font for possible name match */
  unsigned int lmax; /* upper limit on length of name to match */
  unsigned int j; /* characters left to read before string gets too long */
  char *s; /* possible font name to match */
  text_char c=0; /* character being read from |ps_tab_file| */
  if ( (mp->ps->ps_tab_file = mp_open_file(mp, ps_tab_name, "r", mp_filetype_fontmap)) ) {
    @<Set |lmax| to the maximum |font_name| length for fonts
      |last_ps_fnum+1| through |last_fnum|@>;
    while (! feof(mp->ps->ps_tab_file) ) {
      @<Read at most |lmax| characters from |ps_tab_file| into string |s|
        but |goto common_ending| if there is trouble@>;
      for (k=mp->last_ps_fnum+1;k<=mp->last_fnum;k++) {
        if ( mp_xstrcmp(s,mp->font_name[k])==0 ) {
          @<|flush_string(s)|, read in |font_ps_name[k]|, and
            |goto common_ending|@>;
        }
      }
      mp_xfree(s);
    COMMON_ENDING:
      c = fgetc(mp->ps->ps_tab_file);
	  if (c=='\r') {
        c = fgetc(mp->ps->ps_tab_file);
        if (c!='\n') 
          ungetc(c,mp->ps->ps_tab_file);
      }
    }
    mp->last_ps_fnum=mp->last_fnum;
    fclose(mp->ps->ps_tab_file);
  }
}

@ @<Glob...@>=
FILE * ps_tab_file; /* file for font name translation table */

@ @<Set |lmax| to the maximum |font_name| length for fonts...@>=
lmax=0;
for (k=mp->last_ps_fnum+1;k<=mp->last_fnum;k++) {
  if (strlen(mp->font_name[k])>lmax ) 
    lmax=strlen(mp->font_name[k]);
}

@ If we encounter the end of line before we have started reading
characters from |ps_tab_file|, we have found an entirely blank 
line and we skip over it.  Otherwise, we abort if the line ends 
prematurely.  If we encounter a comment character, we also skip 
over the line, since recent versions of \.{dvips} allow comments
in the font map file.

TODO: this is probably not safe in the case of a really 
broken font map file.

@<Read at most |lmax| characters from |ps_tab_file| into string |s|...@>=
s=mp_xmalloc(lmax+1,1);
j=0;
while (1) { 
  if (c == '\n' || c == '\r' ) {
    if (j==0) {
      mp_xfree(s); s=NULL; goto COMMON_ENDING;
    } else {
      mp_fatal_error(mp, "The psfont map file is bad!");
    }
  }
  c = fgetc(mp->ps->ps_tab_file);
  if (c=='%' || c=='*' || c==';' || c=='#' ) {
    mp_xfree(s); s=NULL; goto COMMON_ENDING;
  }
  if (c==' ' || c=='\t') break;
  if (j<lmax) {
   s[j++] = mp->xord[c];
  } else { 
    mp_xfree(s); s=NULL; goto COMMON_ENDING;
  }
}
s[j]=0

@ PostScript font names should be at most 28 characters long but we allow 32
just to be safe.

@<|flush_string(s)|, read in |font_ps_name[k]|, and...@>=
{ 
  char *ps_name =NULL;
  mp_xfree(s);
  do {  
    if (c=='\n' || c == '\r') 
      mp_fatal_error(mp, "The psfont map file is bad!");
    c = fgetc(mp->ps->ps_tab_file);
  } while (c==' ' || c=='\t');
  ps_name = mp_xmalloc(33,1);
  j=0;
  do {  
    if (j>31) {
      mp_fatal_error(mp, "The psfont map file is bad!");
    }
    ps_name[j++] = mp->xord[c];
    if (c=='\n' || c == '\r')
      c=' ';  
    else 
      c = fgetc(mp->ps->ps_tab_file);
  } while (c != ' ' && c != '\t');
  ps_name[j]= 0;
  mp_xfree(mp->font_ps_name[k]);
  mp->font_ps_name[k]=ps_name;
  goto COMMON_ENDING;
}



@* \[44a] Dealing with font encodings.

First, here are a few helpers for parsing files

@d check_buf(size, buf_size)
    if ((unsigned)(size) > (unsigned)(buf_size)) {
      char s[128];
      snprintf(s,128,"buffer overflow: (%d,%d) at file %s, line %d",
               size,buf_size, __FILE__,  __LINE__ );
      mp_fatal_error(mp,s);
    }

@d append_char_to_buf(c, p, buf, buf_size) do {
    if (c == 9)
        c = 32;
    if (c == 13 || c == EOF)
        c = 10;
    if (c != ' ' || (p > buf && p[-1] != 32)) {
        check_buf(p - buf + 1, (buf_size));
        *p++ = c; 
    }
} while (0)

@d append_eol(p, buf, buf_size) do {
    check_buf(p - buf + 2, (buf_size));
    if (p - buf > 1 && p[-1] != 10)
        *p++ = 10;
    if (p - buf > 2 && p[-2] == 32) {
        p[-2] = 10;
        p--;
    }
    *p = 0;
} while (0)

@d remove_eol(p, buf) do {
    p = strend(buf) - 1;
    if (*p == 10)
        *p = 0;
} while (0)

@d skip(p, c)   if (*p == c)  p++
@d strend(s)    strchr(s, 0)
@d str_prefix(s1, s2)  (strncmp((s1), (s2), strlen(s2)) == 0)


@ @<Types...@>=
typedef struct {
    boolean loaded;             /* the encoding has been loaded? */
    char *file_name;                 /* encoding file name */
    char *enc_name;              /* encoding true name */
    integer objnum;             /* object number */
    char **glyph_names;
    integer tounicode;          /* object number of associated ToUnicode entry */
} enc_entry;


@ 

@d ENC_STANDARD  0
@d ENC_BUILTIN   1

@<Glob...@>=
#define ENC_BUF_SIZE  0x1000
char enc_line[ENC_BUF_SIZE];
FILE *enc_file;

@ 
@d enc_getchar()   getc(mp->ps->enc_file)
@d enc_eof()       feof(mp->ps->enc_file)
@d enc_close()     fclose(mp->ps->enc_file)

@c 
boolean mp_enc_open (MP mp, char *n) {
  mp->ps->enc_file=mp_open_file(mp, n, "rb", mp_filetype_encoding);
  if (mp->ps->enc_file!=NULL)
    return true;
  else
   return false;
}
void mp_enc_getline (MP mp) {
  char *p;
  int c;
RESTART:
  if (enc_eof ()) {
    print_err("unexpected end of file");
    mp_error(mp);
  }
  p = mp->ps->enc_line;
  do {
    c = enc_getchar ();
    append_char_to_buf (c, p, mp->ps->enc_line, ENC_BUF_SIZE);
  } while (c != 10);
  append_eol (p, mp->ps->enc_line, ENC_BUF_SIZE);
  if (p - mp->ps->enc_line < 2 || *mp->ps->enc_line == '%')
    goto RESTART;
}
void mp_load_enc (MP mp, char *enc_name, 
                  char **enc_encname, char **glyph_names){
  char buf[ENC_BUF_SIZE], *p, *r;
  int names_count;
  char *myname;
  int save_selector = mp->selector;
  if (!mp_enc_open (mp,enc_name)) {
      mp_print (mp,"cannot open encoding file for reading");
      return;
  }
  mp_normalize_selector(mp);
  mp_print (mp,"{");
  mp_print (mp, enc_name);
  mp_enc_getline (mp);
  if (*mp->ps->enc_line != '/' || (r = strchr (mp->ps->enc_line, '[')) == NULL) {
    remove_eol (r, mp->ps->enc_line);
    print_err ("invalid encoding vector (a name or `[' missing): `");
    mp_print(mp,mp->ps->enc_line);
    mp_print(mp,"'");
    mp_error(mp);
  }
  while (*(r-1)==' ') r--; /* strip trailing spaces from encoding name */
  myname = mp_xmalloc(r-mp->ps->enc_line,1);
  memcpy(myname,mp->ps->enc_line+1,(r-mp->ps->enc_line)-1);
  *(myname+(r-mp->ps->enc_line-1))=0;
  *enc_encname = myname;
  while (*r!='[') r++;
  r++;                        /* skip '[' */
  names_count = 0;
  skip (r, ' ');
  for (;;) {
    while (*r == '/') {
      for (p = buf, r++;
           *r != ' ' && *r != 10 && *r != ']' && *r != '/'; *p++ = *r++);
        *p = 0;
      skip (r, ' ');
      if (names_count > 256) {
        print_err ("encoding vector contains more than 256 names");
        mp_error(mp);
      }
      if (mp_xstrcmp (buf, notdef) != 0)
        glyph_names[names_count] = mp_xstrdup (buf);
      names_count++;
    }
    if (*r != 10 && *r != '%') {
      if (str_prefix (r, "] def"))
        goto DONE;
      else {
        remove_eol (r, mp->ps->enc_line);
        print_err
          ("invalid encoding vector: a name or `] def' expected: `");
        mp_print(mp,mp->ps->enc_line);
        mp_print(mp,"'");
        mp_error(mp);
      }
    }
    mp_enc_getline (mp);
    r = mp->ps->enc_line;
  }
DONE:
  enc_close ();
  mp_print (mp,"}");
  mp->selector = save_selector;
}
void mp_read_enc (MP mp, enc_entry * e) {
    if (e->loaded)
        return;
    e->enc_name = NULL;
    mp_load_enc (mp,e->file_name, &e->enc_name, e->glyph_names);
    e->loaded = true;
}

@ |write_enc| is used to write either external encoding (given in map file) or
 internal encoding (read from the font file); when |glyph_names| is NULL
 the 2nd argument is a pointer to the encoding entry; otherwise the 3rd is 
 the object number of the Encoding object
 
@c
void mp_write_enc (MP mp, char **glyph_names, enc_entry * e) {
    int i;
    int s;
    int foffset;
    char **g;
    if (glyph_names == NULL) {
        if (e->objnum != 0)     /* the encoding has been written already */
            return;
        e->objnum = 1;
        g = e->glyph_names;
    } else {
        g = glyph_names;
    }

    mp_print(mp,"\n%%%%BeginResource: encoding ");
    mp_print(mp, e->enc_name);
    mp_print(mp, "\n/");
    mp_print(mp, e->enc_name);
    mp_print(mp, " [ ");
    foffset = strlen(e->file_name)+3;
    for (i = 0; i < 256; i++) {
      s = strlen(g[i]);
      if (s+1+foffset>=80) {
   	    mp_print_ln (mp);
    	foffset = 0;
      }
      foffset += s+2;
      mp_print_char(mp,'/');
      mp_print(mp, g[i]);
      mp_print_char(mp,' ');
    }
    if (foffset>75)
 	   mp_print_ln (mp);
    mp_print_nl (mp,"] def\n");
    mp_print(mp,"%%%%EndResource");
}


@ All encoding entries go into AVL tree for fast search by name.

@<Glob...@>=
struct avl_table *enc_tree;

@ Memory management functions for avl 

@<Static variables in the outer block@>=
static const char notdef[] = ".notdef";

@ @<Declarations@>=
static void *avl_xmalloc (struct libavl_allocator *allocator, size_t size);
static void avl_xfree (struct libavl_allocator *allocator, void *block);

@ @c
static void *avl_xmalloc (struct libavl_allocator *allocator, size_t size) {
    assert(allocator);
    return mp_xmalloc (size,1);
}
static void avl_xfree (struct libavl_allocator *allocator, void *block) {
    assert(allocator);
    mp_xfree (block);
}

@ @<Glob...@>=
struct libavl_allocator avl_xallocator;

@ @<Set initial...@>=
mp->ps->avl_xallocator.libavl_malloc=avl_xmalloc;
mp->ps->avl_xallocator.libavl_free= avl_xfree;
mp->ps->enc_tree = NULL;

@ @c
static int comp_enc_entry (const void *pa, const void *pb, void *p) {
    assert(p==NULL);
    return strcmp (((const enc_entry *) pa)->file_name,
                   ((const enc_entry *) pb)->file_name);
}
enc_entry * mp_add_enc (MP mp, char *s) {
    int i;
    enc_entry tmp, *p;
    void **aa;
    if (mp->ps->enc_tree == NULL) {
      mp->ps->enc_tree = avl_create (comp_enc_entry, NULL, &mp->ps->avl_xallocator);
    }
    tmp.file_name = s;
    p = (enc_entry *) avl_find (mp->ps->enc_tree, &tmp);
    if (p != NULL)              /* encoding already registered */
        return p;
    p = mp_xmalloc (1,sizeof (enc_entry));
    p->loaded = false;
    p->file_name = mp_xstrdup (s);
    p->objnum = 0;
    p->tounicode = 0;
    p->glyph_names = mp_xmalloc (256,sizeof (char *));
    for (i = 0; i < 256; i++)
        p->glyph_names[i] = (char *) notdef;
    aa = avl_probe (mp->ps->enc_tree, p);
    return p;
}

@ cleaning up... 

@c 
static void mp_destroy_enc_entry (void *pa, void *pb) {
    enc_entry *p;
    int i;

    p = (enc_entry *) pa;
    assert(pb==NULL);
    mp_xfree (p->file_name);
    if (p->glyph_names != NULL)
        for (i = 0; i < 256; i++)
            if (p->glyph_names[i] != notdef)
                mp_xfree (p->glyph_names[i]);
    mp_xfree (p->glyph_names);
    mp_xfree (p);
}

@ @<Declarations@>=
static void enc_free (MP mp);

@ @c static void enc_free (MP mp) {
    if (mp->ps->enc_tree != NULL)
      avl_destroy (mp->ps->enc_tree, mp_destroy_enc_entry);
}

@ @<Exported function headers@>=
void mp_load_encodings (MP mp, int lastfnum) ;
void mp_font_encodings (MP mp, int lastfnum, int encodings_only) ;

@ @c void mp_load_encodings (MP mp, int lastfnum) {
  int f;
  enc_entry *e;
  fm_entry *fm_cur;
  for (f=null_font+1;f<=lastfnum;f++) {
    if (mp_has_font_size(mp,f) && mp_has_fm_entry (mp,f,&fm_cur)) { 
      if (fm_cur != NULL && 
	  fm_cur->ps_name != NULL &&
	  is_reencoded (fm_cur)) {
		e = fm_cur->encoding;
		mp_read_enc (mp,e);
      }
    }
  }
}
void mp_font_encodings (MP mp, int lastfnum, int encodings_only) {
  int f;
  enc_entry *e;
  fm_entry *fm;
  for (f=null_font+1;f<=lastfnum;f++) {
    if (mp_has_font_size(mp,f) && mp_has_fm_entry (mp,f, &fm)) { 
      if (fm != NULL && (fm->ps_name != NULL)) {
	if (is_reencoded (fm)) {
	  if (encodings_only || (!is_subsetted (fm))) {
	    e = fm->encoding;
	    mp_write_enc (mp,NULL, e);
            /* clear for next run */
            e->objnum = 0;
	  }
	}
      }
    }
  }
}

@* \[44b] Parsing font map files.

@d FM_BUF_SIZE     1024

@<Glob...@>=
FILE *fm_file;

@
@d fm_close()      fclose(mp->ps->fm_file)
@d fm_getchar()    fgetc(mp->ps->fm_file)
@d fm_eof()        feof(mp->ps->fm_file)

@<Types...@>=
enum _mode { FM_DUPIGNORE, FM_REPLACE, FM_DELETE };
enum _ltype { MAPFILE, MAPLINE };
enum _tfmavail { TFM_UNCHECKED, TFM_FOUND, TFM_NOTFOUND };
typedef struct mitem {
    int mode;                   /* |FM_DUPIGNORE| or |FM_REPLACE| or |FM_DELETE| */
    int type;                   /* map file or map line */
    char *map_line;              /* pointer to map file name or map line */
    int lineno;                 /* line number in map file */
} mapitem;

@ @<Glob...@>=
mapitem *mitem;
fm_entry *fm_cur;
fm_entry *loaded_tfm_found;
fm_entry *avail_tfm_found;
fm_entry *non_tfm_found;
fm_entry *not_avail_tfm_found;

@ @<Set initial...@>=
mp->ps->mitem = NULL;

@ @<Declarations@>=
static const char nontfm[] = "<nontfm>";

@
@d read_field(r, q, buf) do {
    q = buf;
    while (*r != ' ' && *r != '\0')
        *q++ = *r++;
    *q = '\0';
    skip (r, ' ');
} while (0)

@d set_field(F) do {
    if (q > buf)
        fm->F = mp_xstrdup(buf);
    if (*r == '\0')
        goto DONE;
} while (0)

@d cmp_return(a, b)
    if (a > b)
        return 1;
    if (a < b)
        return -1

@c
static fm_entry *new_fm_entry (void) {
    fm_entry *fm;
    fm = mp_xmalloc (1,sizeof(fm_entry));
    fm->tfm_name = NULL;
    fm->ps_name = NULL;
    fm->flags = 4;
    fm->ff_name = NULL;
    fm->subset_tag = NULL;
    fm->encoding = NULL;
    fm->tfm_num = null_font;
    fm->tfm_avail = TFM_UNCHECKED;
    fm->type = 0;
    fm->slant = 0;
    fm->extend = 0;
    fm->ff_objnum = 0;
    fm->fn_objnum = 0;
    fm->fd_objnum = 0;
    fm->charset = NULL;
    fm->all_glyphs = false;
    fm->links = 0;
    fm->pid = -1;
    fm->eid = -1;
    return fm;
}

static void delete_fm_entry (fm_entry * fm) {
    mp_xfree (fm->tfm_name);
    mp_xfree (fm->ps_name);
    mp_xfree (fm->ff_name);
    mp_xfree (fm->subset_tag);
    mp_xfree (fm->charset);
    mp_xfree (fm);
}

static ff_entry *new_ff_entry (void) {
    ff_entry *ff;
    ff = mp_xmalloc (1,sizeof(ff_entry));
    ff->ff_name = NULL;
    ff->ff_path = NULL;
    return ff;
}

static void delete_ff_entry (ff_entry * ff) {
    mp_xfree (ff->ff_name);
    mp_xfree (ff->ff_path);
    mp_xfree (ff);
}

static char *mk_base_tfm (MP mp, char *tfmname, int *i) {
    static char buf[SMALL_BUF_SIZE];
    char *p = tfmname, *r = strend (p) - 1, *q = r;
    while (q > p && isdigit (*q))
        --q;
    if (!(q > p) || q == r || (*q != '+' && *q != '-'))
        return NULL;
    check_buf (q - p + 1, SMALL_BUF_SIZE);
    strncpy (buf, p, (size_t) (q - p));
    buf[q - p] = '\0';
    *i = atoi (q);
    return buf;
}

@ @<Exported function headers@>=
boolean mp_has_fm_entry (MP mp,font_number f, fm_entry **fm);

@ @c
boolean mp_has_fm_entry (MP mp,font_number f, fm_entry **fm) {
    fm_entry *res = NULL;
    res = mp_fm_lookup (mp, f);
    if (fm != NULL) {
       *fm =res;
    }
    return (res != NULL);
}

@ @<Glob...@>=
struct avl_table *tfm_tree;
struct avl_table *ps_tree;
struct avl_table *ff_tree;

@ @<Set initial...@>=
mp->ps->tfm_tree = NULL;
mp->ps->ps_tree = NULL;
mp->ps->ff_tree = NULL;

@ AVL sort |fm_entry| into |tfm_tree| by |tfm_name |

@c
static int comp_fm_entry_tfm (const void *pa, const void *pb, void *p) {
    assert(p==NULL);
    return strcmp (((const fm_entry *) pa)->tfm_name,
                   ((const fm_entry *) pb)->tfm_name);
}

@ AVL sort |fm_entry| into |ps_tree| by |ps_name|, |slant|, and |extend|

@c static int comp_fm_entry_ps (const void *pa, const void *pb, void *p) {
    assert(p==NULL);
    const fm_entry *p1 = (const fm_entry *) pa, *p2 = (const fm_entry *) pb;
    int i;
    assert (p1->ps_name != NULL && p2->ps_name != NULL);
    if ((i = strcmp (p1->ps_name, p2->ps_name)))
        return i;
    cmp_return (p1->slant, p2->slant);
    cmp_return (p1->extend, p2->extend);
    if (p1->tfm_name != NULL && p2->tfm_name != NULL &&
        (i = strcmp (p1->tfm_name, p2->tfm_name)))
        return i;
    return 0;
}

@ AVL sort |ff_entry| into |ff_tree| by |ff_name|

@c static int comp_ff_entry (const void *pa, const void *pb, void *p) {
    assert(p==NULL);
    return strcmp (((const ff_entry *) pa)->ff_name,
                   ((const ff_entry *) pb)->ff_name);
}

@ @c static void create_avl_trees (MP mp) {
    if (mp->ps->tfm_tree == NULL) {
        mp->ps->tfm_tree = avl_create (comp_fm_entry_tfm, NULL, &mp->ps->avl_xallocator);
        assert (mp->ps->tfm_tree != NULL);
    }
    if (mp->ps->ps_tree == NULL) {
        mp->ps->ps_tree = avl_create (comp_fm_entry_ps, NULL, &mp->ps->avl_xallocator);
        assert (mp->ps->ps_tree != NULL);
    }
    if (mp->ps->ff_tree == NULL) {
        mp->ps->ff_tree = avl_create (comp_ff_entry, NULL, &mp->ps->avl_xallocator);
        assert (mp->ps->ff_tree != NULL);
    }
}

@ The function |avl_do_entry| is not completely symmetrical with regards
to |tfm_name| and |ps_name handling|, e. g. a duplicate |tfm_name| gives a
|goto exit|, and no |ps_name| link is tried. This is to keep it compatible
with the original version.

@d LINK_TFM            0x01
@d LINK_PS             0x02
@d set_tfmlink(fm)     ((fm)->links |= LINK_TFM)
@d set_pslink(fm)      ((fm)->links |= LINK_PS)
@d unset_tfmlink(fm)   ((fm)->links &= ~LINK_TFM)
@d unset_pslink(fm)    ((fm)->links &= ~LINK_PS)
@d has_tfmlink(fm)     ((fm)->links & LINK_TFM)
@d has_pslink(fm)      ((fm)->links & LINK_PS)

@c
static int avl_do_entry (MP mp, fm_entry * fp, int mode) {
    fm_entry *p;
    void *a;
    void **aa;
    char s[128];

    /* handle |tfm_name| link */

    if (strcmp (fp->tfm_name, nontfm)) {
        p = (fm_entry *) avl_find (mp->ps->tfm_tree, fp);
        if (p != NULL) {
            if (mode == FM_DUPIGNORE) {
               snprintf(s,128,"fontmap entry for `%s' already exists, duplicates ignored",
                     fp->tfm_name);
                mp_warn(mp,s);
                goto exit;
            } else {            /* mode == |FM_REPLACE| / |FM_DELETE| */
                if (mp_has_font_size(mp,p->tfm_num)) {
                    snprintf(s,128,
                        "fontmap entry for `%s' has been used, replace/delete not allowed",
                         fp->tfm_name);
                    mp_warn(mp,s);
                    goto exit;
                }
                a = avl_delete (mp->ps->tfm_tree, p);
                assert (a != NULL);
                unset_tfmlink (p);
                if (!has_pslink (p))
                    delete_fm_entry (p);
            }
        }
        if (mode != FM_DELETE) {
            aa = avl_probe (mp->ps->tfm_tree, fp);
            assert (aa != NULL);
            set_tfmlink (fp);
        }
    }

    /* handle |ps_name| link */

    if (fp->ps_name != NULL) {
        assert (fp->tfm_name != NULL);
        p = (fm_entry *) avl_find (mp->ps->ps_tree, fp);
        if (p != NULL) {
            if (mode == FM_DUPIGNORE) {
                snprintf(s,128,
                    "ps_name entry for `%s' already exists, duplicates ignored",
                     fp->ps_name);
                mp_warn(mp,s);
                goto exit;
            } else {            /* mode == |FM_REPLACE| / |FM_DELETE| */
                if (mp_has_font_size(mp,p->tfm_num)) {
                    /* REPLACE/DELETE not allowed */
                    snprintf(s,128,
                        "fontmap entry for `%s' has been used, replace/delete not allowed",
                         p->tfm_name);
                    mp_warn(mp,s);
                    goto exit;
                }
                a = avl_delete (mp->ps->ps_tree, p);
                assert (a != NULL);
                unset_pslink (p);
                if (!has_tfmlink (p))
                    delete_fm_entry (p);
            }
        }
        if (mode != FM_DELETE) {
            aa = avl_probe (mp->ps->ps_tree, fp);
            assert (aa != NULL);
            set_pslink (fp);
        }
    }
  exit:
    if (!has_tfmlink (fp) && !has_pslink (fp))  /* e. g. after |FM_DELETE| */
        return 1;               /* deallocation of |fm_entry| structure required */
    else
        return 0;
}

@ consistency check for map entry, with warn flag 

@c
static int check_fm_entry (MP mp, fm_entry * fm, boolean warn) {
    int a = 0;
    char s[128];
    assert (fm != NULL);
    if (fm->ps_name != NULL) {
        if (is_basefont (fm)) {
            if (is_fontfile (fm) && !is_included (fm)) {
                if (warn) {
                    snprintf(s,128, "invalid entry for `%s': "
                         "font file must be included or omitted for base fonts",
                         fm->tfm_name);
                    mp_warn(mp,s);
                }
                a += 1;
            }
        } else {                /* not a base font */
            /* if no font file given, drop this entry */
            /* |if (!is_fontfile (fm)) {
	         if (warn) {
                   snprintf(s,128, 
                        "invalid entry for `%s': font file missing",
						fm->tfm_name);
                    mp_warn(mp,s);
                 }
                a += 2;
            }|
	    */
        }
    }
    if (is_truetype (fm) && is_reencoded (fm) && !is_subsetted (fm)) {
        if (warn) {
            snprintf(s,128, 
                "invalid entry for `%s': only subsetted TrueType font can be reencoded",
                 fm->tfm_name);
                    mp_warn(mp,s);
        }
        a += 4;
    }
    if ((fm->slant != 0 || fm->extend != 0) &&
        (is_truetype (fm))) {
        if (warn) { 
           snprintf(s,128, 
                 "invalid entry for `%s': " 
                 "SlantFont/ExtendFont can be used only with embedded T1 fonts",
                 fm->tfm_name);
                    mp_warn(mp,s);
        }
        a += 8;
    }
    if (abs (fm->slant) > 1000) {
        if (warn) {
            snprintf(s,128, 
                "invalid entry for `%s': too big value of SlantFont (%g)",
                 fm->tfm_name, fm->slant / 1000.0);
                    mp_warn(mp,s);
        }
        a += 16;
    }
    if (abs (fm->extend) > 2000) {
        if (warn) {
            snprintf(s,128, 
                "invalid entry for `%s': too big value of ExtendFont (%g)",
                 fm->tfm_name, fm->extend / 1000.0);
                    mp_warn(mp,s);
        }
        a += 32;
    }
    if (fm->pid != -1 &&
        !(is_truetype (fm) && is_included (fm) &&
          is_subsetted (fm) && !is_reencoded (fm))) {
        if (warn) {
            snprintf(s,128, 
                "invalid entry for `%s': "
                 "PidEid can be used only with subsetted non-reencoded TrueType fonts",
                 fm->tfm_name);
                    mp_warn(mp,s);
        }
        a += 64;
    }
    return a;
}

@ returns true if s is one of the 14 std. font names; speed-trimmed. 

@c static boolean check_basefont (char *s) {
    static const char *basefont_names[] = {
        "Courier",              /* 0:7 */
        "Courier-Bold",         /* 1:12 */
        "Courier-Oblique",      /* 2:15 */
        "Courier-BoldOblique",  /* 3:19 */
        "Helvetica",            /* 4:9 */
        "Helvetica-Bold",       /* 5:14 */
        "Helvetica-Oblique",    /* 6:17 */
        "Helvetica-BoldOblique",        /* 7:21 */
        "Symbol",               /* 8:6 */
        "Times-Roman",          /* 9:11 */
        "Times-Bold",           /* 10:10 */
        "Times-Italic",         /* 11:12 */
        "Times-BoldItalic",     /* 12:16 */
        "ZapfDingbats"          /* 13:12 */
    };
    static const int Index[] =
        { -1, -1, -1, -1, -1, -1, 8, 0, -1, 4, 10, 9, -1, -1, 5, 2, 12, 6,
        -1, 3, -1, 7
    };
    const size_t n = strlen (s);
    int k = -1;
    if (n > 21)
        return false;
    if (n == 12) {              /* three names have length 12 */
        switch (*s) {
        case 'C':
            k = 1;              /* Courier-Bold */
            break;
        case 'T':
            k = 11;             /* Times-Italic */
            break;
        case 'Z':
            k = 13;             /* ZapfDingbats */
            break;
        default:
            return false;
        }
    } else
        k = Index[n];
    if (k > -1 && !strcmp (basefont_names[k], s))
        return true;
    return false;
};

@ 
@d is_cfg_comment(c) (c == 10 || c == '*' || c == '#' || c == ';' || c == '%')

@c static void fm_scan_line (MP mp) {
    int a, b, c, j, u = 0, v = 0;
    float d;
    fm_entry *fm;
    char fm_line[FM_BUF_SIZE], buf[FM_BUF_SIZE];
    char *p, *q, *r, *s;
    char warn_s[128];
    switch (mp->ps->mitem->type) {
    case MAPFILE:
        p = fm_line;
        do {
            c = fm_getchar ();
            append_char_to_buf (c, p, fm_line, FM_BUF_SIZE);
        }
        while (c != 10);
        *(--p) = '\0';
        r = fm_line;
        break;
    case MAPLINE:
        r = mp->ps->mitem->map_line;
        break;
    default:
        assert (0);
    }
    if (*r == '\0' || is_cfg_comment (*r))
        return;
    fm = new_fm_entry ();
    read_field (r, q, buf);
    set_field (tfm_name);
    p = r;
    read_field (r, q, buf);
    if (*buf != '<' && *buf != '"')
        set_field (ps_name);
    else
        r = p;                  /* unget the field */
    if (isdigit (*r)) {         /* font flags given */
        fm->flags = atoi (r);
        while (isdigit (*r))
            r++;
    }
    while (1) {                 /* loop through "specials", encoding, font file */
        skip (r, ' ');
        switch (*r) {
        case '\0':
            goto DONE;
        case '"':              /* opening quote */
            r++;
            u = v = 0;
            do {
                skip (r, ' ');
                if (sscanf (r, "%f %n", &d, &j) > 0) {
                    s = r + j;  /* jump behind number, eat also blanks, if any */
                    if (*(s - 1) == 'E' || *(s - 1) == 'e')
                        s--;    /* e. g. 0.5ExtendFont: \%f = 0.5E */
                    if (str_prefix (s, "SlantFont")) {
                        d *= 1000.0;    /* correct rounding also for neg. numbers */
                        fm->slant = (integer) (d > 0 ? d + 0.5 : d - 0.5);
                        r = s + strlen ("SlantFont");
                    } else if (str_prefix (s, "ExtendFont")) {
                        d *= 1000.0;
                        fm->extend = (integer) (d > 0 ? d + 0.5 : d - 0.5);
                        if (fm->extend == 1000)
                            fm->extend = 0;
                        r = s + strlen ("ExtendFont");
                    } else {    /* unknown name */
                        for (r = s; 
                             *r != ' ' && *r != '"' && *r != '\0'; 
                             r++); /* jump over name */
                        c = *r; /* remember char for temporary end of string */
                        *r = '\0';
                        snprintf(warn_s,128,
                            "invalid entry for `%s': unknown name `%s' ignored",
                             fm->tfm_name, s);
                        mp_warn(mp,warn_s);
                        *r = c;
                    }
                } else
                    for (; *r != ' ' && *r != '"' && *r != '\0'; r++);
            }
            while (*r == ' ');
            if (*r == '"')      /* closing quote */
                r++;
            else {
                snprintf(warn_s,128,
                    "invalid entry for `%s': closing quote missing",
                     fm->tfm_name);
                mp_warn(mp,warn_s);
                goto bad_line;
            }
            break;
        case 'P':              /* handle cases for subfonts like 'PidEid=3,1' */
            if (sscanf (r, "PidEid=%i, %i %n", &a, &b, &c) >= 2) {
                fm->pid = a;
                fm->eid = b;
                r += c;
                break;
            }
        default:               /* encoding or font file specification */
            a = b = 0;
            if (*r == '<') {
                a = *r++;
                if (*r == '<' || *r == '[')
                    b = *r++;
            }
            read_field (r, q, buf);
            /* encoding, formats: '8r.enc' or '<8r.enc' or '<[8r.enc' */
            if (strlen (buf) > 4 && strcasecmp (strend (buf) - 4, ".enc") == 0) {
                fm->encoding = mp_add_enc (mp, buf);
                u = v = 0;      /* u, v used if intervening blank: "<< foo" */
            } else if (strlen (buf) > 0) {      /* file name given */
                /* font file, formats:
                 * subsetting:    '<cmr10.pfa'
                 * no subsetting: '<<cmr10.pfa'
                 * no embedding:  'cmr10.pfa'
                 */
                if (a == '<' || u == '<') {
		  set_included (fm);
		  if ((a == '<' && b == 0) || (a == 0 && v == 0))
		    set_subsetted (fm);
		  /* otherwise b == '<' (or '[') => no subsetting */
                }
                set_field (ff_name);
                u = v = 0;
            } else {
                u = a;
                v = b;
            }
        }
    }
  DONE:
    if (fm->ps_name != NULL && check_basefont (fm->ps_name))
        set_basefont (fm);
    if (is_fontfile (fm)
        && strcasecmp (strend (fm_fontfile (fm)) - 4, ".ttf") == 0)
        set_truetype (fm);
    if (check_fm_entry (mp,fm, true) != 0)
        goto bad_line;
    /*
       Until here the map line has been completely scanned without errors;
       fm points to a valid, freshly filled-out |fm_entry| structure.
       Now follows the actual work of registering/deleting.
     */
    if (avl_do_entry (mp, fm, mp->ps->mitem->mode) == 0)    /* if success */
        return;
  bad_line:
    delete_fm_entry (fm);
}

@ 
@c static void fm_read_info (MP mp) {
    char *n;
    char s[256];
    if (mp->ps->tfm_tree == NULL)
        create_avl_trees (mp);
    if (mp->ps->mitem->map_line == NULL)    /* nothing to do */
        return;
    mp->ps->mitem->lineno = 1;
    switch (mp->ps->mitem->type) {
    case MAPFILE:
        n = mp->ps->mitem->map_line;
        mp->ps->fm_file = mp_open_file(mp, n, "r", mp_filetype_fontmap);
        if (!mp->ps->fm_file) {
            snprintf(s,256,"cannot open font map file %s",n);
            mp_warn(mp,s);
        } else {
            int save_selector = mp->selector;
            mp_normalize_selector(mp);
            mp_print (mp, "{");
            mp_print (mp, n);
            while (!fm_eof ()) {
                fm_scan_line (mp);
                mp->ps->mitem->lineno++;
            }
            fm_close ();
            mp_print (mp,"}");
            mp->selector = save_selector;
            mp->ps->fm_file = NULL;
        }
        break;
    case MAPLINE:
        fm_scan_line (mp);
        break;
    default:
        assert (0);
    }
    mp->ps->mitem->map_line = NULL;         /* done with this line */
    return;
}

@ @c 
scaled mp_round_xn_over_d (MP mp, scaled x, integer  n, integer d) {
  boolean positive; /* was |x>=0|? */
  unsigned int t,u; /* intermediate quantities */
  integer v; /* intermediate quantities */
  if ( x>=0 ) {
    positive=true;
  } else { 
    negate(x); positive=false;
  };
  t=(x % 0100000)*n;
  u=(x / 0100000)*n+(t / 0100000);
  v=(u % d)*0100000 + (t % 0100000);
  if ( u / d>=0100000 ) mp->arith_error=true;
  else u=0100000*(u / d) + (v / d);
  v = v % d;
  if ( 2*v >= d )
    u++;
  return ( positive ? u : -u );
}
static fm_entry *mk_ex_fm (MP mp, font_number f, fm_entry * basefm, int ex) {
    fm_entry *fm;
    integer e = basefm->extend;
    if (e == 0)
        e = 1000;
    fm = new_fm_entry ();
    fm->flags = basefm->flags;
    fm->encoding = basefm->encoding;
    fm->type = basefm->type;
    fm->slant = basefm->slant;
    fm->extend = mp_round_xn_over_d (mp, e, 1000 + ex, 1000); 
        /* modify ExtentFont to simulate expansion */
    if (fm->extend == 1000)
        fm->extend = 0;
    fm->tfm_name = mp_xstrdup (mp->font_name[f]);
    if (basefm->ps_name != NULL)
        fm->ps_name = mp_xstrdup (basefm->ps_name);
    fm->ff_name = mp_xstrdup (basefm->ff_name);
    fm->ff_objnum = 0;
    fm->tfm_num = f;
    fm->tfm_avail = TFM_FOUND;
    assert (strcmp (fm->tfm_name, nontfm));
    return fm;
}

@ @c static void init_fm (fm_entry * fm, font_number f) {
    if (fm->tfm_num == null_font ) {
        fm->tfm_num = f;
        fm->tfm_avail = TFM_FOUND;
    }
}

@ @<Declarations@>=
fm_entry * mp_fm_lookup (MP mp, font_number f);

@ @c 
fm_entry * mp_fm_lookup (MP mp, font_number f) {
    char *tfm;
    fm_entry *fm, *exfm;
    fm_entry tmp;
    int ai, e;
    if (mp->ps->tfm_tree == NULL)
        fm_read_info (mp);        /* only to read default map file */
    tfm = mp->font_name[f];
    assert (strcmp (tfm, nontfm));
    /* Look up for full <tfmname>[+-]<expand> */
    tmp.tfm_name = tfm;
    fm = (fm_entry *) avl_find (mp->ps->tfm_tree, &tmp);
    if (fm != NULL) {
        init_fm (fm, f);
        return (fm_entry *) fm;
    }
    tfm = mk_base_tfm (mp, mp->font_name[f], &e);
    if (tfm == NULL)            /* not an expanded font, nothing to do */
        return NULL;

    tmp.tfm_name = tfm;
    fm = (fm_entry *) avl_find (mp->ps->tfm_tree, &tmp);
    if (fm != NULL) {           /* found an entry with the base tfm name, e.g. cmr10 */
        return (fm_entry *) fm; /* font expansion uses the base font */
        /* the following code would be obsolete, as would be |mk_ex_fm| */
        if (!is_t1fontfile (fm) || !is_included (fm)) {
            char s[128];
            snprintf(s,128,
                "font %s cannot be expanded (not an included Type1 font)", tfm);
            mp_warn(mp,s);
            return NULL;
        }
        exfm = mk_ex_fm (mp, f, fm, e);     /* copies all fields from fm except tfm name */
        init_fm (exfm, f);
        ai = avl_do_entry (mp, exfm, FM_DUPIGNORE);
        assert (ai == 0);
        return (fm_entry *) exfm;
    }
    return NULL;
}

@  Early check whether a font file exists. Used e. g. for replacing fonts
   of embedded PDF files: Without font file, the font within the embedded
   PDF-file is used. Search tree |ff_tree| is used in 1st instance, as it
   may be faster than the |kpse_find_file()|, and |kpse_find_file()| is called
   only once per font file name + expansion parameter. This might help
   keeping speed, if many PDF pages with same fonts are to be embedded.

   The |ff_tree| contains only font files, which are actually needed,
   so this tree typically is much smaller than the |tfm_tree| or |ps_tree|.

@c 
static ff_entry *check_ff_exist (MP mp, fm_entry * fm) {
    ff_entry *ff;
    ff_entry tmp;
    void **aa;

    assert (fm->ff_name != NULL);
    tmp.ff_name = fm->ff_name;
    ff = (ff_entry *) avl_find (mp->ps->ff_tree, &tmp);
    if (ff == NULL) {           /* not yet in database */
        ff = new_ff_entry ();
        ff->ff_name = mp_xstrdup (fm->ff_name);
        ff->ff_path = mp_xstrdup (fm->ff_name);
        aa = avl_probe (mp->ps->ff_tree, ff);
        assert (aa != NULL);
    }
    return ff;
}

@ @c 
font_number mp_tfm_lookup (MP mp, char *s, scaled  fs) {
/* looks up for a TFM with name |s| loaded at |fs| size; if found then flushes |s| */
  font_number k;
  if ( fs != 0 ) { /*  should not be used!  */
    for (k = null_font + 1;k<=mp->last_fnum;k++) {
      if ( mp_xstrcmp( mp->font_name[k], s) && (mp->font_sizes[k] == fs) ) {
         mp_xfree(s);
         return k;
      }
    }
  } else {
    for (k = null_font + 1;k<=mp->last_fnum;k++) {
      if ( mp_xstrcmp(mp->font_name[k], s) ) {
        mp_xfree(s);
        return k;
      }
    }
  }
  return null_font;
}

@ Process map file given by its name or map line contents. Items not
beginning with [+-=] flush default map file, if it has not yet been
read. Leading blanks and blanks immediately following [+-=] are ignored.


@c void mp_process_map_item (MP mp, char *s, int type) {
    char *p;
    int mode;
    if (*s == ' ')
        s++;                    /* ignore leading blank */
    switch (*s) {
    case '+':                  /* +mapfile.map, +mapline */
        mode = FM_DUPIGNORE;    /* insert entry, if it is not duplicate */
        s++;
        break;
    case '=':                  /* =mapfile.map, =mapline */
        mode = FM_REPLACE;      /* try to replace earlier entry */
        s++;
        break;
    case '-':                  /* -mapfile.map, -mapline */
        mode = FM_DELETE;       /* try to delete entry */
        s++;
        break;
    default:
        mode = FM_DUPIGNORE;    /* like +, but also: */
        mp->ps->mitem->map_line = NULL;     /* flush default map file name */
    }
    if (*s == ' ')
        s++;                    /* ignore blank after [+-=] */
    p = s;                      /* map item starts here */
    switch (type) {
    case MAPFILE:              /* remove blank at end */
        while (*p != '\0' && *p != ' ')
            p++;
        *p = '\0';
        break;
    case MAPLINE:              /* blank at end allowed */
        break;
    default:
        assert (0);
    }
    if (mp->ps->mitem->map_line != NULL)    /* read default map file first */
        fm_read_info (mp);
    if (*s != '\0') {           /* only if real item to process */
        mp->ps->mitem->mode = mode;
        mp->ps->mitem->type = type;
        mp->ps->mitem->map_line = s;
        fm_read_info (mp);
    }
}

@ @<Exported function headers@>=
void mp_map_file (MP mp, str_number t);
void mp_map_line (MP mp, str_number t);
void mp_init_map_file (MP mp, int is_troff);

@ @c 
void mp_map_file (MP mp, str_number t) {
  char *s = mp_xstrdup(mp_str (mp,t));
  mp_process_map_item (mp, s, MAPFILE);
  mp_xfree (s);
}
void mp_map_line (MP mp, str_number t) {
  char *s = mp_xstrdup(mp_str (mp,t));
  mp_process_map_item (mp, s, MAPLINE);
  mp_xfree (s);
}

@ 
@c void mp_init_map_file (MP mp, int is_troff) {
    
    mp->ps->mitem = mp_xmalloc (1,sizeof(mapitem));
    mp->ps->mitem->mode = FM_DUPIGNORE;
    mp->ps->mitem->type = MAPFILE;
    mp->ps->mitem->map_line = NULL;
    if ((mp->find_file)("mpost.map", "rb", mp_filetype_fontmap) != NULL) {
      mp->ps->mitem->map_line = mp_xstrdup ("mpost.map");
    } else {
      if (is_troff) {
	     mp->ps->mitem->map_line = mp_xstrdup ("troff.map");
      } else {
	     mp->ps->mitem->map_line = mp_xstrdup ("pdftex.map");
      }
    }
}

@ @<Dealloc variables@>=
if (mp->ps->mitem!=NULL) {
  mp_xfree(mp->ps->mitem->map_line);
  mp_xfree(mp->ps->mitem);
}

@ cleaning up... 

@c
static void destroy_fm_entry_tfm (void *pa, void *pb) {
    fm_entry *fm;
    assert(pb==NULL);
    fm = (fm_entry *) pa;
    if (!has_pslink (fm))
        delete_fm_entry (fm);
    else
        unset_tfmlink (fm);
}
static void destroy_fm_entry_ps (void *pa, void *pb) {
    fm_entry *fm;
    assert(pb==NULL);
    fm = (fm_entry *) pa;
    if (!has_tfmlink (fm))
        delete_fm_entry (fm);
    else
        unset_pslink (fm);
}
static void destroy_ff_entry (void *pa, void *pb) {
    ff_entry *ff;
    assert(pb==NULL);
    ff = (ff_entry *) pa;
    delete_ff_entry (ff);
} 

@ @<Declarations@>=
static void fm_free (MP mp);

@ @c
static void fm_free (MP mp) {
    if (mp->ps->tfm_tree != NULL)
        avl_destroy (mp->ps->tfm_tree, destroy_fm_entry_tfm);
    if (mp->ps->ps_tree != NULL)
        avl_destroy (mp->ps->ps_tree, destroy_fm_entry_ps);
    if (mp->ps->ff_tree != NULL)
        avl_destroy (mp->ps->ff_tree, destroy_ff_entry);
}

@* \[44c] Helper functions for Type1 fonts.

@<Types...@>=
typedef char char_entry;
typedef unsigned char  Byte;
typedef Byte  Bytef;

@ @<Glob...@>=
char_entry *char_ptr, *char_array;
size_t char_limit;
char *job_id_string;

@ @<Set initial...@>=
mp->ps->char_array = NULL;
mp->ps->job_id_string = NULL;

@ 
@d SMALL_ARRAY_SIZE    256
@d Z_NULL  0  

@c 
void mp_set_job_id (MP mp, int year, int month, int day, int time) {
    char *name_string, *format_string, *s;
    size_t slen;
    int i;
    if (mp->ps->job_id_string != NULL)
       return;
    if ( mp->job_name==NULL )
       mp->job_name = mp_xstrdup("mpout");
    name_string = mp_xstrdup (mp->job_name);
    format_string = mp_xstrdup (mp->mem_ident);
    slen = SMALL_BUF_SIZE +
        strlen (name_string) +
        strlen (format_string);
    s = mp_xmalloc (slen, sizeof (char));
    i = snprintf (s, slen,
                  "%.4d/%.2d/%.2d %.2d:%.2d %s %s",
                  (year>>16),
                  (month>>16), 
                  (day>>16), 
                  (time>>16) / 60, 
                  (time>>16) % 60,
                  name_string, format_string);
    mp->ps->job_id_string = mp_xstrdup (s);
    mp_xfree (s);
    mp_xfree (name_string);
    mp_xfree (format_string);
}
static void fnstr_append (MP mp, const char *s) {
    size_t l = strlen (s) + 1;
    alloc_array (char, l, SMALL_ARRAY_SIZE);
    strcat (mp->ps->char_ptr, s);
    mp->ps->char_ptr = strend (mp->ps->char_ptr);
}

@ @<Exported function headers@>=
void mp_set_job_id (MP mp, int y, int m, int d, int t) ;

@ @<Dealloc variables@>=
mp_xfree(mp->ps->job_id_string);

@ this is not really a true crc32, but it should be just enough to keep
  subsets prefixes somewhat disjunct

@c
static unsigned long crc32 (int oldcrc, const Byte *buf, int len) {
  unsigned long ret = 0;
  int i;
  if (oldcrc==0)
	ret = (23<<24)+(45<<16)+(67<<8)+89;
  else 
      for (i=0;i<len;i++)
	  ret = (ret<<2)+buf[i];
  return ret;
}
boolean mp_char_marked (MP mp,font_number f, eight_bits c) {
  integer b; /* |char_base[f]| */
  b=mp->char_base[f];
  if ( (c>=mp->font_bc[f])&&(c<=mp->font_ec[f])&&(mp->font_info[b+c].qqqq.b3!=0) )
    return true;
  else
    return false;
}

static void make_subset_tag (MP mp, fm_entry * fm_cur, char **glyph_names, int tex_font)
{
    char tag[7];
    unsigned long crc;
    int i;
    size_t l ;
    if (mp->ps->job_id_string ==NULL)
      mp_fatal_error(mp, "no job id!");
    l = strlen (mp->ps->job_id_string) + 1;
    
    alloc_array (char, l, SMALL_ARRAY_SIZE);
    strcpy (mp->ps->char_array, mp->ps->job_id_string);
    mp->ps->char_ptr = strend (mp->ps->char_array);
    if (fm_cur->tfm_name != NULL) {
        fnstr_append (mp," TFM name: ");
        fnstr_append (mp,fm_cur->tfm_name);
    }
    fnstr_append (mp," PS name: ");
    if (fm_cur->ps_name != NULL)
        fnstr_append (mp,fm_cur->ps_name);
    fnstr_append (mp," Encoding: ");
    if (fm_cur->encoding != NULL && (fm_cur->encoding)->file_name != NULL)
        fnstr_append (mp,(fm_cur->encoding)->file_name);
    else
        fnstr_append (mp,"built-in");
    fnstr_append (mp," CharSet: ");
    for (i = 0; i < 256; i++)
        if (mp_char_marked (mp,tex_font, i) && glyph_names[i] != notdef) {
			if (glyph_names[i]!=NULL) {
			  fnstr_append (mp,"/");
			  fnstr_append (mp,glyph_names[i]);
			}
        }
    if (fm_cur->charset != NULL) {
        fnstr_append (mp," Extra CharSet: ");
        fnstr_append (mp, fm_cur->charset);
    }
    crc = crc32 (0L, Z_NULL, 0);
    crc = crc32 (crc, (Bytef *) mp->ps->char_array, strlen (mp->ps->char_array));
    /* we need to fit a 32-bit number into a string of 6 uppercase chars long;
     * there are 26 uppercase chars ==> each char represents a number in range
     * |0..25|. The maximal number that can be represented by the tag is
     * $26^6 - 1$, which is a number between $2^28$ and $2^29$. Thus the bits |29..31|
     * of the CRC must be dropped out.
     */
    for (i = 0; i < 6; i++) {
        tag[i] = 'A' + crc % 26;
        crc /= 26;
    }
    tag[6] = 0;
    fm_cur->subset_tag = mp_xstrdup (tag);
}



@ 
@d external_enc()      (fm_cur->encoding)->glyph_names
@d is_used_char(c)     mp_char_marked (mp, tex_font, c)
@d end_last_eexec_line() 
    mp->ps->hexline_length = HEXLINE_WIDTH;
    end_hexline(mp); 
    mp->ps->t1_eexec_encrypt = false
@d t1_log(s)           mp_print(mp,(char *)s)
@d t1_putchar(c)       fputc(c, mp->ps_file)
@d embed_all_glyphs(tex_font)  false
@d t1_char(c)          c
@d extra_charset()     mp->ps->dvips_extra_charset
@d update_subset_tag()
@d fixedcontent        true

@<Glob...@>=
#define PRINTF_BUF_SIZE     1024
char *dvips_extra_charset;
char *cur_enc_name;
unsigned char *grid;
char *ext_glyph_names[256];
char print_buf[PRINTF_BUF_SIZE];

@ @<Set initial ...@>=
mp->ps->dvips_extra_charset=NULL;

@ 
@d t1_getchar()    fgetc(mp->ps->t1_file)
@d t1_ungetchar(c) ungetc(c, mp->ps->t1_file)
@d t1_eof()        feof(mp->ps->t1_file)
@d t1_close()      fclose(mp->ps->t1_file)
@d valid_code(c)   (c >= 0 && c < 256)

@<Static variables in the outer block@>=
static const char *standard_glyph_names[256] =
    { notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    "space", "exclam", "quotedbl", "numbersign",
    "dollar", "percent", "ampersand", "quoteright", "parenleft",
    "parenright", "asterisk", "plus", "comma", "hyphen", "period",
    "slash", "zero", "one", "two", "three", "four", "five", "six", "seven",
    "eight", "nine", "colon", "semicolon", "less",
    "equal", "greater", "question", "at", "A", "B", "C", "D", "E", "F",
    "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
    "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "bracketleft",
    "backslash", "bracketright", "asciicircum", "underscore",
    "quoteleft", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
    "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
    "w", "x", "y", "z", "braceleft", "bar", "braceright", "asciitilde",
    notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, "exclamdown", "cent",
    "sterling", "fraction", "yen", "florin", "section", "currency",
    "quotesingle", "quotedblleft", "guillemotleft",
    "guilsinglleft", "guilsinglright", "fi", "fl", notdef, "endash",
    "dagger", "daggerdbl", "periodcentered", notdef,
    "paragraph", "bullet", "quotesinglbase", "quotedblbase",
    "quotedblright", "guillemotright", "ellipsis", "perthousand",
    notdef, "questiondown", notdef, "grave", "acute", "circumflex",
    "tilde", "macron", "breve", "dotaccent", "dieresis", notdef,
    "ring", "cedilla", notdef, "hungarumlaut", "ogonek", "caron", "emdash",
    notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef, notdef,
    notdef, "AE", notdef, "ordfeminine", notdef, notdef,
    notdef, notdef, "Lslash", "Oslash", "OE", "ordmasculine", notdef,
    notdef, notdef, notdef, notdef, "ae", notdef, notdef,
    notdef, "dotlessi", notdef, notdef, "lslash", "oslash", "oe",
    "germandbls", notdef, notdef, notdef, notdef };
static const char charstringname[] = "/CharStrings";

@ @<Glob...@>=
char **t1_glyph_names;
char *t1_builtin_glyph_names[256];
char charsetstr[0x4000];
boolean read_encoding_only;
int t1_encoding;

@ @c
#define T1_BUF_SIZE   0x10

#define CS_HSTEM            1
#define CS_VSTEM            3
#define CS_VMOVETO          4
#define CS_RLINETO          5
#define CS_HLINETO          6
#define CS_VLINETO          7
#define CS_RRCURVETO        8
#define CS_CLOSEPATH        9
#define CS_CALLSUBR         10
#define CS_RETURN           11
#define CS_ESCAPE           12
#define CS_HSBW             13
#define CS_ENDCHAR          14
#define CS_RMOVETO          21
#define CS_HMOVETO          22
#define CS_VHCURVETO        30
#define CS_HVCURVETO        31
#define CS_1BYTE_MAX        (CS_HVCURVETO + 1)

#define CS_DOTSECTION       CS_1BYTE_MAX + 0
#define CS_VSTEM3           CS_1BYTE_MAX + 1
#define CS_HSTEM3           CS_1BYTE_MAX + 2
#define CS_SEAC             CS_1BYTE_MAX + 6
#define CS_SBW              CS_1BYTE_MAX + 7
#define CS_DIV              CS_1BYTE_MAX + 12
#define CS_CALLOTHERSUBR    CS_1BYTE_MAX + 16
#define CS_POP              CS_1BYTE_MAX + 17
#define CS_SETCURRENTPOINT  CS_1BYTE_MAX + 33
#define CS_2BYTE_MAX        (CS_SETCURRENTPOINT + 1)
#define CS_MAX              CS_2BYTE_MAX

@ @<Types...@>=
typedef unsigned char byte;
typedef struct {
    byte nargs;                 /* number of arguments */
    boolean bottom;             /* take arguments from bottom of stack? */
    boolean clear;              /* clear stack? */
    boolean valid;
} cc_entry;                     /* CharString Command */
typedef struct {
    char *glyph_name;                 /* glyph name (or notdef for Subrs entry) */
    byte *data;
    unsigned short len;         /* length of the whole string */
    unsigned short cslen;       /* length of the encoded part of the string */
    boolean is_used;
    boolean valid;
} cs_entry;

@ @<Glob...@>=
unsigned short t1_dr, t1_er;
unsigned short t1_c1, t1_c2;
unsigned short t1_cslen;
short t1_lenIV;

@ @<Set initial...@>=
mp->ps->t1_c1 = 52845; 
mp->ps->t1_c2 = 22719;

@ @<Types...@>=
typedef char t1_line_entry;
typedef char t1_buf_entry;

@ @<Glob...@>=
t1_line_entry *t1_line_ptr, *t1_line_array;
size_t t1_line_limit;
t1_buf_entry *t1_buf_ptr, *t1_buf_array;
size_t t1_buf_limit;
int cs_start;
cs_entry *cs_tab, *cs_ptr, *cs_notdef;
char *cs_dict_start, *cs_dict_end;
int cs_count, cs_size, cs_size_pos;
cs_entry *subr_tab;
char *subr_array_start, *subr_array_end;
int subr_max, subr_size, subr_size_pos;

@ @<Set initial...@>=
mp->ps->t1_line_array = NULL;
mp->ps->t1_buf_array = NULL;

@ 
 This list contains the begin/end tokens commonly used in the 
 /Subrs array of a Type 1 font.                                

@<Static variables in the outer block@>=
static const char *cs_token_pairs_list[][2] = {
    {" RD", "NP"},
    {" -|", "|"},
    {" RD", "noaccess put"},
    {" -|", "noaccess put"},
    {NULL, NULL}
};

@ @<Glob...@>=
const char **cs_token_pair;
boolean t1_pfa, t1_cs, t1_scan, t1_eexec_encrypt, t1_synthetic;
int t1_in_eexec;  /* 0 before eexec-encrypted, 1 during, 2 after */
long t1_block_length;
int last_hexbyte;
FILE *t1_file;
int hexline_length;

@ 
@d HEXLINE_WIDTH 64

@<Set initial ...@>=
mp->ps->hexline_length = HEXLINE_WIDTH;

@ 
@d t1_prefix(s)        str_prefix(mp->ps->t1_line_array, s)
@d t1_buf_prefix(s)    str_prefix(mp->ps->t1_buf_array, s)
@d t1_suffix(s)        str_suffix(mp->ps->t1_line_array, mp->ps->t1_line_ptr, s)
@d t1_buf_suffix(s)    str_suffix(mp->ps->t1_buf_array, mp->ps->t1_buf_ptr, s)
@d t1_charstrings()    strstr(mp->ps->t1_line_array, charstringname)
@d t1_subrs()          t1_prefix("/Subrs")
@d t1_end_eexec()      t1_suffix("mark currentfile closefile")
@d t1_cleartomark()    t1_prefix("cleartomark")

@d isdigit(A) ((A)>='0'&&(A)<='9')

@c
static void end_hexline (MP mp) {
    if (mp->ps->hexline_length == HEXLINE_WIDTH) {
        fputs ("\n", mp->ps_file);
        mp->ps->hexline_length = 0;
    }
}
static void t1_check_pfa (MP mp) {
    const int c = t1_getchar ();
    mp->ps->t1_pfa = (c != 128) ? true : false;
    t1_ungetchar (c);
}
static int t1_getbyte (MP mp)
{
    int c = t1_getchar ();
    if (mp->ps->t1_pfa)
        return c;
    if (mp->ps->t1_block_length == 0) {
        if (c != 128)
         mp_fatal_error (mp, "invalid marker");
        c = t1_getchar ();
        if (c == 3) {
            while (!t1_eof ())
                t1_getchar ();
            return EOF;
        }
        mp->ps->t1_block_length = t1_getchar () & 0xff;
        mp->ps->t1_block_length |= (t1_getchar () & 0xff) << 8;
        mp->ps->t1_block_length |= (t1_getchar () & 0xff) << 16;
        mp->ps->t1_block_length |= (t1_getchar () & 0xff) << 24;
        c = t1_getchar ();
    }
    mp->ps->t1_block_length--;
    return c;
}
static int hexval (int c) {
    if (c >= 'A' && c <= 'F')
        return c - 'A' + 10;
    else if (c >= 'a' && c <= 'f')
        return c - 'a' + 10;
    else if (c >= '0' && c <= '9')
        return c - '0';
    else
        return -1;
}
static byte edecrypt (MP mp, byte cipher) {
    byte plain;
    if (mp->ps->t1_pfa) {
        while (cipher == 10 || cipher == 13)
            cipher = t1_getbyte (mp);
        mp->ps->last_hexbyte = cipher = (hexval (cipher) << 4) + hexval (t1_getbyte (mp));
    }
    plain = (cipher ^ (mp->ps->t1_dr >> 8));
    mp->ps->t1_dr = (cipher + mp->ps->t1_dr) * mp->ps->t1_c1 + mp->ps->t1_c2;
    return plain;
}
static byte cdecrypt (MP mp, byte cipher, unsigned short *cr)
{
    const byte plain = (cipher ^ (*cr >> 8));
    *cr = (cipher + *cr) * mp->ps->t1_c1 + mp->ps->t1_c2;
    return plain;
}
static byte eencrypt (MP mp, byte plain)
{
    const byte cipher = (plain ^ (mp->ps->t1_er >> 8));
    mp->ps->t1_er = (cipher + mp->ps->t1_er) * mp->ps->t1_c1 + mp->ps->t1_c2;
    return cipher;
}

static byte cencrypt (MP mp, byte plain, unsigned short *cr)
{
    const byte cipher = (plain ^ (*cr >> 8));
    *cr = (cipher + *cr) * mp->ps->t1_c1 + mp->ps->t1_c2;
    return cipher;
}

static char *eol (char *s) {
    char *p = strend (s);
    if (p - s > 1 && p[-1] != 10) {
        *p++ = 10;
        *p = 0;
    }
    return p;
}
static float t1_scan_num (MP mp, char *p, char **r)
{
    float f;
    char s[128];
    skip (p, ' ');
    if (sscanf (p, "%g", &f) != 1) {
        remove_eol (p, mp->ps->t1_line_array); 
 	    snprintf(s,128, "a number expected: `%s'", mp->ps->t1_line_array);
        mp_fatal_error(mp,s);
    }
    if (r != NULL) {
        for (; isdigit (*p) || *p == '.' ||
             *p == 'e' || *p == 'E' || *p == '+' || *p == '-'; p++);
        *r = p;
    }
    return f;
}

static boolean str_suffix (const char *begin_buf, const char *end_buf,
                           const char *s)
{
    const char *s1 = end_buf - 1, *s2 = strend (s) - 1;
    if (*s1 == 10)
        s1--;
    while (s1 >= begin_buf && s2 >= s) {
        if (*s1-- != *s2--)
            return false;
    }
    return s2 < s;
}

@

@d alloc_array(T, n, s) do {
    if (mp->ps->T##_array == NULL) {
        mp->ps->T##_limit = (s);
        if ((unsigned)(n) > mp->ps->T##_limit)
            mp->ps->T##_limit = (n);
        mp->ps->T##_array = mp_xmalloc (mp->ps->T##_limit,sizeof(T##_entry));
        mp->ps->T##_ptr = mp->ps->T##_array;
    }
    else if ((unsigned)(mp->ps->T##_ptr - mp->ps->T##_array + (n)) > mp->ps->T##_limit) {
        size_t last_ptr_index;
        last_ptr_index = mp->ps->T##_ptr - mp->ps->T##_array;
        mp->ps->T##_limit *= 2;
        if ((unsigned)(mp->ps->T##_ptr - mp->ps->T##_array + (n)) > mp->ps->T##_limit)
            mp->ps->T##_limit = mp->ps->T##_ptr - mp->ps->T##_array + (n);
        mp->ps->T##_array = mp_xrealloc(mp->ps->T##_array, mp->ps->T##_limit , sizeof (T##_entry));
        mp->ps->T##_ptr = mp->ps->T##_array + last_ptr_index;
    }
} while (0)

@d out_eexec_char(A)      t1_outhex(mp,(A))
 
@c
static void t1_outhex (MP mp, byte b)
{
    static char *hexdigits = "0123456789ABCDEF";
    t1_putchar (hexdigits[b / 16]);
    t1_putchar (hexdigits[b % 16]);
    mp->ps->hexline_length += 2;
    end_hexline (mp);
}
static void t1_getline (MP mp) {
    int c, l, eexec_scan;
    char *p;
    static const char eexec_str[] = "currentfile eexec";
    static int eexec_len = 17;  /* |strlen(eexec_str)| */
  RESTART:
    if (t1_eof ())
        mp_fatal_error (mp,"unexpected end of file");
    mp->ps->t1_line_ptr = mp->ps->t1_line_array;
    alloc_array (t1_line, 1, T1_BUF_SIZE);
    mp->ps->t1_cslen = 0;
    eexec_scan = 0;
    c = t1_getbyte (mp);
    if (c == EOF)
        goto EXIT;
    while (!t1_eof ()) {
        if (mp->ps->t1_in_eexec == 1)
            c = edecrypt (mp,c);
        alloc_array (t1_line, 1, T1_BUF_SIZE);
        append_char_to_buf (c, mp->ps->t1_line_ptr, mp->ps->t1_line_array, mp->ps->t1_line_limit);
        if (mp->ps->t1_in_eexec == 0 && eexec_scan >= 0 && eexec_scan < eexec_len) {
            if (mp->ps->t1_line_array[eexec_scan] == eexec_str[eexec_scan])
                eexec_scan++;
            else
                eexec_scan = -1;
        }
        if (c == 10 || (mp->ps->t1_pfa && eexec_scan == eexec_len && c == 32))
            break;
        if (mp->ps->t1_cs && mp->ps->t1_cslen == 0 && 
            (mp->ps->t1_line_ptr - mp->ps->t1_line_array > 4) &&
            (t1_suffix (" RD ") || t1_suffix (" -| "))) {
            p = mp->ps->t1_line_ptr - 5;
            while (*p != ' ')
                p--;
            mp->ps->t1_cslen = l = t1_scan_num (mp, p + 1, 0);
            mp->ps->cs_start = mp->ps->t1_line_ptr - mp->ps->t1_line_array;     
                  /* |mp->ps->cs_start| is an index now */
            alloc_array (t1_line, l, T1_BUF_SIZE);
            while (l-- > 0)
                *mp->ps->t1_line_ptr++ = edecrypt (mp,t1_getbyte (mp));
        }
        c = t1_getbyte (mp);
    }
    alloc_array (t1_line, 2, T1_BUF_SIZE);      /* |append_eol| can append 2 chars */
    append_eol (mp->ps->t1_line_ptr, mp->ps->t1_line_array, mp->ps->t1_line_limit);
    if (mp->ps->t1_line_ptr - mp->ps->t1_line_array < 2)
        goto RESTART;
    if (eexec_scan == eexec_len)
        mp->ps->t1_in_eexec = 1;
  EXIT:
    /* ensure that |mp->ps->t1_buf_array| has as much room as |t1_line_array| */
    mp->ps->t1_buf_ptr = mp->ps->t1_buf_array;
    alloc_array (t1_buf, mp->ps->t1_line_limit, mp->ps->t1_line_limit);
}

static void t1_putline (MP mp)
{
    char *p = mp->ps->t1_line_array;
    if (mp->ps->t1_line_ptr - mp->ps->t1_line_array <= 1)
        return;
    if (mp->ps->t1_eexec_encrypt) {
        while (p < mp->ps->t1_line_ptr)
            out_eexec_char (eencrypt (mp,*p++));
    } else {
        while (p < mp->ps->t1_line_ptr)
            t1_putchar (*p++);
	}
}

static void t1_puts (MP mp, const char *s)
{
    if (s != mp->ps->t1_line_array)
        strcpy (mp->ps->t1_line_array, s);
    mp->ps->t1_line_ptr = strend (mp->ps->t1_line_array);
    t1_putline (mp);
}

static void t1_printf (MP mp, const char *fmt, ...)
{
    va_list args;
    va_start (args, fmt);
    vsprintf (mp->ps->t1_line_array, fmt, args);
    t1_puts (mp,mp->ps->t1_line_array);
    va_end (args);
}

static void t1_init_params (MP mp, char *open_name_prefix,
                           char *cur_file_name) {
  if ((open_name_prefix != NULL) && strlen(open_name_prefix)) {
    t1_log (open_name_prefix);
    t1_log (cur_file_name);
  }
    mp->ps->t1_lenIV = 4;
    mp->ps->t1_dr = 55665;
    mp->ps->t1_er = 55665;
    mp->ps->t1_in_eexec = 0;
    mp->ps->t1_cs = false;
    mp->ps->t1_scan = true;
    mp->ps->t1_synthetic = false;
    mp->ps->t1_eexec_encrypt = false;
    mp->ps->t1_block_length = 0;
    t1_check_pfa (mp);
}
static void  t1_close_font_file (MP mp, const char *close_name_suffix) {
  if ((close_name_suffix != NULL) && strlen(close_name_suffix)) {
    t1_log (close_name_suffix);
  }
  t1_close ();
}

static void  t1_check_block_len (MP mp, boolean decrypt) {
    int l, c;
    char s[128];
    if (mp->ps->t1_block_length == 0)
        return;
    c = t1_getbyte (mp);
    if (decrypt)
        c = edecrypt (mp,c);
    l = mp->ps->t1_block_length;
    if (!(l == 0 && (c == 10 || c == 13))) {
        snprintf(s,128,"%i bytes more than expected were ignored", l+ 1);
        mp_warn(mp,s);
        while (l-- > 0)
          t1_getbyte (mp);
    }
}
static void  t1_start_eexec (MP mp, fm_entry *fm_cur) {
    int i;
    if (!mp->ps->t1_pfa)
     t1_check_block_len (mp, false);
    for (mp->ps->t1_line_ptr = mp->ps->t1_line_array, i = 0; i < 4; i++) {
      edecrypt (mp, t1_getbyte (mp));
      *mp->ps->t1_line_ptr++ = 0;
    }
    mp->ps->t1_eexec_encrypt = true;
	if (!mp->ps->read_encoding_only)
	  if (is_included (fm_cur))
        t1_putline (mp);          /* to put the first four bytes */
}
static void  t1_stop_eexec (MP mp) {
    int c;
    end_last_eexec_line ();
    if (!mp->ps->t1_pfa)
      t1_check_block_len (mp,true);
    else {
        c = edecrypt (mp, t1_getbyte (mp));
        if (!(c == 10 || c == 13)) {
           if (mp->ps->last_hexbyte == 0)
              t1_puts (mp,"00");
           else
              mp_warn (mp,"unexpected data after eexec");
        }
    }
    mp->ps->t1_cs = false;
    mp->ps->t1_in_eexec = 2;
}
static void  t1_modify_fm (MP mp) {
  mp->ps->t1_line_ptr = eol (mp->ps->t1_line_array);
}

static void  t1_modify_italic (MP mp) {
  mp->ps->t1_line_ptr = eol (mp->ps->t1_line_array);
}

@ @<Types...@>=
typedef struct {
    const char *pdfname;
    const char *t1name;
    float value;
    boolean valid;
} key_entry;

@
@d FONT_KEYS_NUM  11

@<Declarations@>=
static key_entry font_keys[FONT_KEYS_NUM] = {
    {"Ascent", "Ascender", 0, false},
    {"CapHeight", "CapHeight", 0, false},
    {"Descent", "Descender", 0, false},
    {"FontName", "FontName", 0, false},
    {"ItalicAngle", "ItalicAngle", 0, false},
    {"StemV", "StdVW", 0, false},
    {"XHeight", "XHeight", 0, false},
    {"FontBBox", "FontBBox", 0, false},
    {"", "", 0, false},
    {"", "", 0, false},
    {"", "", 0, false}
};


@ 
@d ASCENT_CODE         0
@d CAPHEIGHT_CODE      1
@d DESCENT_CODE        2
@d FONTNAME_CODE       3
@d ITALIC_ANGLE_CODE   4
@d STEMV_CODE          5
@d XHEIGHT_CODE        6
@d FONTBBOX1_CODE      7
@d FONTBBOX2_CODE      8
@d FONTBBOX3_CODE      9
@d FONTBBOX4_CODE      10
@d MAX_KEY_CODE (FONTBBOX1_CODE + 1)

@c
static void  t1_scan_keys (MP mp, int tex_font,fm_entry *fm_cur) {
    int i, k;
    char *p, *r;
    key_entry *key;
    if (fm_extend (fm_cur) != 0 || fm_slant (fm_cur) != 0) {
        if (t1_prefix ("/FontMatrix")) {
            t1_modify_fm (mp);
            return;
        }
        if (t1_prefix ("/ItalicAngle")) {
            t1_modify_italic (mp);
            return;
        }
    }
    if (t1_prefix ("/FontType")) {
        p = mp->ps->t1_line_array + strlen ("FontType") + 1;
        if ((i = t1_scan_num (mp,p, 0)) != 1) {
            char s[128];
            snprintf(s,125,"Type%d fonts unsupported by metapost", i);
            mp_fatal_error(mp,s);
        }
        return;
    }
    for (key = font_keys; key - font_keys < MAX_KEY_CODE; key++)
        if (str_prefix (mp->ps->t1_line_array + 1, key->t1name))
            break;
    if (key - font_keys == MAX_KEY_CODE)
        return;
    key->valid = true;
    p = mp->ps->t1_line_array + strlen (key->t1name) + 1;
    skip (p, ' ');
    if ((k = key - font_keys) == FONTNAME_CODE) {
        if (*p != '/') {
          char s[128];
      	  remove_eol (p, mp->ps->t1_line_array);
          snprintf(s,128,"a name expected: `%s'", mp->ps->t1_line_array);
          mp_fatal_error(mp,s);
        }
        r = ++p;                /* skip the slash */
        if (is_included (fm_cur)) {
	  /* save the fontname */
	  strncpy (mp->ps->fontname_buf, p, FONTNAME_BUF_SIZE);
	  for (i=0; mp->ps->fontname_buf[i] != 10; i++);
	  mp->ps->fontname_buf[i]=0;
	  
	  if(is_subsetted (fm_cur)) {
	    if (fm_cur->encoding!=NULL && fm_cur->encoding->glyph_names!=NULL)
	      make_subset_tag (mp,fm_cur, fm_cur->encoding->glyph_names, tex_font);
	    else
	      make_subset_tag (mp,fm_cur, mp->ps->t1_builtin_glyph_names, tex_font);

	    alloc_array (t1_line, (r-mp->ps->t1_line_array+6+1+strlen(mp->ps->fontname_buf)+1), 
	                 T1_BUF_SIZE);
	    strncpy (r, fm_cur->subset_tag , 6);
	    *(r+6) = '-';
	    strncpy (r+7, mp->ps->fontname_buf, strlen(mp->ps->fontname_buf)+1);
	    mp->ps->t1_line_ptr = eol (r);
	  } else {
	    /* |for (q = p; *q != ' ' && *q != 10; *q++);|*/
	    /*|*q = 0;|*/
	    mp->ps->t1_line_ptr = eol (r);
	  }
	}
        return;
    }
    if ((k == STEMV_CODE || k == FONTBBOX1_CODE)
        && (*p == '[' || *p == '{'))
        p++;
    if (k == FONTBBOX1_CODE) {
        for (i = 0; i < 4; i++) {
            key[i].value = t1_scan_num (mp, p, &r);
            p = r;
        }
        return;
    }
    key->value = t1_scan_num (mp, p, 0);
}
static void  t1_scan_param (MP mp, int tex_font,fm_entry *fm_cur)
{
    static const char *lenIV = "/lenIV";
    if (!mp->ps->t1_scan || *mp->ps->t1_line_array != '/')
        return;
    if (t1_prefix (lenIV)) {
        mp->ps->t1_lenIV = t1_scan_num (mp,mp->ps->t1_line_array + strlen (lenIV), 0);
        return;
    }
    t1_scan_keys (mp, tex_font,fm_cur);
}
static void  copy_glyph_names (char **glyph_names, int a, int b) {
    if (glyph_names[b] != notdef) {
        mp_xfree (glyph_names[b]);
        glyph_names[b] = (char *) notdef;
    }
    if (glyph_names[a] != notdef) {
        glyph_names[b] = mp_xstrdup (glyph_names[a]);
    }
}
static void  t1_builtin_enc (MP mp) {
    int i, a, b, c, counter = 0;
    char *r, *p;
    /*
     * At this moment "/Encoding" is the prefix of |mp->ps->t1_line_array|
     */
    if (t1_suffix ("def")) {    /* predefined encoding */
        sscanf (mp->ps->t1_line_array + strlen ("/Encoding"), "%256s", mp->ps->t1_buf_array);
        if (strcmp (mp->ps->t1_buf_array, "StandardEncoding") == 0) {
            for (i = 0; i < 256; i++)
                if (standard_glyph_names[i] == notdef)
                    mp->ps->t1_builtin_glyph_names[i] = (char *) notdef;
                else
                    mp->ps->t1_builtin_glyph_names[i] =
                        mp_xstrdup (standard_glyph_names[i]);
            mp->ps->t1_encoding = ENC_STANDARD;
        } else {
            char s[128];
            snprintf(s,128, "cannot subset font (unknown predefined encoding `%s')",
                        mp->ps->t1_buf_array);
            mp_fatal_error(mp,s);
        }
        return;
    } else
        mp->ps->t1_encoding = ENC_BUILTIN;
    /*
     * At this moment "/Encoding" is the prefix of |mp->ps->t1_line_array|, and the encoding is
     * not a predefined encoding
     *
     * We have two possible forms of Encoding vector. The first case is
     *
     *     /Encoding [/a /b /c...] readonly def
     *
     * and the second case can look like
     *
     *     /Encoding 256 array 0 1 255 {1 index exch /.notdef put} for
     *     dup 0 /x put
     *     dup 1 /y put
     *     ...
     *     readonly def
     */
    for (i = 0; i < 256; i++)
        mp->ps->t1_builtin_glyph_names[i] = (char *) notdef;
    if (t1_prefix ("/Encoding [") || t1_prefix ("/Encoding[")) {        /* the first case */
        r = strchr (mp->ps->t1_line_array, '[') + 1;
        skip (r, ' ');
        for (;;) {
            while (*r == '/') {
                for (p = mp->ps->t1_buf_array, r++;
                     *r != 32 && *r != 10 && *r != ']' && *r != '/';
                     *p++ = *r++);
                *p = 0;
                skip (r, ' ');
                if (counter > 255) {
                   mp_fatal_error
                        (mp, "encoding vector contains more than 256 names");
                }
                if (strcmp (mp->ps->t1_buf_array, notdef) != 0)
                  mp->ps->t1_builtin_glyph_names[counter] = mp_xstrdup (mp->ps->t1_buf_array);
                counter++;
            }
            if (*r != 10 && *r != '%') {
                if (str_prefix (r, "] def")
                    || str_prefix (r, "] readonly def"))
                    break;
                else {
                    char s[128];
                    remove_eol (r, mp->ps->t1_line_array);
                    snprintf(s,128,"a name or `] def' or `] readonly def' expected: `%s'",
                                    mp->ps->t1_line_array);
                    mp_fatal_error(mp,s);
                }
            }
            t1_getline (mp);
            r = mp->ps->t1_line_array;
        }
    } else {                    /* the second case */
        p = strchr (mp->ps->t1_line_array, 10);
        for (;;) {
            if (*p == 10) {
                t1_getline (mp);
                p = mp->ps->t1_line_array;
            }
            /*
               check for `dup <index> <glyph> put'
             */
            if (sscanf (p, "dup %i%256s put", &i, mp->ps->t1_buf_array) == 2 &&
                *mp->ps->t1_buf_array == '/' && valid_code (i)) {
                if (strcmp (mp->ps->t1_buf_array + 1, notdef) != 0)
                    mp->ps->t1_builtin_glyph_names[i] = 
                      mp_xstrdup (mp->ps->t1_buf_array + 1);
                p = strstr (p, " put") + strlen (" put");
                skip (p, ' ');
            }
            /*
               check for `dup dup <to> exch <from> get put'
             */
            else if (sscanf (p, "dup dup %i exch %i get put", &b, &a) == 2
                     && valid_code (a) && valid_code (b)) {
                copy_glyph_names (mp->ps->t1_builtin_glyph_names, a, b);
                p = strstr (p, " get put") + strlen (" get put");
                skip (p, ' ');
            }
            /*
               check for `dup dup <from> <size> getinterval <to> exch putinterval'
             */
            else if (sscanf
                     (p, "dup dup %i %i getinterval %i exch putinterval",
                      &a, &c, &b) == 3 && valid_code (a) && valid_code (b)
                     && valid_code (c)) {
                for (i = 0; i < c; i++)
                    copy_glyph_names (mp->ps->t1_builtin_glyph_names, a + i, b + i);
                p = strstr (p, " putinterval") + strlen (" putinterval");
                skip (p, ' ');
            }
            /*
               check for `def' or `readonly def'
             */
            else if ((p == mp->ps->t1_line_array || (p > mp->ps->t1_line_array && p[-1] == ' '))
                     && strcmp (p, "def\n") == 0)
                return;
            /*
               skip an unrecognizable word
             */
            else {
                while (*p != ' ' && *p != 10)
                    p++;
                skip (p, ' ');
            }
        }
    }
}

static void  t1_check_end (MP mp) {
    if (t1_eof ())
        return;
    t1_getline (mp);
    if (t1_prefix ("{restore}"))
        t1_putline (mp);
}

@ @<Types...@>=
typedef struct {
    char *ff_name;              /* base name of font file */
    char *ff_path;              /* full path to font file */
} ff_entry;

@ @c
static boolean t1_open_fontfile (MP mp, fm_entry *fm_cur,const char *open_name_prefix) {
    ff_entry *ff;
    ff = check_ff_exist (mp, fm_cur);
    if (ff->ff_path != NULL) {
        mp->ps->t1_file = mp_open_file(mp,ff->ff_path, "rb", mp_filetype_font);
    } else {
        mp_warn (mp, "cannot open Type 1 font file for reading");
        return false;
    }
    t1_init_params (mp,(char *)open_name_prefix,fm_cur->ff_name);
    mp->ps->fontfile_found = true;
    return true;
}

static void  t1_scan_only (MP mp, int tex_font, fm_entry *fm_cur) {
    do {
        t1_getline (mp);
        t1_scan_param (mp,tex_font, fm_cur);
    }
    while (mp->ps->t1_in_eexec == 0);
    t1_start_eexec (mp,fm_cur);
    do {
        t1_getline (mp);
        t1_scan_param (mp,tex_font, fm_cur);
    }
    while (!(t1_charstrings () || t1_subrs ()));
}

static void  t1_include (MP mp, int tex_font, fm_entry *fm_cur) {
    do {
        t1_getline (mp);
        t1_scan_param (mp,tex_font, fm_cur);
        t1_putline (mp);
    }
    while (mp->ps->t1_in_eexec == 0);
    t1_start_eexec (mp,fm_cur);
    do {
        t1_getline (mp);
        t1_scan_param (mp,tex_font, fm_cur);
        t1_putline (mp);
    }
    while (!(t1_charstrings () || t1_subrs ()));
    mp->ps->t1_cs = true;
    do {
        t1_getline (mp);
        t1_putline (mp);
    }
    while (!t1_end_eexec ());
    t1_stop_eexec (mp);
    if (fixedcontent) {         /* copy 512 zeros (not needed for PDF) */
        do {
            t1_getline (mp);
            t1_putline (mp);
        }
        while (!t1_cleartomark ());
        t1_check_end (mp);        /* write "{restore}if" if found */
    }
}

@
@d check_subr(SUBR) if (SUBR >= mp->ps->subr_size || SUBR < 0) {
        char s[128];
        snprintf(s,128,"Subrs array: entry index out of range (%i)",SUBR);
        mp_fatal_error(mp,s);
  }

@c
static const char **check_cs_token_pair (MP mp) {
    const char **p = (const char **) cs_token_pairs_list;
    for (; p[0] != NULL; ++p)
        if (t1_buf_prefix (p[0]) && t1_buf_suffix (p[1]))
            return p;
    return NULL;
}

static void cs_store (MP mp, boolean is_subr) {
    char *p;
    cs_entry *ptr;
    int subr;
    for (p = mp->ps->t1_line_array, mp->ps->t1_buf_ptr = mp->ps->t1_buf_array; *p != ' ';
         *mp->ps->t1_buf_ptr++ = *p++);
    *mp->ps->t1_buf_ptr = 0;
    if (is_subr) {
        subr = t1_scan_num (mp, p + 1, 0);
        check_subr (subr);
        ptr = mp->ps->subr_tab + subr;
    } else {
        ptr = mp->ps->cs_ptr++;
        if (mp->ps->cs_ptr - mp->ps->cs_tab > mp->ps->cs_size) {
          char s[128];
          snprintf(s,128,"CharStrings dict: more entries than dict size (%i)",mp->ps->cs_size);
          mp_fatal_error(mp,s);
        }
        if (strcmp (mp->ps->t1_buf_array + 1, notdef) == 0)     /* skip the slash */
            ptr->glyph_name = (char *) notdef;
        else
            ptr->glyph_name = mp_xstrdup (mp->ps->t1_buf_array + 1);
    }
    /* copy " RD " + cs data to |mp->ps->t1_buf_array| */
    memcpy (mp->ps->t1_buf_array, mp->ps->t1_line_array + mp->ps->cs_start - 4,
            (unsigned) (mp->ps->t1_cslen + 4));
    /* copy the end of cs data to |mp->ps->t1_buf_array| */
    for (p = mp->ps->t1_line_array + mp->ps->cs_start + mp->ps->t1_cslen, mp->ps->t1_buf_ptr =
         mp->ps->t1_buf_array + mp->ps->t1_cslen + 4; *p != 10; *mp->ps->t1_buf_ptr++ = *p++);
    *mp->ps->t1_buf_ptr++ = 10;
    if (is_subr && mp->ps->cs_token_pair == NULL)
        mp->ps->cs_token_pair = check_cs_token_pair (mp);
    ptr->len = mp->ps->t1_buf_ptr - mp->ps->t1_buf_array;
    ptr->cslen = mp->ps->t1_cslen;
    ptr->data = mp_xmalloc (ptr->len , sizeof (byte));
    memcpy (ptr->data, mp->ps->t1_buf_array, ptr->len);
    ptr->valid = true;
}

#define store_subr(mp)    cs_store(mp,true)
#define store_cs(mp)      cs_store(mp,false)

#define CC_STACK_SIZE       24

static integer cc_stack[CC_STACK_SIZE], *stack_ptr = cc_stack;
static cc_entry cc_tab[CS_MAX];
static boolean is_cc_init = false;


#define cc_pop(N)                       \
    if (stack_ptr - cc_stack < (N))     \
        stack_error(N);                 \
    stack_ptr -= N

#define stack_error(N) {                \
    char s[256];                        \
    snprintf(s,255,"CharString: invalid access (%i) to stack (%i entries)", \
                 (int) N, (int)(stack_ptr - cc_stack));                  \
    mp_warn(mp,s);                    \
    goto cs_error;                    \
}


#define cc_get(N)   ((N) < 0 ? *(stack_ptr + (N)) : *(cc_stack + (N)))

#define cc_push(V)  *stack_ptr++ = V
#define cc_clear()  stack_ptr = cc_stack

#define set_cc(N, B, A, C) \
    cc_tab[N].nargs = A;   \
    cc_tab[N].bottom = B;  \
    cc_tab[N].clear = C;   \
    cc_tab[N].valid = true

static void cc_init (void) {
    int i;
    if (is_cc_init)
        return;
    for (i = 0; i < CS_MAX; i++)
        cc_tab[i].valid = false;
    set_cc (CS_HSTEM, true, 2, true);
    set_cc (CS_VSTEM, true, 2, true);
    set_cc (CS_VMOVETO, true, 1, true);
    set_cc (CS_RLINETO, true, 2, true);
    set_cc (CS_HLINETO, true, 1, true);
    set_cc (CS_VLINETO, true, 1, true);
    set_cc (CS_RRCURVETO, true, 6, true);
    set_cc (CS_CLOSEPATH, false, 0, true);
    set_cc (CS_CALLSUBR, false, 1, false);
    set_cc (CS_RETURN, false, 0, false);
    /*
       |set_cc(CS_ESCAPE,          false,  0, false);|
     */
    set_cc (CS_HSBW, true, 2, true);
    set_cc (CS_ENDCHAR, false, 0, true);
    set_cc (CS_RMOVETO, true, 2, true);
    set_cc (CS_HMOVETO, true, 1, true);
    set_cc (CS_VHCURVETO, true, 4, true);
    set_cc (CS_HVCURVETO, true, 4, true);
    set_cc (CS_DOTSECTION, false, 0, true);
    set_cc (CS_VSTEM3, true, 6, true);
    set_cc (CS_HSTEM3, true, 6, true);
    set_cc (CS_SEAC, true, 5, true);
    set_cc (CS_SBW, true, 4, true);
    set_cc (CS_DIV, false, 2, false);
    set_cc (CS_CALLOTHERSUBR, false, 0, false);
    set_cc (CS_POP, false, 0, false);
    set_cc (CS_SETCURRENTPOINT, true, 2, true);
    is_cc_init = true;
}

@

@d cs_getchar(mp)    cdecrypt(mp,*data++, &cr)

@d mark_subr(mp,n)    cs_mark(mp,0, n)
@d mark_cs(mp,s)      cs_mark(mp,s, 0)
@d SMALL_BUF_SIZE      256

@c
static void cs_warn (MP mp, const char *cs_name, int subr, const char *fmt, ...) {
    char buf[SMALL_BUF_SIZE];
    char s[300];
    va_list args;
    va_start (args, fmt);
    vsprintf (buf, fmt, args);
    va_end (args);
    if (cs_name == NULL) {
        snprintf(s,299,"Subr (%i): %s", (int) subr, buf);
    } else {
       snprintf(s,299,"CharString (/%s): %s", cs_name, buf);
    }
    mp_warn(mp,s);
}

static void cs_mark (MP mp, const char *cs_name, int subr)
{
    byte *data;
    int i, b, cs_len;
    integer a, a1, a2;
    unsigned short cr;
    static integer lastargOtherSubr3 = 3;       /* the argument of last call to
                                                   OtherSubrs[3] */
    cs_entry *ptr;
    cc_entry *cc;
    if (cs_name == NULL) {
        check_subr (subr);
        ptr = mp->ps->subr_tab + subr;
        if (!ptr->valid)
          return;
    } else {
        if (mp->ps->cs_notdef != NULL &&
            (cs_name == notdef || strcmp (cs_name, notdef) == 0))
            ptr = mp->ps->cs_notdef;
        else {
            for (ptr = mp->ps->cs_tab; ptr < mp->ps->cs_ptr; ptr++)
                if (strcmp (ptr->glyph_name, cs_name) == 0)
                    break;
            if (ptr == mp->ps->cs_ptr) {
                char s[128];
                snprintf (s,128,"glyph `%s' undefined", cs_name);
                mp_warn(mp,s);
                return;
            }
            if (ptr->glyph_name == notdef)
                mp->ps->cs_notdef = ptr;
        }
    }
    /* only marked CharString entries and invalid entries can be skipped;
       valid marked subrs must be parsed to keep the stack in sync */
    if (!ptr->valid || (ptr->is_used && cs_name != NULL))
        return;
    ptr->is_used = true;
    cr = 4330;
    cs_len = ptr->cslen;
    data = ptr->data + 4;
    for (i = 0; i < mp->ps->t1_lenIV; i++, cs_len--)
        cs_getchar (mp);
    while (cs_len > 0) {
        --cs_len;
        b = cs_getchar (mp);
        if (b >= 32) {
            if (b <= 246)
                a = b - 139;
            else if (b <= 250) {
                --cs_len;
                a = ((b - 247) << 8) + 108 + cs_getchar (mp);
            } else if (b <= 254) {
                --cs_len;
                a = -((b - 251) << 8) - 108 - cs_getchar (mp);
            } else {
                cs_len -= 4;
                a = (cs_getchar (mp) & 0xff) << 24;
                a |= (cs_getchar (mp) & 0xff) << 16;
                a |= (cs_getchar (mp) & 0xff) << 8;
                a |= (cs_getchar (mp) & 0xff) << 0;
                if (sizeof (integer) > 4 && (a & 0x80000000))
                    a |= ~0x7FFFFFFF;
            }
            cc_push (a);
        } else {
            if (b == CS_ESCAPE) {
                b = cs_getchar (mp) + CS_1BYTE_MAX;
                cs_len--;
            }
            if (b >= CS_MAX) {
                cs_warn (mp,cs_name, subr, "command value out of range: %i",
                         (int) b);
                goto cs_error;
            }
            cc = cc_tab + b;
            if (!cc->valid) {
                cs_warn (mp,cs_name, subr, "command not valid: %i", (int) b);
                goto cs_error;
            }
            if (cc->bottom) {
                if (stack_ptr - cc_stack < cc->nargs)
                    cs_warn (mp,cs_name, subr,
                             "less arguments on stack (%i) than required (%i)",
                             (int) (stack_ptr - cc_stack), (int) cc->nargs);
                else if (stack_ptr - cc_stack > cc->nargs)
                    cs_warn (mp,cs_name, subr,
                             "more arguments on stack (%i) than required (%i)",
                             (int) (stack_ptr - cc_stack), (int) cc->nargs);
            }
            switch (cc - cc_tab) {
            case CS_CALLSUBR:
                a1 = cc_get (-1);
                cc_pop (1);
                mark_subr (mp,a1);
                if (!mp->ps->subr_tab[a1].valid) {
                    cs_warn (mp,cs_name, subr, "cannot call subr (%i)", (int) a1);
                    goto cs_error;
                }
                break;
            case CS_DIV:
                cc_pop (2);
                cc_push (0);
                break;
            case CS_CALLOTHERSUBR:
                if (cc_get (-1) == 3)
                    lastargOtherSubr3 = cc_get (-3);
                a1 = cc_get (-2) + 2;
                cc_pop (a1);
                break;
            case CS_POP:
                cc_push (lastargOtherSubr3);
                /* the only case when we care about the value being pushed onto
                   stack is when POP follows CALLOTHERSUBR (changing hints by
                   OtherSubrs[3])
                 */
                break;
            case CS_SEAC:
                a1 = cc_get (3);
                a2 = cc_get (4);
                cc_clear ();
                mark_cs (mp,standard_glyph_names[a1]);
                mark_cs (mp,standard_glyph_names[a2]);
                break;
            default:
                if (cc->clear)
                    cc_clear ();
            }
        }
    }
    return;
  cs_error:                    /* an error occured during parsing */
    cc_clear ();
    ptr->valid = false;
    ptr->is_used = false;
}

static void t1_subset_ascii_part (MP mp, int tex_font, fm_entry *fm_cur)
{
    int i, j;
    t1_getline (mp);
    while (!t1_prefix ("/Encoding")) {
	  t1_scan_param (mp,tex_font, fm_cur);
        t1_putline (mp);
        t1_getline (mp);
    }
    t1_builtin_enc (mp);
    if (is_reencoded (fm_cur))
        mp->ps->t1_glyph_names = external_enc ();
    else
        mp->ps->t1_glyph_names = mp->ps->t1_builtin_glyph_names;
	/* 
    |if (is_included (fm_cur) && is_subsetted (fm_cur)) {
	    make_subset_tag (fm_cur, t1_glyph_names, tex_font);
        update_subset_tag ();
    }|
    */
    if ((!is_subsetted (fm_cur)) && mp->ps->t1_encoding == ENC_STANDARD)
        t1_puts (mp,"/Encoding StandardEncoding def\n");
    else {
        t1_puts
            (mp,"/Encoding 256 array\n0 1 255 {1 index exch /.notdef put} for\n");
        for (i = 0, j = 0; i < 256; i++) {
            if (is_used_char (i) && mp->ps->t1_glyph_names[i] != notdef) {
                j++;
                t1_printf (mp,"dup %i /%s put\n", (int) t1_char (i),
                           mp->ps->t1_glyph_names[i]);
            }
        }
        /* We didn't mark anything for the Encoding array. */
        /* We add "dup 0 /.notdef put" for compatibility   */
        /* with Acrobat 5.0.                               */
        if (j == 0)
            t1_puts (mp,"dup 0 /.notdef put\n");
        t1_puts (mp,"readonly def\n");
    }
    do {
        t1_getline (mp);
        t1_scan_param (mp,tex_font, fm_cur);
        if (!t1_prefix ("/UniqueID"))   /* ignore UniqueID for subsetted fonts */
            t1_putline (mp);
    }
    while (mp->ps->t1_in_eexec == 0);
}

#define t1_subr_flush(mp)  t1_flush_cs(mp,true)
#define t1_cs_flush(mp)    t1_flush_cs(mp,false)

static void cs_init (MP mp) {
    mp->ps->cs_ptr = mp->ps->cs_tab = NULL;
    mp->ps->cs_dict_start = mp->ps->cs_dict_end = NULL;
    mp->ps->cs_count = mp->ps->cs_size = mp->ps->cs_size_pos = 0;
    mp->ps->cs_token_pair = NULL;
    mp->ps->subr_tab = NULL;
    mp->ps->subr_array_start = mp->ps->subr_array_end = NULL;
    mp->ps->subr_max = mp->ps->subr_size = mp->ps->subr_size_pos = 0;
}

static void init_cs_entry ( cs_entry * cs) {
    cs->data = NULL;
    cs->glyph_name = NULL;
    cs->len = 0;
    cs->cslen = 0;
    cs->is_used = false;
    cs->valid = false;
}

static void t1_mark_glyphs (MP mp, int tex_font);

static void t1_read_subrs (MP mp, int tex_font, fm_entry *fm_cur)
{
    int i, s;
    cs_entry *ptr;
    t1_getline (mp);
    while (!(t1_charstrings () || t1_subrs ())) {
        t1_scan_param (mp,tex_font, fm_cur);
        t1_putline (mp);
        t1_getline (mp);
    }
  FOUND:
    mp->ps->t1_cs = true;
    mp->ps->t1_scan = false;
    if (!t1_subrs ())
        return;
    mp->ps->subr_size_pos = strlen ("/Subrs") + 1;
    /* |subr_size_pos| points to the number indicating dict size after "/Subrs" */
    mp->ps->subr_size = t1_scan_num (mp,mp->ps->t1_line_array + mp->ps->subr_size_pos, 0);
    if (mp->ps->subr_size == 0) {
        while (!t1_charstrings ())
            t1_getline (mp);
        return;
    }
	/*    |subr_tab = xtalloc (subr_size, cs_entry);| */
	mp->ps->subr_tab = (cs_entry *)mp_xmalloc (mp->ps->subr_size, sizeof (cs_entry));
    for (ptr = mp->ps->subr_tab; ptr - mp->ps->subr_tab < mp->ps->subr_size; ptr++)
        init_cs_entry (ptr);
    mp->ps->subr_array_start = mp_xstrdup (mp->ps->t1_line_array);
    t1_getline (mp);
    while (mp->ps->t1_cslen) {
        store_subr (mp);
        t1_getline (mp);
    }
    /* mark the first four entries without parsing */
    for (i = 0; i < mp->ps->subr_size && i < 4; i++)
        mp->ps->subr_tab[i].is_used = true;
    /* the end of the Subrs array might have more than one line so we need to
       concatnate them to |subr_array_end|. Unfortunately some fonts don't have
       the Subrs array followed by the CharStrings dict immediately (synthetic
       fonts). If we cannot find CharStrings in next |POST_SUBRS_SCAN| lines then
       we will treat the font as synthetic and ignore everything until next
       Subrs is found
     */
#define POST_SUBRS_SCAN     5
    s = 0;
    *mp->ps->t1_buf_array = 0;
    for (i = 0; i < POST_SUBRS_SCAN; i++) {
        if (t1_charstrings ())
            break;
        s += mp->ps->t1_line_ptr - mp->ps->t1_line_array;
        alloc_array (t1_buf, s, T1_BUF_SIZE);
        strcat (mp->ps->t1_buf_array, mp->ps->t1_line_array);
        t1_getline (mp);
    }
    mp->ps->subr_array_end = mp_xstrdup (mp->ps->t1_buf_array);
    if (i == POST_SUBRS_SCAN) { /* CharStrings not found;
                                   suppose synthetic font */
        for (ptr = mp->ps->subr_tab; ptr - mp->ps->subr_tab < mp->ps->subr_size; ptr++)
            if (ptr->valid)
                mp_xfree (ptr->data);
        mp_xfree (mp->ps->subr_tab);
        mp_xfree (mp->ps->subr_array_start);
        mp_xfree (mp->ps->subr_array_end);
        cs_init (mp);
        mp->ps->t1_cs = false;
        mp->ps->t1_synthetic = true;
        while (!(t1_charstrings () || t1_subrs ()))
            t1_getline (mp);
        goto FOUND;
    }
}

@ @c
static void t1_flush_cs (MP mp, boolean is_subr)
{
    char *p;
    byte *r, *return_cs = NULL;
    cs_entry *tab, *end_tab, *ptr;
    char *start_line, *line_end;
    int count, size_pos;
    unsigned short cr, cs_len = 0; /* to avoid warning about uninitialized use of |cs_len| */
    if (is_subr) {
        start_line = mp->ps->subr_array_start;
        line_end =  mp->ps->subr_array_end;
        size_pos =  mp->ps->subr_size_pos;
        tab =  mp->ps->subr_tab;
        count =  mp->ps->subr_max + 1;
        end_tab =  mp->ps->subr_tab + count;
    } else {
        start_line =  mp->ps->cs_dict_start;
        line_end =  mp->ps->cs_dict_end;
        size_pos =  mp->ps->cs_size_pos;
        tab =  mp->ps->cs_tab;
        end_tab =  mp->ps->cs_ptr;
        count =  mp->ps->cs_count;
    }
    mp->ps->t1_line_ptr = mp->ps->t1_line_array;
    for (p = start_line; p - start_line < size_pos;)
        *mp->ps->t1_line_ptr++ = *p++;
    while (isdigit (*p))
        p++;
    sprintf (mp->ps->t1_line_ptr, "%u", count);
    strcat (mp->ps->t1_line_ptr, p);
    mp->ps->t1_line_ptr = eol (mp->ps->t1_line_array);
    t1_putline (mp);

    /* create |return_cs| to replace unsused subr's */
    if (is_subr) {
        cr = 4330;
        cs_len = 0;
        return_cs = mp_xmalloc ( (mp->ps->t1_lenIV + 1) , sizeof(byte));
        if ( mp->ps->t1_lenIV > 0) {
            for (cs_len = 0, r = return_cs; cs_len <  mp->ps->t1_lenIV; cs_len++, r++)
                *r = cencrypt (mp,0x00, &cr);
            *r = cencrypt (mp,CS_RETURN, &cr);
        } else {
            *return_cs = CS_RETURN;
        }
        cs_len++;
    }

    for (ptr = tab; ptr < end_tab; ptr++) {
        if (ptr->is_used) {
            if (is_subr)
                sprintf (mp->ps->t1_line_array, "dup %i %u", (int) (ptr - tab),
                         ptr->cslen);
            else
                sprintf (mp->ps->t1_line_array, "/%s %u", ptr->glyph_name, ptr->cslen);
            p = strend (mp->ps->t1_line_array);
            memcpy (p, ptr->data, ptr->len);
            mp->ps->t1_line_ptr = p + ptr->len;
            t1_putline (mp);
        } else {
            /* replace unsused subr's by |return_cs| */
            if (is_subr) {
                sprintf (mp->ps->t1_line_array, "dup %i %u%s ", (int) (ptr - tab),
                         cs_len,  mp->ps->cs_token_pair[0]);
                p = strend (mp->ps->t1_line_array);
                memcpy (p, return_cs, cs_len);
                mp->ps->t1_line_ptr = p + cs_len;
                t1_putline (mp);
                sprintf (mp->ps->t1_line_array, " %s",  mp->ps->cs_token_pair[1]);
                mp->ps->t1_line_ptr = eol (mp->ps->t1_line_array);
                t1_putline (mp);
            }
        }
        mp_xfree (ptr->data);
        if (ptr->glyph_name != notdef)
            mp_xfree (ptr->glyph_name);
    }
    sprintf (mp->ps->t1_line_array, "%s", line_end);
    mp->ps->t1_line_ptr = eol (mp->ps->t1_line_array);
    t1_putline (mp);
    if (is_subr)
        mp_xfree (return_cs);
    mp_xfree (tab);
    mp_xfree (start_line);
    mp_xfree (line_end);
}

static void t1_mark_glyphs (MP mp, int tex_font)
{
    int i;
    char *charset = extra_charset ();
    char *g, *s, *r;
    cs_entry *ptr;
    if (mp->ps->t1_synthetic || embed_all_glyphs (tex_font)) {  /* mark everything */
        if (mp->ps->cs_tab != NULL)
            for (ptr = mp->ps->cs_tab; ptr < mp->ps->cs_ptr; ptr++)
                if (ptr->valid)
                    ptr->is_used = true;
        if (mp->ps->subr_tab != NULL) {
            for (ptr = mp->ps->subr_tab; ptr - mp->ps->subr_tab < mp->ps->subr_size; ptr++)
                if (ptr->valid)
                    ptr->is_used = true;
            mp->ps->subr_max = mp->ps->subr_size - 1;
        }
        return;
    }
    mark_cs (mp,notdef);
    for (i = 0; i < 256; i++)
        if (is_used_char (i)) {
            if (mp->ps->t1_glyph_names[i] == notdef) {
                char s[128];
                snprintf(s,128, "character %i is mapped to %s", i, notdef);
                mp_warn(mp,s);
            } else
                mark_cs (mp,mp->ps->t1_glyph_names[i]);
        }
    if (charset == NULL)
        goto SET_SUBR_MAX;
    g = s = charset + 1;        /* skip the first '/' */
    r = strend (g);
    while (g < r) {
        while (*s != '/' && s < r)
            s++;
        *s = 0;                 /* terminate g by rewriting '/' to 0 */
        mark_cs (mp,g);
        g = s + 1;
    }
  SET_SUBR_MAX:
    if (mp->ps->subr_tab != NULL)
        for (mp->ps->subr_max = -1, ptr = mp->ps->subr_tab; 
	         ptr - mp->ps->subr_tab < mp->ps->subr_size; 
             ptr++)
            if (ptr->is_used && ptr - mp->ps->subr_tab > mp->ps->subr_max)
                mp->ps->subr_max = ptr - mp->ps->subr_tab;
}

static void t1_subset_charstrings (MP mp, int tex_font) 
{
    cs_entry *ptr;
    mp->ps->cs_size_pos =
        strstr (mp->ps->t1_line_array, charstringname) + strlen (charstringname)
        - mp->ps->t1_line_array + 1;
    /* |cs_size_pos| points to the number indicating
       dict size after "/CharStrings" */
    mp->ps->cs_size = t1_scan_num (mp,mp->ps->t1_line_array + mp->ps->cs_size_pos, 0);
    mp->ps->cs_ptr = mp->ps->cs_tab = mp_xmalloc (mp->ps->cs_size, sizeof(cs_entry));
    for (ptr = mp->ps->cs_tab; ptr - mp->ps->cs_tab < mp->ps->cs_size; ptr++)
        init_cs_entry (ptr);
    mp->ps->cs_notdef = NULL;
    mp->ps->cs_dict_start = mp_xstrdup (mp->ps->t1_line_array);
    t1_getline (mp);
    while (mp->ps->t1_cslen) {
        store_cs (mp);
        t1_getline (mp);
    }
    mp->ps->cs_dict_end = mp_xstrdup (mp->ps->t1_line_array);
    t1_mark_glyphs (mp,tex_font);
    if (mp->ps->subr_tab != NULL) {
        if (mp->ps->cs_token_pair == NULL) 
            mp_fatal_error
                (mp, "This Type 1 font uses mismatched subroutine begin/end token pairs.");
        t1_subr_flush (mp);
    }
    for (mp->ps->cs_count = 0, ptr = mp->ps->cs_tab; ptr < mp->ps->cs_ptr; ptr++)
        if (ptr->is_used)
            mp->ps->cs_count++;
    t1_cs_flush (mp);
}

static void t1_subset_end (MP mp)
{
    if (mp->ps->t1_synthetic) {         /* copy to "dup /FontName get exch definefont pop" */
        while (!strstr (mp->ps->t1_line_array, "definefont")) {
            t1_getline (mp);
            t1_putline (mp);
        }
        while (!t1_end_eexec ())
            t1_getline (mp);      /* ignore the rest */
        t1_putline (mp);          /* write "mark currentfile closefile" */
    } else
        while (!t1_end_eexec ()) {      /* copy to "mark currentfile closefile" */
            t1_getline (mp);
            t1_putline (mp);
        }
    t1_stop_eexec (mp);
    if (fixedcontent) {         /* copy 512 zeros (not needed for PDF) */
        while (!t1_cleartomark ()) {
            t1_getline (mp);
            t1_putline (mp);
        }
        if (!mp->ps->t1_synthetic)      /* don't check "{restore}if" for synthetic fonts */
            t1_check_end (mp);    /* write "{restore}if" if found */
    }
}

static int t1_updatefm (MP mp, int f, fm_entry *fm)
{
  char *s, *p;
  mp->ps->read_encoding_only = true;
  if (!t1_open_fontfile (mp,fm,NULL)) {
	return 0;
  }
  t1_scan_only (mp,f, fm);
  s = mp_xstrdup(mp->ps->fontname_buf);
  p = s;
  while (*p != ' ' && *p != 0) 
     p++;
  *p=0;
  fm->ps_name = s;
  t1_close_font_file (mp,"");
  return 1;
}


static void  writet1 (MP mp, int tex_font, fm_entry *fm_cur) {
	int save_selector = mp->selector;
    mp_normalize_selector(mp);
    mp->ps->read_encoding_only = false;
    if (!is_included (fm_cur)) {        /* scan parameters from font file */
      if (!t1_open_fontfile (mp,fm_cur,"{"))
            return;
   	    t1_scan_only (mp,tex_font, fm_cur);
        t1_close_font_file (mp,"}");
        return;
    }
    if (!is_subsetted (fm_cur)) {       /* include entire font */
      if (!t1_open_fontfile (mp,fm_cur,"<<"))
            return;
	  t1_include (mp,tex_font,fm_cur);
        t1_close_font_file (mp,">>");
        return;
    }
    /* partial downloading */
    if (!t1_open_fontfile (mp,fm_cur,"<"))
        return;
    t1_subset_ascii_part (mp,tex_font,fm_cur);
    t1_start_eexec (mp,fm_cur);
    cc_init ();
    cs_init (mp);
    t1_read_subrs (mp,tex_font, fm_cur);
    t1_subset_charstrings (mp,tex_font);
    t1_subset_end (mp);
    t1_close_font_file (mp,">");
    mp->selector = save_selector; 
}

@ @<Declarations@>=
static void t1_free (MP mp);

@ @c
static void  t1_free (MP mp) {
  mp_xfree (mp->ps->t1_line_array);
  mp_xfree (mp->ps->t1_buf_array);
}


@* \[44d] Embedding fonts.

@ The |tfm_num| is officially of type |font_number|, but that
type does not exist yet at this point in the output order.

@<Types...@>=
typedef struct {
    char *tfm_name;             /* TFM file name */
    char *ps_name;              /* PostScript name */
    integer flags;              /* font flags */
    char *ff_name;              /* font file name */
    char *subset_tag;           /* pseudoUniqueTag for subsetted font */
    enc_entry *encoding;        /* pointer to corresponding encoding */
    unsigned int tfm_num;       /* number of the TFM refering this entry */
    unsigned short type;        /* font type (T1/TTF/...) */
    short slant;                /* SlantFont */
    short extend;               /* ExtendFont */
    integer ff_objnum;          /* FontFile object number */
    integer fn_objnum;          /* FontName/BaseName object number */
    integer fd_objnum;          /* FontDescriptor object number */
    char *charset;              /* string containing used glyphs */
    boolean all_glyphs;         /* embed all glyphs? */
    unsigned short links;       /* link flags from |tfm_tree| and |ps_tree| */
    short tfm_avail;            /* flags whether a tfm is available */
    short pid;                  /* Pid for truetype fonts */
    short eid;                  /* Eid for truetype fonts */
} fm_entry;


@ 
@<Glob...@>=
#define FONTNAME_BUF_SIZE 128
boolean fontfile_found;
boolean is_otf_font;
char fontname_buf[FONTNAME_BUF_SIZE];

@ 
@d F_INCLUDED          0x01
@d F_SUBSETTED         0x02
@d F_TRUETYPE          0x04
@d F_BASEFONT          0x08

@d set_included(fm)    ((fm)->type |= F_INCLUDED)
@d set_subsetted(fm)   ((fm)->type |= F_SUBSETTED)
@d set_truetype(fm)    ((fm)->type |= F_TRUETYPE)
@d set_basefont(fm)    ((fm)->type |= F_BASEFONT)

@d is_included(fm)     ((fm)->type & F_INCLUDED)
@d is_subsetted(fm)    ((fm)->type & F_SUBSETTED)
@d is_truetype(fm)     ((fm)->type & F_TRUETYPE)
@d is_basefont(fm)     ((fm)->type & F_BASEFONT)
@d is_reencoded(fm)    ((fm)->encoding != NULL)
@d is_fontfile(fm)     (fm_fontfile(fm) != NULL)
@d is_t1fontfile(fm)   (is_fontfile(fm) && !is_truetype(fm))

@d fm_slant(fm)        (fm)->slant
@d fm_extend(fm)       (fm)->extend
@d fm_fontfile(fm)     (fm)->ff_name

@<Exported function headers@>=
boolean mp_font_is_reencoded (MP mp, int f);
boolean mp_font_is_included (MP mp, int f);
boolean mp_font_is_subsetted (MP mp, int f);

@ @c
boolean mp_font_is_reencoded (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_font_size(mp,f) && mp_has_fm_entry (mp, f, &fm)) { 
    if (fm != NULL 
	&& (fm->ps_name != NULL)
	&& is_reencoded (fm))
      return 1;
  }
  return 0;
}
boolean mp_font_is_included (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_font_size(mp,f) && mp_has_fm_entry (mp, f, &fm)) { 
    if (fm != NULL 
	&& (fm->ps_name != NULL && fm->ff_name != NULL) 
	&& is_included (fm))
      return 1;
  }
  return 0;
}
boolean mp_font_is_subsetted (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_font_size(mp,f) && mp_has_fm_entry (mp, f,&fm)) { 
    if (fm != NULL 
  	  && (fm->ps_name != NULL && fm->ff_name != NULL) 
	  && is_included (fm) && is_subsetted (fm))
      return 1;
  }
  return 0;
}

@ @<Exported function headers@>=
char * mp_fm_encoding_name (MP mp, int f);
char * mp_fm_font_name (MP mp, int f);
char * mp_fm_font_subset_name (MP mp, int f);

@ 
@c char * mp_fm_encoding_name (MP mp, int f) {
  enc_entry *e;
  fm_entry *fm;
  if (mp_has_fm_entry (mp, f, &fm)) { 
    if (fm != NULL && (fm->ps_name != NULL)) {
      if (is_reencoded (fm)) {
   	e = fm->encoding;
      	if (e->enc_name!=NULL)
     	  return mp_xstrdup(e->enc_name);
      } else {
	return NULL;
      }
    }
  }
  print_err ("fontmap encoding problems for font ");
  mp_print(mp,mp->font_name[f]);
  mp_error(mp); 
  return NULL;
}
char * mp_fm_font_name (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_fm_entry (mp, f,&fm)) { 
    if (fm != NULL && (fm->ps_name != NULL)) {
      if (mp_font_is_included(mp, f) && !mp->font_ps_name_fixed[f]) {
	/* find the real fontname, and update |ps_name| and |subset_tag| if needed */
        if (t1_updatefm(mp,f,fm)) {
	  mp->font_ps_name_fixed[f] = true;
	} else {
	  print_err ("font loading problems for font ");
          mp_print(mp,mp->font_name[f]);
          mp_error(mp);
	}
      }
      return mp_xstrdup(fm->ps_name);
    }
  }
  print_err ("fontmap name problems for font ");
  mp_print(mp,mp->font_name[f]);
  mp_error(mp); 
  return NULL;
}

char * mp_fm_font_subset_name (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_fm_entry (mp, f, &fm)) { 
    if (fm != NULL && (fm->ps_name != NULL)) {
      if (is_subsetted(fm)) {
  	    char *s = mp_xmalloc(strlen(fm->ps_name)+8,1);
       	snprintf(s,strlen(fm->ps_name)+8,"%s-%s",fm->subset_tag,fm->ps_name);
 	    return s;
      } else {
        return mp_xstrdup(fm->ps_name);
      }
    }
  }
  print_err ("fontmap name problems for font ");
  mp_print(mp,mp->font_name[f]);
  mp_error(mp); 
  return NULL;
}

@ @<Exported function headers@>=
integer mp_fm_font_slant (MP mp, int f);
integer mp_fm_font_extend (MP mp, int f);

@ 
@c integer mp_fm_font_slant (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_fm_entry (mp, f, &fm)) { 
    if (fm != NULL && (fm->ps_name != NULL)) {
      return fm->slant;
    }
  }
  return 0;
}
integer mp_fm_font_extend (MP mp, int f) {
  fm_entry *fm;
  if (mp_has_fm_entry (mp, f, &fm)) { 
    if (fm != NULL && (fm->ps_name != NULL)) {
      return fm->extend;
    }
  }
  return 0;
}

@ @<Exported function headers@>=
boolean mp_do_ps_font (MP mp, font_number f);

@ @c boolean mp_do_ps_font (MP mp, font_number f) {
  fm_entry *fm_cur;
  (void)mp_has_fm_entry (mp, f, &fm_cur); /* for side effects */
  if (fm_cur == NULL)
    return 1;
  if (is_truetype(fm_cur) ||
	 (fm_cur->ps_name == NULL && fm_cur->ff_name == NULL)) {
    return 0;
  }
  if (is_included(fm_cur)) {
    mp_print_nl(mp,"%%BeginResource: font ");
    if (is_subsetted(fm_cur)) {
      mp_print(mp, fm_cur->subset_tag);
      mp_print_char(mp,'-');
    }
    mp_print(mp, fm_cur->ps_name);
    mp_print_ln(mp);
    writet1 (mp,f,fm_cur);
    mp_print_nl(mp,"%%EndResource");
    mp_print_ln(mp);
  }
  return 1;
}

@ Included subset fonts do not need and encoding vector, make
sure we skip that case.

@<Exported...@>=
void mp_list_used_resources (MP mp, int prologues, int procset);

@ @c void mp_list_used_resources (MP mp, int prologues, int procset) {
  font_number f; /* fonts used in a text node or as loop counters */
  int ff;  /* a loop counter */
  font_number ldf; /* the last \.{DocumentFont} listed (otherwise |null_font|) */
  boolean firstitem;
  if ( procset>0 )
    mp_print_nl(mp, "%%DocumentResources: procset mpost");
  else
    mp_print_nl(mp, "%%DocumentResources: procset mpost-minimal");
  ldf=null_font;
  firstitem=true;
  for (f=null_font+1;f<=mp->last_fnum;f++) {
    if ( (mp_has_font_size(mp,f))&&(mp_font_is_reencoded(mp,f)) ) {
	  for (ff=ldf;ff>=null_font;ff--) {
        if ( mp_has_font_size(mp,ff) )
          if ( mp_xstrcmp(mp->font_enc_name[f],mp->font_enc_name[ff])==0 )
            goto FOUND;
      }
      if ( mp_font_is_subsetted(mp,f) )
        goto FOUND;
      if ( mp->ps_offset+1+strlen(mp->font_enc_name[f])>
           (unsigned)mp->max_print_line )
        mp_print_nl(mp, "%%+ encoding");
      if ( firstitem ) {
        firstitem=false;
        mp_print_nl(mp, "%%+ encoding");
      }
      mp_print_char(mp, ' ');
      mp_print(mp, mp->font_enc_name[f]);
      ldf=f;
    }
  FOUND:
    ;
  }
  ldf=null_font;
  firstitem=true;
  for (f=null_font+1;f<=mp->last_fnum;f++) {
    if ( mp_has_font_size(mp,f) ) {
      for (ff=ldf;ff>=null_font;ff--) {
        if ( mp_has_font_size(mp,ff) )
          if ( mp_xstrcmp(mp->font_name[f],mp->font_name[ff])==0 )
            goto FOUND2;
      }
      if ( mp->ps_offset+1+strlen(mp->font_ps_name[f])>
	       (unsigned)mp->max_print_line )
        mp_print_nl(mp, "%%+ font");
      if ( firstitem ) {
        firstitem=false;
        mp_print_nl(mp, "%%+ font");
      }
      mp_print_char(mp, ' ');
	  if ( (prologues==3)&&
           (mp_font_is_subsetted(mp,f)) )
        mp_print(mp, mp_fm_font_subset_name(mp,f));
      else
        mp_print(mp, mp->font_ps_name[f]);
      ldf=f;
    }
  FOUND2:
    ;
  }
  mp_print_ln(mp);
} 

@ @<Exported...@>=
void mp_list_supplied_resources (MP mp, int prologues, int procset);

@ @c void mp_list_supplied_resources (MP mp, int prologues, int procset) {
  font_number f; /* fonts used in a text node or as loop counters */
  int ff; /* a loop counter */
  font_number ldf; /* the last \.{DocumentFont} listed (otherwise |null_font|) */
  boolean firstitem;
  if ( procset>0 )
    mp_print_nl(mp, "%%DocumentSuppliedResources: procset mpost");
  else
    mp_print_nl(mp, "%%DocumentSuppliedResources: procset mpost-minimal");
  ldf=null_font;
  firstitem=true;
  for (f=null_font+1;f<=mp->last_fnum;f++) {
    if ( (mp_has_font_size(mp,f))&&(mp_font_is_reencoded(mp,f)) )  {
       for (ff=ldf;ff>= null_font;ff++) {
         if ( mp_has_font_size(mp,ff) )
           if ( mp_xstrcmp(mp->font_enc_name[f],mp->font_enc_name[ff])==0 )
             goto FOUND;
        }
      if ( (prologues==3)&&(mp_font_is_subsetted(mp,f)))
        goto FOUND;
      if ( mp->ps_offset+1+strlen(mp->font_enc_name[f])>(unsigned)mp->max_print_line )
        mp_print_nl(mp, "%%+ encoding");
      if ( firstitem ) {
        firstitem=false;
        mp_print_nl(mp, "%%+ encoding");
      }
      mp_print_char(mp, ' ');
      mp_print(mp, mp->font_enc_name[f]);
      ldf=f;
    }
  FOUND:
    ;
  }
  ldf=null_font;
  firstitem=true;
  if (prologues==3) {
    for (f=null_font+1;f<=mp->last_fnum;f++) {
      if ( mp_has_font_size(mp,f) ) {
        for (ff=ldf;ff>= null_font;ff--) {
          if ( mp_has_font_size(mp,ff) )
            if ( mp_xstrcmp(mp->font_name[f],mp->font_name[ff])==0 )
               goto FOUND2;
        }
        if ( ! mp_font_is_included(mp,f) )
          goto FOUND2;
        if ( mp->ps_offset+1+strlen(mp->font_ps_name[f])>(unsigned)mp->max_print_line )
          mp_print_nl(mp, "%%+ font");
        if ( firstitem ) {
          firstitem=false;
          mp_print_nl(mp, "%%+ font");
        }
        mp_print_char(mp, ' ');
	    if ( mp_font_is_subsetted(mp,f) ) 
          mp_print(mp, mp_fm_font_subset_name(mp,f));
        else
          mp_print(mp, mp->font_ps_name[f]);
        ldf=f;
      }
    FOUND2:
      ;
    }
    mp_print_ln(mp);
  }
}

@ @<Exported...@>=
void mp_list_needed_resources (MP mp, int prologues);

@ @c void mp_list_needed_resources (MP mp, int prologues) {
  font_number f; /* fonts used in a text node or as loop counters */
  int ff; /* a loop counter */
  font_number ldf; /* the last \.{DocumentFont} listed (otherwise |null_font|) */
  boolean firstitem;
  ldf=null_font;
  firstitem=true;
  for (f=null_font+1;f<=mp->last_fnum;f++ ) {
    if ( mp_has_font_size(mp,f)) {
      for (ff=ldf;ff>=null_font;ff--) {
        if ( mp_has_font_size(mp,ff) )
          if ( mp_xstrcmp(mp->font_name[f],mp->font_name[ff])==0 )
             goto FOUND;
      };
      if ((prologues==3)&&(mp_font_is_included(mp,f)) )
        goto FOUND;
      if ( mp->ps_offset+1+strlen(mp->font_ps_name[f])>(unsigned)mp->max_print_line )
        mp_print_nl(mp, "%%+ font");
      if ( firstitem ) {
        firstitem=false;
        mp_print_nl(mp, "%%DocumentNeededResources: font");
      }
      mp_print_char(mp, ' ');
      mp_print(mp, mp->font_ps_name[f]);
      ldf=f;
    }
  FOUND:
    ;
  }
  if ( ! firstitem ) {
    mp_print_ln(mp);
    ldf=null_font;
    firstitem=true;
    for (f=null_font+1;f<= mp->last_fnum;f++) {
      if ( mp_has_font_size(mp,f) ) {
        for (ff=ldf;ff>=null_font;ff-- ) {
          if ( mp_has_font_size(mp,ff) )
            if ( mp_xstrcmp(mp->font_name[f],mp->font_name[ff])==0 )
              goto FOUND2;
        }
        if ((prologues==3)&&(mp_font_is_included(mp,f)) )
          goto FOUND2;
        mp_print(mp, "%%IncludeResource: font ");
        mp_print(mp, mp->font_ps_name[f]);
        mp_print_ln(mp);
        ldf=f;
      }
    FOUND2:
      ;
    }
  }
}

@ @<Exported...@>=
void mp_write_font_definition (MP mp, font_number f, int prologues);

@ 

@d applied_reencoding(A) ((mp_font_is_reencoded(mp,(A)))&&
    ((! mp_font_is_subsetted(mp,(A)))||(prologues==2)))

@c void mp_write_font_definition(MP mp, font_number f, int prologues) {
  if ( (applied_reencoding(f))||(mp_fm_font_slant(mp,f)!=0)||
       (mp_fm_font_extend(mp,f)!=0)||
       (mp_xstrcmp(mp->font_name[f],"psyrgo")==0)||
       (mp_xstrcmp(mp->font_name[f],"zpzdr-reversed")==0) ) {
    if ( (mp_font_is_subsetted(mp,f))&&
	 (mp_font_is_included(mp,f))&&(prologues==3))
      mp_ps_name_out(mp, mp_fm_font_subset_name(mp,f),true);
    else 
      mp_ps_name_out(mp, mp->font_ps_name[f],true);
    mp_ps_print(mp, " fcp");
    mp_print_ln(mp);
    if ( applied_reencoding(f) ) {
      mp_ps_print(mp, "/Encoding ");
      mp_ps_print(mp, mp->font_enc_name[f]);
      mp_ps_print(mp, " def ");
    };
    if ( mp_fm_font_slant(mp,f)!=0 ) {
      mp_print_int(mp, mp_fm_font_slant(mp,f));
      mp_ps_print(mp, " SlantFont ");
    };
    if ( mp_fm_font_extend(mp,f)!=0 ) {
      mp_print_int(mp, mp_fm_font_extend(mp,f));
      mp_ps_print(mp, " ExtendFont ");
    };
    if ( mp_xstrcmp(mp->font_name[f],"psyrgo")==0 ) {
      mp_ps_print(mp, " 890 ScaleFont ");
      mp_ps_print(mp, " 277 SlantFont ");
    };
    if ( mp_xstrcmp(mp->font_name[f],"zpzdr-reversed")==0 ) {
      mp_ps_print(mp, " FontMatrix [-1 0 0 1 0 0] matrix concatmatrix /FontMatrix exch def ");
      mp_ps_print(mp, "/Metrics 2 dict dup begin ");
      mp_ps_print(mp, "/space[0 -278]def ");
      mp_ps_print(mp, "/a12[-904 -939]def ");
      mp_ps_print(mp, "end def ");
    };  
    mp_ps_print(mp, "currentdict end");
    mp_print_ln(mp);
    mp_ps_print_defined_name(mp,f,prologues);
    mp_ps_print(mp, " exch definefont pop");
    mp_print_ln(mp);
  }
}

@ @<Exported...@>=
void mp_ps_print_defined_name (MP mp, font_number f, int prologues);

@ 
@c  void mp_ps_print_defined_name(MP mp, font_number A, int prologues) {
  mp_ps_print(mp, " /");
  if ((mp_font_is_subsetted(mp,(A)))&&
      (mp_font_is_included(mp,(A)))&&(prologues==3))
    mp_print(mp, mp_fm_font_subset_name(mp,(A)));
  else 
    mp_print(mp, mp->font_ps_name[(A)]);
  if ( mp_xstrcmp(mp->font_name[(A)],"psyrgo")==0 )
    mp_ps_print(mp, "-Slanted");
  if ( mp_xstrcmp(mp->font_name[(A)],"zpzdr-reversed")==0 ) 
    mp_ps_print(mp, "-Reverse");
  if ( applied_reencoding((A)) ) { 
    mp_ps_print(mp, "-");
    mp_ps_print(mp, mp->font_enc_name[(A)]); 
  }
  if ( mp_fm_font_slant(mp,(A))!=0 ) {
    mp_ps_print(mp, "-Slant_"); mp_print_int(mp, mp_fm_font_slant(mp,(A))) ;
  }
  if ( mp_fm_font_extend(mp,(A))!=0 ) {
    mp_ps_print(mp, "-Extend_"); mp_print_int(mp, mp_fm_font_extend(mp,(A))); 
  }
}

@ @<Include encodings and fonts for edge structure~|h|@>=
mp_font_encodings(mp,mp->last_fnum,prologues==2);
@<Embed fonts that are available@>

@ @<Embed fonts that are available@>=
{ 
next_size=0;
@<Make |cur_fsize| a copy of the |font_sizes| array@>;
do {  
  done_fonts=true;
  for (f=null_font+1;f<=mp->last_fnum;f++) {
    if ( cur_fsize[f]!=null ) {
      if (prologues==3 ) {
        if ( ! mp_do_ps_font(mp,f) ) {
	      if ( mp_has_fm_entry(mp,f, NULL) ) {
            print_err("Font embedding failed");
            mp_error(mp);
          }
        }
      }
      cur_fsize[f]=link(cur_fsize[f]);
      if ( cur_fsize[f]!=null ) { mp_unmark_font(mp, f); done_fonts=false; }
    }
  }
  if ( ! done_fonts )
    @<Increment |next_size| and apply |mark_string_chars| to all text nodes with
      that size index@>;
} while (! done_fonts);
}

@ @<Increment |next_size| and apply |mark_string_chars| to all text nodes...@>=
{ 
  next_size++;
  mp_apply_mark_string_chars(mp, h, next_size);
}

@ We also need to keep track of which characters are used in text nodes
in the edge structure that is being shipped out.  This is done by procedures
that use the left-over |b3| field in the |char_info| words; i.e.,
|char_info(f)(c).b3| gives the status of character |c| in font |f|.

@<Types...@>=
enum {unused=0, used};

@ @<Exported ...@>=
void mp_unmark_font (MP mp,font_number f) ;

@ @c
void mp_unmark_font (MP mp,font_number f) {
  int k; /* an index into |font_info| */
  for (k= mp->char_base[f]+mp->font_bc[f];
       k<=mp->char_base[f]+mp->font_ec[f];
       k++)
    mp->font_info[k].qqqq.b3=unused;
}


@ @<Exported...@>=
void mp_print_improved_prologue (MP mp, int prologues, int procset, 
                                 int groffmode, int null, pointer h) ;


@
@c
void mp_print_improved_prologue (MP mp, int prologues, int procset, 
                                 int groffmode, int null, pointer h) {
  quarterword next_size; /* the size index for fonts being listed */
  pointer *cur_fsize; /* current positions in |font_sizes| */
  boolean done_fonts; /* have we finished listing the fonts in the header? */
  font_number f; /* a font number for loops */
   
  cur_fsize = mp_xmalloc((mp->font_max+1),sizeof(pointer));

  mp_list_used_resources(mp, prologues, procset);
  mp_list_supplied_resources(mp, prologues, procset);
  mp_list_needed_resources(mp, prologues);
  mp_print_nl(mp, "%%EndComments");
  mp_print_nl(mp, "%%BeginProlog");
  if ( procset>0 )
    mp_print_nl(mp, "%%BeginResource: procset mpost");
  else
    mp_print_nl(mp, "%%BeginResource: procset mpost-minimal");
  mp_print_nl(mp, "/bd{bind def}bind def"
                  "/fshow {exch findfont exch scalefont setfont show}bd");
  if ( procset>0 ) @<Print the procset@>;
  mp_print_nl(mp, "/fcp{findfont dup length dict begin"
                  "{1 index/FID ne{def}{pop pop}ifelse}forall}bd");
  mp_print_nl(mp, "/fmc{FontMatrix dup length array copy dup dup}bd"
                   "/fmd{/FontMatrix exch def}bd");
  mp_print_nl(mp, "/Amul{4 -1 roll exch mul 1000 div}bd"
                  "/ExtendFont{fmc 0 get Amul 0 exch put fmd}bd");
  if ( groffmode>0 ) {
    mp_print_nl(mp, "/ScaleFont{dup fmc 0 get"
	                " Amul 0 exch put dup dup 3 get Amul 3 exch put fmd}bd");
    };
  mp_print_nl(mp, "/SlantFont{fmc 2 get dup 0 eq{pop 1}if"
	              " Amul FontMatrix 0 get mul 2 exch put fmd}bd");
  mp_print_nl(mp, "%%EndResource");
  @<Include encodings and fonts  for edge structure~|h|@>;
  mp_print_nl(mp, "%%EndProlog");
  mp_print_nl(mp, "%%BeginSetup");
  mp_print_ln(mp);
  for (f=null_font+1;f<=mp->last_fnum;f++) {
    if ( mp_has_font_size(mp,f) ) {
      if ( mp_has_fm_entry(mp,f,NULL) ) {
        mp_write_font_definition(mp,f,(mp->internal[prologues]>>16));
        mp_ps_name_out(mp, mp->font_name[f],true);
        mp_ps_print_defined_name(mp,f,(mp->internal[prologues]>>16));
        mp_ps_print(mp, " def");
      } else {
	char s[256];
        snprintf(s,256,"font %s cannot be found in any fontmapfile!", mp->font_name[f]);
      	mp_warn(mp,s);
        mp_ps_name_out(mp, mp->font_name[f],true);
        mp_ps_name_out(mp, mp->font_name[f],true);
        mp_ps_print(mp, " def");
      }
      mp_print_ln(mp);
    }
  }
  mp_print_nl(mp, "%%EndSetup");
  mp_print_nl(mp, "%%Page: 1 1");
  mp_print_ln(mp);
  mp_xfree(cur_fsize);
}

@ @<Exported...@>=
font_number mp_print_font_comments (MP mp , int prologues, int null, pointer h);


@ 
@c 
font_number mp_print_font_comments (MP mp , int prologues, int null, pointer h) {
  quarterword next_size; /* the size index for fonts being listed */
  pointer *cur_fsize; /* current positions in |font_sizes| */
  int ff; /* a loop counter */
  boolean done_fonts; /* have we finished listing the fonts in the header? */
  font_number f; /* a font number for loops */
  scaled ds; /* design size and scale factor for a text node */
  font_number ldf=0; /* the last \.{DocumentFont} listed (otherwise |null_font|) */
  cur_fsize = mp_xmalloc((mp->font_max+1),sizeof(pointer));
  if ( prologues>0 ) {
    @<Give a \.{DocumentFonts} comment listing all fonts with non-null
      |font_sizes| and eliminate duplicates@>;
  } else { 
    next_size=0;
    @<Make |cur_fsize| a copy of the |font_sizes| array@>;
    do {  done_fonts=true;
      for (f=null_font+1;f<=mp->last_fnum;f++) {
        if ( cur_fsize[f]!=null ) {
          @<Print the \.{\%*Font} comment for font |f| and advance |cur_fsize[f]|@>;
        }
        if ( cur_fsize[f]!=null ) { mp_unmark_font(mp, f); done_fonts=false;  };
      }
      if ( ! done_fonts ) {
        @<Increment |next_size| and apply |mark_string_chars| to all text nodes with
          that size index@>;
      }
    } while (! done_fonts);
  }
  mp_xfree(cur_fsize);
  return ldf;
}

@ @<Make |cur_fsize| a copy of the |font_sizes| array@>=
for (f=null_font+1;f<= mp->last_fnum;f++)
  cur_fsize[f]=mp->font_sizes[f]

@ It's not a good idea to make any assumptions about the |font_ps_name| entries,
so we carefully remove duplicates.  There is no harm in using a slow, brute-force
search.

@<Give a \.{DocumentFonts} comment listing all fonts with non-null...@>=
{ 
  ldf=null_font;
  for (f=null_font+1;f<= mp->last_fnum;f++) {
    if ( mp->font_sizes[f]!=null ) {
      if ( ldf==null_font ) 
        mp_print_nl(mp, "%%DocumentFonts:");
      for (ff=ldf;ff>=null_font;ff--) {
        if ( mp->font_sizes[ff]!=null )
          if ( mp_xstrcmp(mp->font_ps_name[f],mp->font_ps_name[ff])==0 )
            goto FOUND;
      }
      if ( mp->ps_offset+1+strlen(mp->font_ps_name[f])>(unsigned)mp->max_print_line )
        mp_print_nl(mp, "%%+");
      mp_print_char(mp, ' ');
      mp_print(mp, mp->font_ps_name[f]);
      ldf=f;
    FOUND:
      ;
    }
  }
}

@ @c
void mp_hex_digit_out (MP mp,small_number d) { 
  if ( d<10 ) mp_print_char(mp, d+'0');
  else mp_print_char(mp, d+'a'-10);
}

@ We output the marks as a hexadecimal bit string starting at |c| or
|font_bc[f]|, whichever is greater.  If the output has to be truncated
to avoid exceeding |emergency_line_length| the return value says where to
start scanning next time.

@<Declarations@>=
halfword mp_ps_marks_out (MP mp,font_number f, eight_bits c);

@ 
@d emergency_line_length 255
  /* \ps\ output lines can be this long in unusual circumstances */

@c
halfword mp_ps_marks_out (MP mp,font_number f, eight_bits c) {
  eight_bits bc,ec; /* only encode characters between these bounds */
  integer lim; /* the maximum number of marks to encode before truncating */
  int p; /* |font_info| index for the current character */
  int d,b; /* used to construct a hexadecimal digit */
  lim=4*(emergency_line_length-mp->ps_offset-4);
  bc=mp->font_bc[f];
  ec=mp->font_ec[f];
  if ( c>bc ) bc=c;
  @<Restrict the range |bc..ec| so that it contains no unused characters
    at either end and has length at most |lim|@>;
  @<Print the initial label indicating that the bitmap starts at |bc|@>;
  @<Print a hexadecimal encoding of the marks for characters |bc..ec|@>;
  while ( (ec<mp->font_ec[f])&&(mp->font_info[p].qqqq.b3==unused) ) {
    p++; ec++;
  }
  return (ec+1);
}

@ We could save time by setting the return value before the loop that
decrements |ec|, but there is no point in being so tricky.

@<Restrict the range |bc..ec| so that it contains no unused characters...@>=
p=mp->char_base[f]+bc;
while ( (mp->font_info[p].qqqq.b3==unused)&&(bc<ec) ) {
  p++; bc++;
}
if ( ec>=bc+lim ) ec=bc+lim-1;
p=mp->char_base[f]+ec;
while ( (mp->font_info[p].qqqq.b3==unused)&&(bc<ec) ) { 
  p--; ec--;
}

@ @<Print the initial label indicating that the bitmap starts at |bc|@>=
mp_print_char(mp, ' ');
mp_hex_digit_out(mp, bc / 16);
mp_hex_digit_out(mp, bc % 16);
mp_print_char(mp, ':')

@ 

@<Print a hexadecimal encoding of the marks for characters |bc..ec|@>=
b=8; d=0;
for (p=mp->char_base[f]+bc;p<=mp->char_base[f]+ec;p++) {
  if ( b==0 ) {
    mp_hex_digit_out(mp, d);
    d=0; b=8;
  }
  if ( mp->font_info[p].qqqq.b3!=unused ) d=d+b;
  b=b>>1;
}
mp_hex_digit_out(mp, d)


@ Here is a simple function that determines whether there are any marked
characters in font~|f| with character code at least~|c|.

@<Declarations@>=
boolean mp_check_ps_marks (MP mp,font_number f, integer  c) ;

@ @c
boolean mp_check_ps_marks (MP mp,font_number f, integer  c) {
  int p; /* |font_info| index for the current character */
  for (p=mp->char_base[f]+c;p<=mp->char_base[f]+mp->font_ec[f];p++) {
    if ( mp->font_info[p].qqqq.b3==used ) 
       return true;
  }
  return false;
}


@ If the file name is so long that it can't be printed without exceeding
|emergency_line_length| then there will be missing items in the \.{\%*Font:}
line.  We might have to repeat line in order to get the character usage
information to fit within |emergency_line_length|.

TODO: these two defines are also defined in mp.w!

@d link(A)   mp->mem[(A)].hh.rh /* the |link| field of a memory word */
@d sc_factor(A) mp->mem[(A)+1].cint /* the scale factor stored in a font size node */

@<Print the \.{\%*Font} comment for font |f| and advance |cur_fsize[f]|@>=
{ integer t=0;
  while ( mp_check_ps_marks(mp, f,t) ) {
    mp_print_nl(mp, "%*Font: ");
    if ( mp->ps_offset+strlen(mp->font_name[f])+12>emergency_line_length )
      break;
    mp_print(mp, mp->font_name[f]);
    mp_print_char(mp, ' ');
    ds=(mp->font_dsize[f] + 8) / 16;
    mp_print_scaled(mp, mp_take_scaled(mp, ds,sc_factor(cur_fsize[f])));
    if ( mp->ps_offset+12>emergency_line_length ) break;
    mp_print_char(mp, ' ');
    mp_print_scaled(mp, ds);
    if ( mp->ps_offset+5>emergency_line_length ) break;
    t=mp_ps_marks_out(mp, f,t);
  }
  cur_fsize[f]=link(cur_fsize[f]);
}

@ @<Print the procset@>=
{
  mp_print_nl(mp, "/hlw{0 dtransform exch truncate exch idtransform pop setlinewidth}bd");
  mp_print_nl(mp, "/vlw{0 exch dtransform truncate idtransform setlinewidth pop}bd");
  mp_print_nl(mp, "/l{lineto}bd/r{rlineto}bd/c{curveto}bd/m{moveto}bd"
                  "/p{closepath}bd/n{newpath}bd");
  mp_print_nl(mp, "/C{setcmykcolor}bd/G{setgray}bd/R{setrgbcolor}bd"
                  "/lj{setlinejoin}bd/ml{setmiterlimit}bd");
  mp_print_nl(mp, "/lc{setlinecap}bd/S{stroke}bd/F{fill}bd/q{gsave}bd"
                  "/Q{grestore}bd/s{scale}bd/t{concat}bd");
  mp_print_nl(mp, "/sd{setdash}bd/rd{[] 0 setdash}bd/P{showpage}bd/B{q F Q}bd/W{clip}bd");
}


@ The prologue defines \.{fshow} and corrects for the fact that \.{fshow}
arguments use |font_name| instead of |font_ps_name|.  Downloaded bitmap fonts
might not have reasonable |font_ps_name| entries, but we just charge ahead
anyway.  The user should not make \&{prologues} positive if this will cause
trouble.
@:prologues_}{\&{prologues} primitive@>

@<Exported...@>=
void mp_print_prologue (MP mp, int prologues, int procset, int ldf);

@ @c 
void mp_print_prologue (MP mp, int prologues, int procset, int ldf) {
  font_number f;
  mp_print(mp, "%%BeginProlog"); mp_print_ln(mp);
  if ( (prologues>0)||(procset>0) ) {
    if ( ldf!=null_font ) {
      if ( prologues>0 ) {
        for (f=null_font+1;f<=mp->last_fnum;f++) {
          if ( mp_has_font_size(mp,f) ) {
            mp_ps_name_out(mp, mp->font_name[f],true);
            mp_ps_name_out(mp, mp->font_ps_name[f],true);
            mp_ps_print(mp, " def");
            mp_print_ln(mp);
          }
        }
        if ( procset==0 ) {
          mp_print(mp, "/fshow {exch findfont exch scalefont setfont show}bind def");
          mp_print_ln(mp);
        }
      }
    }
    if (procset>0 ) {
      mp_print_nl(mp, "%%BeginResource: procset mpost");
      if ( (prologues>0)&&(ldf!=null_font) )
        mp_print(mp, 
        "/bd{bind def}bind def/fshow {exch findfont exch scalefont setfont show}bd");
      else
        mp_print_nl(mp, "/bd{bind def}bind def");
      @<Print the procset@>;
      mp_print_nl(mp, "%%EndResource");
      mp_print_ln(mp);
    }
  }
  mp_print(mp, "%%EndProlog");
}


