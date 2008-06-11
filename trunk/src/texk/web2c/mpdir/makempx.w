
\def\title{Makempx}
\def\hang{\hangindent 3em\indent\ignorespaces}
\def\MP{MetaPost}
\def\LaTeX{{\rm L\kern-.36em\raise.3ex\hbox{\sc a}\kern-.15em
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}

\def\(#1){} % this is used to make section names sort themselves better
\def\9#1{} % this is used for sort keys in the index
\def\[#1]{#1.}

\pdfoutput=1

@* The main program.

@c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <kpathsea/kpathsea.h>
#include "mpxout.h"

@ @c
int main (int ac, char **av) {
  int h;
  char *mpname = NULL;
  char *mpxname = NULL;
  char *cmd = NULL;
  int mode = 0;
  int debug = 0;
  kpse_set_program_name(av[0], av[0]);
  @<Parse arguments@>;
  @<Setup the default main command, if needed@>;
  h = mp_makempx (mode, cmd, kpse_var_value("MPTEXPRE"), mpname, mpxname, debug);
  if (mpname!=NULL) free(mpname);
  if (mpxname!=NULL) free(mpxname);
  if (cmd!=NULL) free(cmd);
  return h;
}

@ Here is a the default command to run, if it not specified on the commandline.

@d default_args " --parse-first-line --interaction=nonstopmode"
@d TEX     "tex"
@d TROFF   "soelim | eqn -Tps -d$$ | troff -Tps"

@<Setup the default main command, if needed@>=
{
  if (cmd == NULL) {
    char *s = NULL;
    if (mode == mpx_tex_mode) {
      s = kpse_var_value("TEX");
      if (!s) s = kpse_var_value("MPXMAINCMD");
      if (!s) s = xstrdup (TEX);
      cmd = (char *)xmalloc (strlen(s)+strlen(default_args)+1);
      strcpy(cmd,s);
      strcat(cmd,default_args);
      free(s);
    } else {
      s = kpse_var_value("TROFF");
      if (!s) s = kpse_var_value("MPXMAINCMD");
      if (!s) s = xstrdup (TROFF);
      cmd = s;
    }
  }
}

@ 
@d ARGUMENT_IS(a) (!strncmp((av[curarg]+i),(a),strlen((a))))

@<Parse arguments@>=
{
  int i;
  int curarg = 0;
  while (curarg < (ac - 1)) {
	curarg++;
    i=0;
    if (ARGUMENT_IS("--"))
      i++;
    if (ARGUMENT_IS("-debug")) {
      debug = 1;
    } else if (ARGUMENT_IS("-troff") || ARGUMENT_IS("-tex")) {
      if (ARGUMENT_IS("-tex")) {
        mode = mpx_tex_mode;
        i+=4;
      } else {
        mode = mpx_troff_mode;
        i+=6;
      }
	  if (ARGUMENT_IS("=")) {
	 	i++;
		if (*(av[curarg] + i) == '\'' || *(av[curarg] + i) == '\"') {
          cmd = xstrdup(av[curarg]+i+1);
		  *(cmd + strlen(cmd)) = 0; /* remove last quote */
		} else {
          cmd = xstrdup(av[curarg]+i);
		}
	  }
    } else if (mpname == NULL) {
      mpname = xstrdup(av[curarg]);
	} else if (mpxname == NULL) {
      mpxname = xstrdup(av[curarg]);
    }
  }
  if (mpname == NULL) {
	fprintf(stderr, "makempx: Need one or two file arguments.\n");
  }
  if (mpxname == NULL) {
    mpxname = xmalloc(strlen(mpname)+2);
    strcpy(mpxname,mpname);
    strcat(mpxname,"x");
  }
}
