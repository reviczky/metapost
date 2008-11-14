% $Id: svgout.w 657 2008-10-08 09:48:49Z taco $
%
% Copyright 2008 Taco Hoekwater.
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
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
\mathchardef\vbv="026A % synonym for `\|'
\def\vb{\relax\ifmmode\vbv\else$\vbv$\fi}
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
@d null 0
@d unity   0200000 /* $2^{16}$, represents 1.00000 */
@d el_gordo   017777777777 /* $2^{31}-1$, the largest value that \MP\ likes */
@d incr(A)   (A)=(A)+1 /* increase a variable by unity */
@d decr(A)   (A)=(A)-1 /* decrease a variable by unity */
@d negate(A)   (A)=-(A) /* change the sign of a variable */
@d odd(A)   ((A)%2==1)
@d half(A) ((A)/2)
@d print_err(A) mp_print_err(mp,(A))
@d max_quarterword 0x3FFF /* largest allowable value in a |quarterword| */

@c
#include "config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <assert.h>
#include "avl.h"
#include "mplib.h"
#include "mplibps.h" /* external header */
#include "mpmp.h" /* internal header */
#include "mppsout.h" /* internal header */
#include "mpsvgout.h" /* internal header */
@h
@<Declarations@>

@ There is a small bit of code from the backend that bleads through
to the frontend because I do not know how to set up the includes
properly. Those are the definitions of |struct libavl_allocator|
and |typedef struct svgout_data_struct * svgout_data|.

The |libavl_allocator| is a trick that makes sure that frontends 
do not need |avl.h|, and the |psout_data| is needed for the backend 
data structure.

@ @(mpsvgout.h@>=
typedef struct svgout_data_struct {
  @<Globals@>
} svgout_data_struct ;
@<Exported function headers@>

@ @c
static boolean mp_isdigit (int a) {
  return (a>='0'&&a<='9');
}
static int mp_tolower (int a) {
  if (a>='A' && a <='Z') 
    return a - 'A' + 'a';
  return a;
}
static int mp_strcasecmp (const char *s1, const char *s2) {
  int r;
  char *ss1, *ss2, *c;
  ss1 = mp_strdup(s1); 
  c = ss1;
  while (*c != '\0') {
    *c = mp_tolower(*c); c++;
  }
  ss2 = mp_strdup(s2);
  c = ss2;
  while (*c != '\0') {
    *c = mp_tolower(*c); c++;
  }
  r = strcmp(ss1,ss2);
  free (ss1); free(ss2);
  return r;
}

@ @<Exported function headers@>=
void mp_svg_backend_initialize (MP mp) ;
void mp_svg_backend_free (MP mp) ;

@
@c void mp_svg_backend_initialize (MP mp) {
  mp->svg = mp_xmalloc(mp,1,sizeof(svgout_data_struct));
  @<Set initial values@>;
}
void mp_svg_backend_free (MP mp) {
  @<Dealloc variables@>;
  mp_xfree(mp->svg);
  mp->svg = NULL;
}

@ Writing to ps files

@<Globals@>=
integer file_offset;
  /* the number of characters on the current \ps\ file line */

@ @<Set initial values@>=
mp->svg->file_offset = 0;

@

@d wps(A)     (mp->write_ascii_file)(mp,mp->output_file,(A))
@d wps_chr(A) do { 
  char ss[2]; 
  ss[0]=(A); ss[1]=0; 
  (mp->write_ascii_file)(mp,mp->output_file,(char *)ss); 
} while (0)
@d wps_cr     (mp->write_ascii_file)(mp,mp->output_file,"\n")
@d wps_ln(A)  { wterm_cr; (mp->write_ascii_file)(mp,mp->output_file,(A)); }

@c
static void mp_svg_print_ln (MP mp) { /* prints an end-of-line */
  wps_cr; 
  mp->svg->file_offset=0;
} 

@ @c
static void mp_svg_print_char (MP mp, int s) { /* prints a single character */
  if ( s==13 ) {
    wps_cr; mp->svg->file_offset=0;
  } else {
    wps_chr(s); incr(mp->svg->file_offset);
  }
}

@ @c
static void mp_svg_do_print (MP mp, const char *ss, size_t len) { /* prints string |s| */
  size_t j = 0;
  while ( j<len ){ 
    mp_svg_print_char(mp, ss[j]); incr(j);
  }
}

@ Deciding where to break the ps output line. 

@d ps_room(A) if ( (mp->svg->file_offset+(int)(A))>mp->max_print_line ) {
  mp_svg_print_ln(mp); /* optional line break */
}

@c
static void mp_svg_print (MP mp, const char *ss) {
  ps_room(strlen(ss));
  mp_svg_do_print(mp, ss, strlen(ss));
}

@ The procedure |print_nl| is like |print|, but it makes sure that the
string appears at the beginning of a new line.

@c
static void mp_svg_print_nl (MP mp, const char *s) { /* prints string |s| at beginning of line */
  if ( mp->svg->file_offset>0 ) mp_svg_print_ln(mp);
  mp_svg_print(mp, s);
}

@ An array of digits in the range |0..9| is printed by |print_the_digs|.

@c
static void mp_svg_print_the_digs (MP mp, int k) {
  /* prints |dig[k-1]|$\,\ldots\,$|dig[0]| */
  while ( k-->0 ){ 
    mp_svg_print_char(mp, '0'+mp->dig[k]);
  }
}

@ The following procedure, which prints out the decimal representation of a
given integer |n|, has been written carefully so that it works properly
if |n=0| or if |(-n)| would cause overflow. It does not apply |mod| or |div|
to negative arguments, since such operations are not implemented consistently
by all \PASCAL\ compilers.

@c
static void mp_svg_print_int (MP mp,integer n) { /* prints an integer in decimal form */
  integer m; /* used to negate |n| in possibly dangerous cases */
  int k = 0; /* index to current digit; we assume that $|n|<10^{23}$ */
  if ( n<0 ) { 
    mp_svg_print_char(mp, '-');
    if ( n>-100000000 ) {
	  negate(n);
    } else  { 
	  m=-1-n; n=m / 10; m=(m % 10)+1; k=1;
      if ( m<10 ) {
        mp->dig[0]=(unsigned char)m;
      } else { 
        mp->dig[0]=0; incr(n);
      }
    }
  }
  do {  
    mp->dig[k]=(unsigned char)(n % 10); n=n / 10; incr(k);
  } while (n!=0);
  mp_svg_print_the_digs(mp, k);
}

@ \MP\ also makes use of a trivial procedure to print two digits. The
following subroutine is usually called with a parameter in the range |0<=n<=99|.

@c 
static void mp_svg_print_dd (MP mp,integer n) { /* prints two least significant digits */
  n=abs(n) % 100; 
  mp_svg_print_char(mp, '0'+(n / 10));
  mp_svg_print_char(mp, '0'+(n % 10));
}

@ Conversely, here is a procedure analogous to |print_int|. If the output
of this procedure is subsequently read by \MP\ and converted by the
|round_decimals| routine above, it turns out that the original value will
be reproduced exactly. A decimal point is printed only if the value is
not an integer. If there is more than one way to print the result with
the optimum number of digits following the decimal point, the closest
possible value is given.

The invariant relation in the \&{repeat} loop is that a sequence of
decimal digits yet to be printed will yield the original number if and only if
they form a fraction~$f$ in the range $s-\delta\L10\cdot2^{16}f<s$.
We can stop if and only if $f=0$ satisfies this condition; the loop will
terminate before $s$ can possibly become zero.

@c
static void mp_svg_print_scaled (MP mp,scaled s) { 
  scaled delta; /* amount of allowable inaccuracy */
  ps_room(16); 
  if ( s<0 ) { 
	mp_svg_print_char(mp, '-'); 
    negate(s); /* print the sign, if negative */
  }
  mp_svg_print_int(mp, s / unity); /* print the integer part */
  s=10*(s % unity)+5;
  if ( s!=5 ) { 
    delta=10; 
    mp_svg_print_char(mp, '.');
    do {  
      if ( delta>unity )
        s=s+0100000-(delta / 2); /* round the final digit */
      mp_svg_print_char(mp, '0'+(s / unity)); 
      s=10*(s % unity); 
      delta=delta*10;
    } while (s>delta);
  }
}


@* Fonts.

@ @c
static void mp_hex_digit_out (MP mp,quarterword d) { 
  if ( d<10 ) mp_svg_print_char(mp, d+'0');
  else mp_svg_print_char(mp, d+'a'-10);
}


@ This is just a hack

@<Character |k| is not allowed in SVG output@>=
  (k<=' ')||(k>'~')

@ We often need to print a pair of coordinates.

@c
void mp_svg_pair_out (MP mp,scaled x, scaled y) { 
  ps_room(26);
  mp_svg_print_scaled(mp, x); mp_svg_print_char(mp, ' ');
  mp_svg_print_scaled(mp, y); mp_svg_print_char(mp, ' ');
}

@ @<Declarations@>=
static void mp_svg_pair_out (MP mp,scaled x, scaled y) ;

@ @c
void mp_svg_text_out (MP mp, mp_text_object *p) {
  char *s, *fname;
  ASCII_code k; /* bits to be converted to octal */
  boolean transformed ;
  scaled ds; /* design size and scale factor for a text node */
  fname = mp->font_ps_name[gr_font_n(p)];
  s = gr_text_p(p);
  transformed=(gr_txx_val(p)!=unity)||(gr_tyy_val(p)!=unity)||
              (gr_txy_val(p)!=0)||(gr_tyx_val(p)!=0);
  mp_svg_print(mp, "<g transform=\"");
  if ( transformed ) {
    mp_svg_print(mp, "matrix(");
    mp_svg_print_scaled(mp,gr_txx_val(p));
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,gr_tyx_val(p));
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,gr_txy_val(p));
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,-gr_tyy_val(p)); /* negate for PS<->SVG */
    mp_svg_print(mp,",");
  } else { 
    mp_svg_print(mp, "translate(");
  }
  mp_svg_print_scaled(mp,gr_tx_val(p));
  mp_svg_print(mp,",");
  mp_svg_print_scaled(mp,gr_ty_val(p));
  mp_svg_print(mp, ")\">");
  mp_svg_print_nl(mp, "<text x=\"0");
  mp_svg_print(mp, "\" y=\"0");
  mp_svg_print(mp, "\" font-size=\"");
  ds=(mp->font_dsize[gr_font_n(p)]+8) / 16;
  mp_svg_print_scaled(mp,ds);

  mp_svg_print(mp, "\" style=\"");
  mp_svg_print(mp, "fill: ");
  mp_svg_color_out(mp,(mp_graphic_object *)p);
  mp_svg_print(mp, "; ");
  mp_svg_print(mp, "\" font-family=\"");
  mp_svg_print(mp, fname);
  mp_svg_print(mp, "\">");

  while ((k=(ASCII_code)*s++)) {
    if ( mp->svg->file_offset+5>mp->max_print_line ) {
      mp_svg_print(mp, "<!--");
      mp_svg_print_nl(mp,"-->");
    }
    if ( (@<Character |k| is not allowed in SVG output@>) ) {
      mp_svg_print(mp, "&#");
      mp_svg_print_int(mp,k);
      mp_svg_print(mp, ";");
    } else if (k=='&') {
      mp_svg_print(mp, "&amp;");
    } else if (k=='<') {
      mp_svg_print(mp, "&lt;");
    } else if (k=='>') {
      mp_svg_print(mp, "&gt;");
    } else {
      mp_svg_print_char(mp, k);
    }
  }

  mp_svg_print(mp, "</text></g>");
  mp_svg_print_ln(mp);
}

@ @<Declarations@>=
static void mp_svg_text_out (MP mp, mp_text_object *p) ;

@ 

@<Declarations@>=
static void mp_svg_print_initial_comment(MP mp,mp_edge_object *hh);

@ @c
void mp_svg_print_initial_comment(MP mp,mp_edge_object *hh) {
  scaled t, tx, ty;
  char *s;   
  mp_svg_print(mp, "<?xml version=\"1.0\"?>");
  mp_svg_print_nl(mp, "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\"");
  mp_svg_print_nl(mp, "     width=\"");
  if ( hh->minx>hh->maxx)  { 
    tx = 0;
    mp_svg_print(mp, "0pt"); 
  } else {
    tx = abs(hh->minx) + abs(hh->maxx);
    mp_svg_print_scaled(mp, tx);
  }
  mp_svg_print(mp, "\"");
  mp_svg_print(mp," height=\"");
  if ( hh->minx>hh->maxx)  { 
    ty = 0;
    mp_svg_print(mp, "0pt"); 
  } else {
    ty = abs(hh->miny) + abs(hh->maxy);
    mp_svg_print_scaled(mp, ty);
  }
  mp_svg_print(mp, "\"");
  if ( hh->minx<=hh->maxx)  { 
      mp_svg_print(mp," viewBox=\"");
      mp_svg_pair_out(mp,hh->minx, hh->miny);
      mp_svg_pair_out(mp,tx, ty);
      mp_svg_print(mp, "\"");
  }
  mp_svg_print(mp, ">");
  mp_svg_print(mp, "<g transform=\"translate (0,0");
  /* mp_svg_print_scaled(mp, ty); */
  mp_svg_print(mp,  ") scale(1,-1)\">");

  mp_svg_print_nl(mp, "<!-- %%Creator: MetaPost ");
  s = mp_metapost_version();
  mp_svg_print(mp, s);
  mp_xfree(s);
  mp_svg_print_nl(mp, "%%CreationDate: ");
  mp_svg_print_int(mp, mp_round_unscaled(mp, mp->internal[mp_year])); 
  mp_svg_print_char(mp, '.');
  mp_svg_print_dd(mp, mp_round_unscaled(mp, mp->internal[mp_month])); 
  mp_svg_print_char(mp, '.');
  mp_svg_print_dd(mp, mp_round_unscaled(mp, mp->internal[mp_day])); 
  mp_svg_print_char(mp, ':');
  t=mp_round_unscaled(mp, mp->internal[mp_time]);
  mp_svg_print_dd(mp, t / 60); 
  mp_svg_print_dd(mp, t % 60);
  mp_svg_print_nl(mp, "-->");
}

@ If we want to duplicate a knot node, we can say |copy_knot|:

@c 
static mp_knot *mp_gr_copy_knot (MP mp,  mp_knot *p) {
  mp_knot *q; /* the copy */
  q = mp_xmalloc(mp, 1, sizeof (mp_knot));
  memcpy(q,p,sizeof (mp_knot));
  gr_next_knot(q)=NULL;
  return q;
}

@ The |copy_path| routine makes a clone of a given path.

@c 
static mp_knot *mp_gr_copy_path (MP mp,  mp_knot *p) {
  mp_knot *q, *pp, *qq; /* for list manipulation */
  if (p==NULL) 
    return NULL;
  q=mp_gr_copy_knot(mp, p);
  qq=q; 
  pp=gr_next_knot(p);
  while ( pp!=p ) { 
    gr_next_knot(qq)=mp_gr_copy_knot(mp, pp);
    qq=gr_next_knot(qq);
    pp=gr_next_knot(pp);
  }
  gr_next_knot(qq)=q;
  return q;
}

@ When a cyclic list of knot nodes is no longer needed, it can be recycled by
calling the following subroutine.

@<Declarations@>=
static void mp_do_gr_toss_knot_list (mp_knot *p) ;

@ 
@d mp_gr_toss_knot_list(B,A) mp_do_gr_toss_knot_list(A)

@c
void mp_do_gr_toss_knot_list (mp_knot * p) {
  mp_knot *q; /* the node being freed */
  mp_knot *r; /* the next node */
  if (p==NULL)
    return;
  q=p;
  do {  
    r=gr_next_knot(q); 
    mp_xfree(q); q=r;
  } while (q!=p);
}

@ 
@d gr_has_color(A) (gr_type((A))<mp_start_clip_code)

@d set_color_objects(pq)
  object_color_model = pq->color_model;
  object_color_a = pq->color.a_val;
  object_color_b = pq->color.b_val;
  object_color_c = pq->color.c_val;
  object_color_d = pq->color.d_val; 

@c
static char *mp_svg_color_out (MP mp, mp_graphic_object *p) {
  int object_color_model;
  int object_color_a, object_color_b, object_color_c, object_color_d ; 
  if (gr_type(p) == mp_fill_code) {
    mp_fill_object *pq = (mp_fill_object *)p;
    set_color_objects(pq);
  } else if (gr_type(p) == mp_stroked_code) {
    mp_stroked_object *pq = (mp_stroked_object *)p;
    set_color_objects(pq);
  } else {
    mp_text_object *pq = (mp_text_object *)p;
    set_color_objects(pq);
  }
  if ( object_color_model==mp_rgb_model) {
    mp_svg_print(mp,"rgb(");
    mp_svg_print_scaled(mp, (object_color_a * 100));
    mp_svg_print(mp,"%,");
    mp_svg_print_scaled(mp, (object_color_b * 100));
    mp_svg_print(mp,"%,");
    mp_svg_print_scaled(mp, (object_color_c * 100));
    mp_svg_print(mp,"%)");
  } else if ( object_color_model==mp_cmyk_model) {
    /* hm ... todo */
  } else if ( object_color_model==mp_grey_model ) {
    mp_svg_print(mp,"rgb(");
    mp_svg_print_scaled(mp, (object_color_a * 100));
    mp_svg_print(mp,"%,");
    mp_svg_print_scaled(mp, (object_color_a * 100));
    mp_svg_print(mp,"%,");
    mp_svg_print_scaled(mp, (object_color_a * 100));
    mp_svg_print(mp,"%)");
  } else if ( object_color_model==mp_no_model ) {
    mp_svg_print(mp,"black");
  }
}

@ @<Declarations@>=
static char *mp_svg_color_out (MP mp, mp_graphic_object *p);



@ @c
static void mp_svg_path_out (MP mp, mp_knot *h) {
  mp_knot *p, *q; /* for scanning the path */
  scaled d; /* a temporary value */
  boolean curved; /* |true| unless the cubic is almost straight */
  ps_room(40);
  mp_svg_print(mp, " d=\"M ");
  mp_svg_pair_out(mp, gr_x_coord(h),gr_y_coord(h));
  mp_svg_print(mp, " ");
  p=h;
  do {  
    if ( gr_right_type(p)==mp_endpoint ) { 
      if ( p==h ) mp_svg_print(mp, " l 0 0 ");
      mp_svg_print(mp, "\"");
      return;
    }
    q=gr_next_knot(p);
    @<Start a new line and print the \ps\ commands for the curve from
      |p| to~|q|@>;
    p=q;
  } while (p!=h);
  mp_svg_print(mp, "\"");
}

@ @<Start a new line and print the \ps\ commands for the curve from...@>=
curved=true;
@<Set |curved:=false| if the cubic from |p| to |q| is almost straight@>;
mp_svg_print_ln(mp);
if ( curved ){ 
  mp_svg_print(mp, "C ");
  mp_svg_pair_out(mp, gr_right_x(p),gr_right_y(p));
  mp_svg_print(mp, ", ");
  mp_svg_pair_out(mp, gr_left_x(q),gr_left_y(q));
  mp_svg_print(mp, ", ");
  mp_svg_pair_out(mp, gr_x_coord(q),gr_y_coord(q));
  mp_svg_print(mp, " ");
} else if ( q!=h ){ 
  mp_svg_print(mp, "L ");
  mp_svg_pair_out(mp, gr_x_coord(q),gr_y_coord(q));
  mp_svg_print(mp, " ");
}

@ Two types of straight lines come up often in \MP\ paths:
cubics with zero initial and final velocity as created by |make_path| or
|make_envelope|, and cubics with control points uniformly spaced on a line
as created by |make_choices|.

@d bend_tolerance 131 /* allow rounding error of $2\cdot10^{-3}$ */

@<Set |curved:=false| if the cubic from |p| to |q| is almost straight@>=
if ( gr_right_x(p)==gr_x_coord(p) )
  if ( gr_right_y(p)==gr_y_coord(p) )
    if ( gr_left_x(q)==gr_x_coord(q) )
      if ( gr_left_y(q)==gr_y_coord(q) ) curved=false;
d=gr_left_x(q)-gr_right_x(p);
if ( abs(gr_right_x(p)-gr_x_coord(p)-d)<=bend_tolerance )
  if ( abs(gr_x_coord(q)-gr_left_x(q)-d)<=bend_tolerance )
    { d=gr_left_y(q)-gr_right_y(p);
    if ( abs(gr_right_y(p)-gr_y_coord(p)-d)<=bend_tolerance )
      if ( abs(gr_y_coord(q)-gr_left_y(q)-d)<=bend_tolerance ) curved=false;
    }


@ 
@d mp_gr_toss_dashes(A,B) mp_do_gr_toss_dashes(B) 

@<Declarations@>=
static void mp_do_gr_toss_dashes(mp_dash_object *dl);

@ @c
void mp_do_gr_toss_dashes(mp_dash_object *dl) {
  if (dl==NULL)   
    return;
  mp_xfree(dl->array);  
  mp_xfree(dl);
}


@ @c
static mp_dash_object *mp_gr_copy_dashes(MP mp, mp_dash_object *dl) {
	mp_dash_object *q = NULL;
    (void)mp;
	if (dl==NULL)
      return NULL;
	q = mp_xmalloc(mp, 1, sizeof (mp_dash_object));
	memcpy (q,dl,sizeof(mp_dash_object));
	if (dl->array != NULL) {
  	  size_t i = 0;
      while (*(dl->array+i) != -1) i++;
   	  q->array = mp_xmalloc(mp, i, sizeof (scaled));
	  memcpy(q->array,dl->array, (i*sizeof(scaled)));
    }
	return q;
}


@ Now for outputting the actual graphic objects. First, set up some 
structures and access macros.

@d gr_has_color(A) (gr_type((A))<mp_start_clip_code)

@ We need to keep track of several parameters from the \ps\ graphics state.
@^graphics state@>
This allows us to be sure that \ps\ has the correct values when they are
needed without wasting time and space setting them unnecessarily.

@d gs_red        mp->svg->gs_state->red_field         
@d gs_green      mp->svg->gs_state->green_field	     
@d gs_blue       mp->svg->gs_state->blue_field	     
@d gs_black      mp->svg->gs_state->black_field	     
@d gs_colormodel mp->svg->gs_state->colormodel_field
@d gs_ljoin      mp->svg->gs_state->ljoin_field	     
@d gs_lcap       mp->svg->gs_state->lcap_field	     
@d gs_adj_wx     mp->svg->gs_state->adj_wx_field	     
@d gs_miterlim   mp->svg->gs_state->miterlim_field    
@d gs_dash_p     mp->svg->gs_state->dash_p_field	     
@d gs_dash_init_done mp->svg->gs_state->dash_done_field
@d gs_previous   mp->svg->gs_state->previous_field    
@d gs_width      mp->svg->gs_state->width_field	     

   
@ @<Glob...@>=
struct _gs_state * gs_state;

@ @<Set init...@>=
mp->svg->gs_state=NULL;

@ @<Dealloc variables@>=
mp_xfree(mp->svg->gs_state);


@ When stroking a path with an elliptical pen, it is necessary to transform
the coordinate system so that a unit circular pen will have the desired shape.
To keep this transformation local, we enclose it in a
$$\&{gsave}\ldots\&{grestore}$$
block. Any translation component must be applied to the path being stroked
while the rest of the transformation must apply only to the pen.
If |fill_also=true|, the path is to be filled as well as stroked so we must
insert commands to do this after giving the path.

@<Declarations@>=
static void mp_svg_stroke_out (MP mp,  mp_graphic_object *h, boolean fill_also) ;

@ 
@c void mp_svg_stroke_out (MP mp,  mp_graphic_object *h, boolean fill_also) {
  /* generate an elliptical pen stroke from object |h| */
  mp_svg_print_nl(mp, "<path");
  if (gr_type(h)==mp_fill_code) {
    mp_svg_path_out(mp, gr_path_p((mp_fill_object *)h));
    mp_svg_print(mp, " style=\"");
    mp_svg_print(mp, "fill: ");
    mp_svg_color_out(mp,h);
    mp_svg_print(mp, "; ");
    mp_svg_print(mp, "stroke: none;");
    mp_svg_print(mp, "\"");
  } else {
    mp_svg_path_out(mp, gr_path_p((mp_stroked_object *)h));
    mp_svg_print(mp, " style=\"");

    mp_svg_print(mp, "stroke: ");
    mp_svg_color_out(mp,h);
    mp_svg_print(mp, ";");

    {
      /* TODO, this is just a quick approximation */
      mp_knot *p; /* the pen to stroke with */
      if (gr_type(h)==mp_fill_code) {
        p=gr_pen_p((mp_fill_object *)h);
      } else {
        p=gr_pen_p((mp_stroked_object *)h);
      }
      mp_svg_print(mp, "stroke-width: ");
      if (p != NULL) {
        mp_svg_print_scaled(mp, (abs(gr_left_x(p) - gr_x_coord(p))));
      } else {
        mp_svg_print(mp, "0");
      }
      mp_svg_print(mp, ";");
    }

    {
      mp_dash_object *hh;
      hh =gr_dash_p(h);
      if (hh != NULL && hh->array != NULL) {
         int i;
         ps_room(28);
         mp_svg_print(mp, "stroke-dasharray: ");
         for (i=0; *(hh->array+i) != -1;i++) {
           ps_room(13);
           mp_svg_print_scaled(mp, *(hh->array+i)); 
           mp_svg_print_char(mp, ' ')	;
         }
         /* svg doesn't accept offsets */
         mp_svg_print(mp, ";");
      }
    }

    if (gr_lcap_val(h)!=0) {
      mp_svg_print(mp, "stroke-linecap: ");
      switch (gr_lcap_val(h)) {
        case 1: mp_svg_print(mp, "round"); break;
        case 2: mp_svg_print(mp, "square"); break;
        default: mp_svg_print(mp, "butt"); break;
      }
      mp_svg_print(mp, ";");
    }
    if (gr_ljoin_val((mp_stroked_object *)h)!=0) {
      mp_svg_print(mp, "stroke-linejoin: ");
      switch (gr_ljoin_val((mp_stroked_object *)h)) {
        case 1: mp_svg_print(mp, "round"); break;
        case 2: mp_svg_print(mp, "bevel"); break;
        default: mp_svg_print(mp, "miter"); break;
      }
      mp_svg_print(mp, ";");
    }
  
    if (gr_miterlim_val((mp_stroked_object *)h) != 4*unity) {
      mp_svg_print(mp, "stroke-miterlimit: ");
      mp_svg_print_scaled(mp, gr_miterlim_val((mp_stroked_object *)h)); 
      mp_svg_print(mp, ";");
    }

    mp_svg_print(mp, "fill: ");
    if (fill_also) {
      mp_svg_color_out(mp,h);
    } else {
      mp_svg_print(mp, " none");
    }
    mp_svg_print(mp, ";");
    mp_svg_print(mp, "\"");
  }
  mp_svg_print(mp, "/>");
  mp_svg_print_ln(mp);
}

@ @<Use |pen_p(h)| to set the transformation parameters and give the...@>=
if (gr_type(h)==mp_fill_code) {
  p=gr_pen_p((mp_fill_object *)h);
} else {
  p=gr_pen_p((mp_stroked_object *)h);
}
txx=gr_left_x(p);
tyx=gr_left_y(p);
txy=gr_right_x(p);
tyy=gr_right_y(p);
if ( (gr_x_coord(p)!=0)||(gr_y_coord(p)!=0) ) {
  mp_svg_print_nl(mp, ""); 
  mp_svg_print_cmd(mp, "gsave ","q ");
  mp_svg_pair_out(mp, gr_x_coord(p), gr_y_coord(p));
  mp_svg_print(mp, "translate ");
  txx-=gr_x_coord(p);
  tyx-=gr_y_coord(p);
  txy-=gr_x_coord(p);
  tyy-=gr_y_coord(p);
  transformed=true;
} else {
  mp_svg_print_nl(mp, "");
}
@<Adjust the transformation to account for |gs_width| and output the
  initial \&{gsave} if |transformed| should be |true|@>

@ @<Adjust the transformation to account for |gs_width| and output the...@>=
if ( gs_width!=unity ) {
  if ( gs_width==0 ) { 
    txx=unity; tyy=unity;
  } else { 
    txx=mp_make_scaled(mp, txx,gs_width);
    txy=mp_make_scaled(mp, txy,gs_width);
    tyx=mp_make_scaled(mp, tyx,gs_width);
    tyy=mp_make_scaled(mp, tyy,gs_width);
  };
}

@ @<Issue \ps\ commands to transform the coordinate system@>=
if ( (txy!=0)||(tyx!=0) ){ 
  mp_svg_print_ln(mp);
  mp_svg_print_char(mp, '[');
  mp_svg_pair_out(mp, txx,tyx);
  mp_svg_pair_out(mp, txy,tyy);
  mp_svg_print(mp, "0 0] concat");
} else if ( (txx!=unity)||(tyy!=unity) ){ 
  mp_svg_print_ln(mp);
  mp_svg_pair_out(mp, txx,tyy);
  mp_svg_print(mp, "scale");
}

@ The \ps\ interpreter will probably abort if it encounters a singular
transformation matrix.  The determinant must be large enough to ensure that
the printed representation will be nonsingular.  Since the printed
representation is always within $2^{-17}$ of the internal |scaled| value, the
total error is at most $4T_{\rm max}2^{-17}$, where $T_{\rm max}$ is a bound on
the magnitudes of |txx/65536|, |txy/65536|, etc.

The |aspect_bound*(gs_width+1)| bound on the components of the pen
transformation allows $T_{\rm max}$ to be at most |2*aspect_bound|.

@<Tweak the transformation parameters so the transformation is nonsingular@>=
det=mp_take_scaled(mp, txx,tyy) - mp_take_scaled(mp, txy,tyx);
d1=4*aspect_bound+1;
if ( abs(det)<d1 ) { 
  if ( det>=0 ) { d1=d1-det; s=1;  }
  else { d1=-d1-det; s=-1;  };
  d1=d1*unity;
  if ( abs(txx)+abs(tyy)>=abs(txy)+abs(tyy) ) {
    if ( abs(txx)>abs(tyy) ) tyy=tyy+(d1+s*abs(txx)) / txx;
    else txx=txx+(d1+s*abs(tyy)) / tyy;
  } else {
    if ( abs(txy)>abs(tyx) ) tyx=tyx+(d1+s*abs(txy)) / txy;
    else txy=txy+(d1+s*abs(tyx)) / tyx;
  }
}

@ Here is a simple routine that just fills a cycle.

@<Declarations@>=
static void mp_svg_fill_out (MP mp, mp_knot *p, mp_graphic_object *h);

@ @c
void mp_svg_fill_out (MP mp, mp_knot *p, mp_graphic_object *h) {
  mp_svg_print_nl(mp, "<path");
  mp_svg_path_out(mp, p);
  mp_svg_print(mp, " style=\"");
  mp_svg_print(mp, "fill: ");
  mp_svg_color_out(mp,h);
  mp_svg_print(mp, "; ");
  mp_svg_print(mp, "stroke: none;");
  mp_svg_print(mp, "\"/>");
  mp_svg_print_ln(mp);
}

@ A text node may specify an arbitrary transformation but the usual case
involves only shifting, scaling, and occasionally rotation.  The purpose
of |choose_scale| is to select a scale factor so that the remaining
transformation is as ``nice'' as possible.  The definition of ``nice''
is somewhat arbitrary but shifting and $90^\circ$ rotation are especially
nice because they work out well for bitmap fonts.  The code here selects
a scale factor equal to $1/\sqrt2$ times the Frobenius norm of the
non-shifting part of the transformation matrix.  It is careful to avoid
additions that might cause undetected overflow.


@ @c static scaled mp_choose_scale (MP mp, mp_graphic_object *p) {
  /* |p| should point to a text node */
  scaled a,b,c,d,ad,bc; /* temporary values */
  a=gr_txx_val(p);
  b=gr_txy_val(p);
  c=gr_tyx_val(p);
  d=gr_tyy_val(p);
  if ( (a<0) ) negate(a);
  if ( (b<0) ) negate(b);
  if ( (c<0) ) negate(c);
  if ( (d<0) ) negate(d);
  ad=half(a-d);
  bc=half(b-c);
  return mp_pyth_add(mp, mp_pyth_add(mp, d+ad,ad), mp_pyth_add(mp, c+bc,bc));
}

@ 
@d pen_is_elliptical(A) ((A)==gr_next_knot((A)))

@<Exported function ...@>=
int mp_svg_gr_ship_out (mp_edge_object *hh, int prologues, int procset, int standalone) ;

@ @c 
int mp_svg_gr_ship_out (mp_edge_object *hh, int qprologues, int qprocset,int standalone) {
  mp_graphic_object *p;
  scaled ds,scf; /* design size and scale factor for a text node */
  font_number f; /* for loops over fonts while (un)marking characters */
  boolean transformed; /* is the coordinate system being transformed? */
  MP mp = hh->parent;
  if (standalone) {
     mp->jump_buf = malloc(sizeof(jmp_buf));
     if (mp->jump_buf == NULL || setjmp(*(mp->jump_buf)))
       return 0;
  }
  if (mp->history >= mp_fatal_error_stop ) return 1;
  mp_open_output_file(mp);
  if ( (qprologues>=1) && (mp->last_ps_fnum<mp->last_fnum) )
    mp_read_psname_table(mp);
  mp_svg_print_initial_comment(mp, hh);
  p = hh->body;
  while ( p!=NULL ) { 
    if ( gr_has_color(p) ) {
      @<Write |pre_script| of |p|@>;
    }
    switch (gr_type(p)) {
    case mp_fill_code: 
      if ( gr_pen_p((mp_fill_object *)p)==NULL ) {
        mp_svg_fill_out(mp, gr_path_p((mp_fill_object *)p), p);
      } else if ( pen_is_elliptical(gr_pen_p((mp_fill_object *)p)) )  {
        mp_svg_stroke_out(mp, p,true);
      } else { 
        mp_svg_fill_out(mp, gr_path_p((mp_fill_object *)p), p);
        mp_svg_fill_out(mp, gr_htap_p(p), p);
      }
      if ( gr_post_script((mp_fill_object *)p)!=NULL ) {
         mp_svg_print_nl (mp, gr_post_script((mp_fill_object *)p)); 
	     mp_svg_print_ln(mp);
      }
      break;
    case mp_stroked_code:
      if ( pen_is_elliptical(gr_pen_p((mp_stroked_object *)p)) ) 
	    mp_svg_stroke_out(mp, p,false);
      else { 
        mp_svg_fill_out(mp, gr_path_p((mp_stroked_object *)p), p);
      }
      if ( gr_post_script((mp_stroked_object *)p)!=NULL ) {
        mp_svg_print_nl (mp, gr_post_script((mp_stroked_object *)p)); 
        mp_svg_print_ln(mp);
      }
      break;
    case mp_text_code: 
      if ( (gr_font_n(p)!=null_font) && (strlen(gr_text_p(p))>0) ) {
        mp_svg_text_out(mp, (mp_text_object *)p);
        mp_svg_print_ln(mp);
      }
      if ( gr_post_script((mp_text_object *)p)!=NULL ) {
        mp_svg_print_nl (mp, gr_post_script((mp_text_object *)p)); mp_svg_print_ln(mp);
      }
      break;
    case mp_start_clip_code: 
      mp_svg_print_nl(mp, "<g><defs>");
      mp_svg_print_nl(mp, "<clipPath id=\"XX\">");
      mp_svg_print_nl(mp, "<path ");
      mp_svg_path_out(mp, gr_path_p((mp_clip_object *)p));
      mp_svg_print(mp, " style=\"fill:black; stroke:none;\"/>");
      mp_svg_print_nl(mp, "</clipPath></defs>");
      mp_svg_print_nl(mp, "<g clip-path=\"url(#XX);\">");
      mp_svg_print_ln(mp);
      break;
    case mp_stop_clip_code: 
      mp_svg_print_nl(mp, "</g></g>"); 
      mp_svg_print_ln(mp);
      break;
    case mp_start_bounds_code:
    case mp_stop_bounds_code:
	  break;
    case mp_special_code:  
      {
        mp_special_object *ps = (mp_special_object *)p;
        mp_svg_print_nl (mp, gr_pre_script(ps)); 
 	    mp_svg_print_ln (mp);
      }
      break;
    } /* all cases are enumerated */
    p=gr_link(p);
  }
  mp_svg_print_nl(mp, "</g></svg>"); mp_svg_print_ln(mp);
  (mp->close_file)(mp,mp->output_file);
  return 1;
}

@ @(mplibsvg.h@>=
int mp_svg_ship_out (mp_edge_object *hh, int prologues, int procset) ;

@ @c
int mp_svg_ship_out (mp_edge_object *hh, int prologues, int procset) {
  return mp_svg_gr_ship_out (hh, prologues, procset, (int)true);
}

@ 
@d do_write_prescript(a,b) {
  if ( (gr_pre_script((b *)a))!=NULL ) {
    mp_svg_print_nl (mp, gr_pre_script((b *)a)); 
    mp_svg_print_ln(mp);
  }
}

@<Write |pre_script| of |p|@>=
{
  if (gr_type(p)==mp_fill_code) { do_write_prescript(p,mp_fill_object); }
  else if (gr_type(p)==mp_stroked_code) { do_write_prescript(p,mp_stroked_object); }
  else if (gr_type(p)==mp_text_code) { do_write_prescript(p,mp_text_object); }
}
