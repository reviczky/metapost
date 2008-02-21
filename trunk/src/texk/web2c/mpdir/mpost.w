% $Id: mpost.w $
% MetaPost command-line program, by Taco Hoekwater.  Public domain.

\font\tenlogo=logo10 % font used for the METAFONT logo
\def\MP{{\tenlogo META}\-{\tenlogo POST}}

\def\title{MetaPost executable}
\def\[#1]{#1.}
\pdfoutput=1

@* \[1] Metapost executable.

Now that all of \MP\ is a library, a separate program is needed to 
have our customary command-line interface. 

@ First, here are the C includes. |avl.h| is needed because of an 
|avl_allocator| that is defined in |mplib.h|

@d true 1
@d false 0
 
@c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <mplib.h>
#define HAVE_PROTOTYPES 1
#include <kpathsea/progname.h>
#include <kpathsea/tex-file.h>
#include <kpathsea/variable.h>
extern unsigned kpathsea_debug;
#include <kpathsea/concatn.h>
static string mpost_tex_program = "";

@ Allocating a bit of memory, with error detection:

@c
void  *xmalloc (size_t bytes) {
  void *w = malloc (bytes);
  if (w==NULL) {
    fprintf(stderr,"Out of memory!\n");
    exit(EXIT_FAILURE);
  }
  return w;
}
char *xstrdup(const char *s) {
  char *w; 
  if (s==NULL) return NULL;
  w = strdup(s);
  if (w==NULL) {
    fprintf(stderr,"Out of memory!\n");
    exit(EXIT_FAILURE);
  }
  return w;
}


@ 
@c
void mpost_run_editor (MP mp, char *fname, int fline) {
  if (mp)
    fprintf(stdout,"Ok, bye (%s,%d)!",fname, fline);
  exit(EXIT_SUCCESS);
}

@ 
@<Register the callback routines@>=
options->run_editor = mpost_run_editor;

@
@c 
string normalize_quotes (const char *name, const char *mesg) {
    int quoted = false;
    int must_quote = (strchr(name, ' ') != NULL);
    /* Leave room for quotes and NUL. */
    string ret = (string)xmalloc(strlen(name)+3);
    string p;
    const_string q;
    p = ret;
    if (must_quote)
        *p++ = '"';
    for (q = name; *q; q++) {
        if (*q == '"')
            quoted = !quoted;
        else
            *p++ = *q;
    }
    if (must_quote)
        *p++ = '"';
    *p = '\0';
    if (quoted) {
        fprintf(stderr, "! Unbalanced quotes in %s %s\n", mesg, name);
        exit(EXIT_FAILURE);
    }
    return ret;
}


@ Invoke makempx (or troffmpx) to make sure there is an up-to-date
   .mpx file for a given .mp file.  (Original from John Hobby 3/14/90) 

@c

#ifndef MPXCOMMAND
#define MPXCOMMAND "makempx"
#endif
int mpost_run_make_mpx (MP mp, char *mpname, char *mpxname) {
  int ret;
  string cnf_cmd = kpse_var_value ("MPXCOMMAND");
  
  if (cnf_cmd && (strcmp (cnf_cmd, "0")==0)) {
    /* If they turned off this feature, just return success.  */
    ret = 0;

  } else {
    /* We will invoke something. Compile-time default if nothing else.  */
    string cmd;
    string qmpname = normalize_quotes(mpname, "mpname");
    string qmpxname = normalize_quotes(mpxname, "mpxname");
    if (!cnf_cmd)
      cnf_cmd = xstrdup (MPXCOMMAND);

    if (mp_troff_mode(mp))
      cmd = concatn (cnf_cmd, " -troff ",
                     qmpname, " ", qmpxname, NULL);
    else if (mpost_tex_program && *mpost_tex_program)
      cmd = concatn (cnf_cmd, " -tex=", mpost_tex_program, " ",
                     qmpname, " ", qmpxname, NULL);
    else
      cmd = concatn (cnf_cmd, " -tex ", qmpname, " ", qmpxname, NULL);

    /* Run it.  */
    ret = system (cmd);
    free (cmd);
    free (qmpname);
    free (qmpxname);
  }

  free (cnf_cmd);
  return ret == 0;
}

@ 
@<Register the callback routines@>=
if (!nokpse)
  options->run_make_mpx = mpost_run_make_mpx;


@ @c int mpost_get_random_seed (MP mp) {
  int ret ;
#if defined (HAVE_GETTIMEOFDAY)
  struct timeval tv;
  gettimeofday(&tv, NULL);
  ret = (tv.tv_usec + 1000000 * tv.tv_usec);
#elif defined (HAVE_FTIME)
  struct timeb tb;
  ftime(&tb);
  ret = (tb.millitm + 1000 * tb.time);
#else
  time_t clock = time ((time_t*)NULL);
  struct tm *tmptr = localtime(&clock);
  ret = (tmptr->tm_sec + 60*(tmptr->tm_min + 60*tmptr->tm_hour));
#endif
  return (mp ? ret : ret); /* for -W */
}

@ @<Register the callback routines@>=
options->get_random_seed = mpost_get_random_seed;

@ 
@c char *mpost_find_file(char *fname, char *fmode, int ftype)  {
  char *s;
  int l ;
  if (fmode[0]=='r') {
    switch(ftype) {
    case mp_filetype_program: 
      l = strlen(fname);
   	  if (l>3 && strcmp(fname+l-3,".mf")==0) {
   	    s = kpse_find_file (fname, kpse_mf_format, 0); 
      } else {
   	    s = kpse_find_file (fname, kpse_mp_format, 0); 
      }
      break;
    case mp_filetype_text: 
      s = kpse_find_file (fname, kpse_mp_format, 0); 
      break;
    case mp_filetype_memfile: 
      s = kpse_find_file (fname, kpse_mem_format, 0); 
      break;
    case mp_filetype_metrics: 
      s = kpse_find_file (fname, kpse_tfm_format, 0); 
      break;
    case mp_filetype_fontmap: 
      s = kpse_find_file (fname, kpse_fontmap_format, 0); 
      break;
    case mp_filetype_font: 
      s = kpse_find_file (fname, kpse_type1_format, 0); 
      break;
    case mp_filetype_encoding: 
      s = kpse_find_file (fname, kpse_enc_format, 0); 
      break;
    }
  } else {
    s = xstrdup(fname); /* when writing */
  }
  return s;
}

@  @<Register the callback routines@>=
if (!nokpse)
  options->find_file = mpost_find_file;

@ At the moment, the command line is very simple.

@d option_is(A) ((strncmp(argv[a],"--" A, strlen(A)+2)==0) || 
       (strncmp(argv[a],"-" A, strlen(A)+1)==0))
@d option_arg(B) (optarg && strncmp(optarg,B, strlen(B))==0)


@<Read and set commmand line options@>=
{
  char *optarg;
  while (++a<argc) {
    optarg = strstr(argv[a],"=") ;
    if (optarg!=NULL) {
      optarg++;
      if (!*optarg)  optarg=NULL;
    }
    if (option_is("ini")) {
      options->ini_version = true;
    } else if (option_is ("kpathsea-debug")) {
      kpathsea_debug |= atoi (optarg);
    } else if (option_is("mem")) {
      options->mem_name = xstrdup(optarg);
      if (!user_progname) 
	    user_progname = optarg;
    } else if (option_is("jobname")) {
      options->job_name = xstrdup(optarg);
    } else if (option_is ("progname")) {
      user_progname = optarg;
    } else if (option_is("troff")) {
      options->troff_mode = true;
    } else if (option_is ("tex")) {
      mpost_tex_program = optarg;
    } else if (option_is("interaction")) {
      if (option_arg("batchmode")) {
        options->interaction = mp_batch_mode;
      } else if (option_arg("nonstopmode")) {
        options->interaction = mp_nonstop_mode;
      } else if (option_arg("scrollmode")) {
        options->interaction = mp_scroll_mode;
      } else if (option_arg("errorstopmode")) {
        options->interaction = mp_error_stop_mode;
      } else {
        fprintf(stdout,"unknown option argument %s\n", argv[a]);
      }
    } else if (option_is("no-kpathsea")) {
      nokpse=1;
    } else if (option_is("help")) {
      @<Show help and exit@>;
    } else if (option_is("version")) {
      @<Show version and exit@>;
    } else if (option_is("")) {
      continue; /* ignore unknown options */
    } else {
      break;
    }
  }
}

@ 
@<Show help...@>=
{
fprintf(stdout,
"\n"
"Usage: mpost [OPTION] [MPNAME[.mp]] [COMMANDS]\n"
"\n"
"  Run MetaPost on MPNAME, usually creating MPNAME.NNN (and perhaps\n"
"  MPNAME.tfm), where NNN are the character numbers generated.\n"
"  Any remaining COMMANDS are processed as MetaPost input,\n"
"  after MPNAME is read.\n"
"\n"
"  If no arguments or options are specified, prompt for input.\n"
"\n"
"  -ini                    be inimpost, for dumping mems\n"
"  -interaction=STRING     set interaction mode (STRING=batchmode/nonstopmode/\n"
"                          scrollmode/errorstopmode)\n"
"  -jobname=STRING         set the job name to STRING\n"
"  -progname=STRING        set program (and mem) name to STRING\n"
"  -tex=TEXPROGRAM         use TEXPROGRAM for text labels\n"
"  -kpathsea-debug=NUMBER  set path searching debugging flags according to\n"
"                          the bits of NUMBER\n"
"  -mem=MEMNAME            use MEMNAME instead of program name or a %%& line\n"
"  -troff                  set the prologues variable, use `makempx -troff'\n"
"  -help                   display this help and exit\n"
"  -version                output version information and exit\n"
"\n"
"Email bug reports to mp-implementors@@tug.org.\n"
"\n");
  exit(EXIT_SUCCESS);
}

@ 
@<Show version...@>=
{
fprintf(stdout,
"\n"
"MetaPost %s (CWeb version %s)\n"
"Copyright 2008 AT&T Bell Laboratories.\n"
"There is NO warranty.  Redistribution of this software is\n"
"covered by the terms of both the MetaPost copyright and\n"
"the Lesser GNU General Public License.\n"
"For more information about these matters, see the file\n"
"named COPYING and the MetaPost source.\n"
"Primary author of MetaPost: John Hobby.\n"
"Current maintainer of MetaPost: Taco Hoekwater.\n"
"\n", mp_metapost_version(mp), mp_mplib_version(mp));
  exit(EXIT_SUCCESS);
}

@ The final part of the command line, after option processing, is
stored in the \MP\ instance, this will be taken as the first line of
input.

@d command_line_size 256

@<Copy the rest of the command line@>=
{
  options->command_line = xmalloc(command_line_size);
  strcpy(options->command_line,"");
  if (a<argc) {
    k=0;
    for(;a<argc;a++) {
      char *c = argv[a];
      while (*c) {
	    if (k<(command_line_size-1)) {
          options->command_line[k++] = *c;
        }
        c++;
      }
      options->command_line[k++] = ' ';
    }
	while (k>0) {
      if (options->command_line[(k-1)] == ' ') 
        k--; 
      else 
        break;
    }
    options->command_line[k] = 0;
  }
}

@ A simple function to get numerical |texmf.cnf| values
@c
int setup_var (int def, char *var_name, int nokpse) {
  if (!nokpse) {
    char * expansion = kpse_var_value (var_name);
    if (expansion) {
      int conf_val = atoi (expansion);
      free (expansion);
      if (conf_val > 0) {
        return conf_val;
      }
    }
  }
  return def;
}


@ Now this is really it: \MP\ starts and ends here.

@c 
int main (int argc, char **argv) { /* |start_here| */
  int a=0; /* argc counter */
  int k; /* index into buffer */
  int history; /* the exit status */
  MP mp; /* a metapost instance */
  struct MP_options * options; /* instance options */
  int nokpse = 0; /* switch to {\it not} enable kpse */
  char *user_progname = NULL; /* If the user overrides argv[0] with -progname.  */
  options = mp_options();
  options->ini_version       = false;
  options->print_found_names = true;
  @<Read and set commmand line options@>;
  if (!nokpse)
    kpse_set_program_name("mpost",user_progname);  
  if(putenv("engine=newmetapost"))
    fprintf(stdout,"warning: could not set up $engine\n");
  options->main_memory       = setup_var (50000,"main_memory",nokpse);
  options->hash_size         = setup_var (9500,"hash_size",nokpse);
  options->hash_prime        = 7919;
  options->max_in_open       = setup_var (25,"max_in_open",nokpse);
  options->param_size        = setup_var (1500,"param_size",nokpse);
  options->error_line        = setup_var (79,"error_line",nokpse);
  options->half_error_line   = setup_var (50,"half_error_line",nokpse);
  options->max_print_line    = setup_var (100,"max_print_line",nokpse);
  @<Copy the rest of the command line@>;
  @<Register the callback routines@>;
  mp = mp_new(options);
  free((void *)options);
  if (mp==NULL)
	exit(EXIT_FAILURE);
  history = mp_initialize(mp);
  if (history) 
    exit(history);
  history = mp_run(mp);
  mp_free(mp);
  exit(history);
}

