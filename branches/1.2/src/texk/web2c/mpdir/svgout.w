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

\font\tenlogo=logo10 % font used for the METAFONT logo
\font\logos=logosl10
\def\MF{{\tenlogo META}\-{\tenlogo FONT}}
\def\MP{{\tenlogo META}\-{\tenlogo POST}}
\def\<#1>{$\langle#1\rangle$}
\def\section{\mathhexbox278}
\def\[#1]{} % from pascal web
\def\(#1){} % this is used to make section names sort themselves better
\def\9#1{} % this is used for sort keys in the index via @@:sort key}{entry@@>

\def\title{MetaPost SVG output}
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
@d incr(A)   (A)=(A)+1 /* increase a variable by unity */
@d decr(A)   (A)=(A)-1 /* decrease a variable by unity */
@d negate(A)   (A)=-(A) /* change the sign of a variable */

@c
#include "config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mplib.h"
#include "mplibps.h" /* external header */
#include "mpmp.h" /* internal header */
#include "mppsout.h" /* internal header */
#include "mpsvgout.h" /* internal header */
@h
@<Types in the outer block@>
@<Declarations@>

@ There is a small bit of code from the backend that bleads through
to the frontend because I do not know how to set up the includes
properly. That is |typedef struct svgout_data_struct * svgout_data|.

@ @(mpsvgout.h@>=
typedef struct svgout_data_struct {
  @<Globals@>
} svgout_data_struct ;
@<Exported function headers@>

@ @<Exported function headers@>=
void mp_svg_backend_initialize (MP mp) ;
void mp_svg_backend_free (MP mp) ;

@ @c 
void mp_svg_backend_initialize (MP mp) {
  mp->svg = mp_xmalloc(mp,1,sizeof(svgout_data_struct));
  @<Set initial values@>;
}
void mp_svg_backend_free (MP mp) {
  mp_xfree(mp->svg);
  mp->svg = NULL;
}

@ Writing to SVG files

@<Globals@>=
integer file_offset;
  /* the number of characters on the current svg file line */

@ @<Set initial values@>=
mp->svg->file_offset = 0;

@ Print a newline.

@c
static void mp_svg_print_ln (MP mp) {
  (mp->write_ascii_file)(mp,mp->output_file,"\n");
  mp->svg->file_offset=0;
} 

@ Print a single character 

@c
static void mp_svg_print_char (MP mp, int s) {
  if ( s==13 ) {
    (mp->write_ascii_file)(mp,mp->output_file,"\n");
    mp->svg->file_offset=0;
  } else {
     char ss[2]; 
     ss[0]=s; ss[1]=0; 
    (mp->write_ascii_file)(mp,mp->output_file,(char *)ss); 
    mp->svg->file_offset ++;
  }
}

@ Print a string

@c
static void mp_svg_print (MP mp, const char *ss) {
  size_t len = strlen(ss);
  size_t j = 0;
  while ( j<len ){ 
    mp_svg_print_char(mp, ss[j]); incr(j);
  }
}

@ The procedure |print_nl| is like |print|, but it makes sure that the
string appears at the beginning of a new line.

@c
static void mp_svg_print_nl (MP mp, const char *s) { 
  if ( mp->svg->file_offset>0 )
    mp_svg_print_ln(mp);
  mp_svg_print(mp, s);
}

@ The following procedure, which prints out the decimal representation of a
given integer |n|, has been written carefully so that it works properly
if |n=0| or if |(-n)| would cause overflow. 

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
  /* print the digits */
  while ( k-->0 ){ 
    mp_svg_print_char(mp, '0'+mp->dig[k]);
  }
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


@ This is test is used to switch between direct representation of characters
and character references.

@<Character |k| is not allowed in SVG output@>=
  (k<=' ')||(k>'~')||(k=='&')||(k=='>')||(k=='<')

@ We often need to print a pair of coordinates. 

Because of bugs in svg rendering software, it is necessary to 
change the point coordinates so that there are all in the "positive" 
quadrant of the SVG field. This means an shift and a vertical flip.

The two correction values are calculated by the function that writes
the initial |<svg>| tag, and  are stored in two globals:

@<Globals@>=
integer dx;
integer dy;

@ @c
void mp_svg_pair_out (MP mp,scaled x, scaled y) { 
  mp_svg_print_scaled(mp, (x+mp->svg->dx)); mp_svg_print_char(mp, ' ');
  mp_svg_print_scaled(mp, (-(y+mp->svg->dy))); mp_svg_print_char(mp, ' ');
}

@ When stroking a path with an elliptical pen, it is necessary to distort
the path such that a circular pen can be used to stroke the path.  The path
itself is wrapped in another transformation to restore the points to their
correct location (but now with a modified pen stroke).

Because all the points in the path need fixing, it makes sense to 
have a specific helper to write such distorted pairs of coordinates out. 

@d scaled_from_double(a) (scaled)(a*65536.0)
@d double_from_scaled(a) (double)(a)/65536.0

@c 
void mp_svg_trans_pair_out (MP mp, mp_pen_info *pen, scaled x, scaled y) { 
  double sx,sy, rx,ry, px, py, retval, divider;
  sx = double_from_scaled(pen->sx);
  sy = double_from_scaled(pen->sy);
  rx = double_from_scaled(pen->rx);
  ry = double_from_scaled(pen->ry);
  px = double_from_scaled((x+mp->svg->dx));
  py = double_from_scaled((-(y+mp->svg->dy)));
  divider = (sx*sy - rx*ry);
  retval = (sy*px-ry*py)/divider;
  mp_svg_print_scaled(mp, scaled_from_double(retval)); 
  mp_svg_print_char(mp, ' ');
  retval = (sx*py-rx*px)/divider;
  mp_svg_print_scaled(mp, scaled_from_double(retval)); 
  mp_svg_print_char(mp, ' ');
}



@ @<Declarations@>=
static void mp_svg_pair_out (MP mp,scaled x, scaled y) ;

@ 
@<Declarations@>=
static void mp_svg_print_initial_comment(MP mp,mp_edge_object *hh);

@ The |<g>| is not really needed right now, but let's keep it just in
case I change my mind about the coordinates yet again. 

@c
void mp_svg_print_initial_comment(MP mp,mp_edge_object *hh) {
  scaled t, tx, ty;
  mp_svg_print(mp, "<?xml version=\"1.0\"?>");
  @<Print the MetaPost version and time @>;
  mp_svg_print_nl(mp, "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\"");
  if ( hh->minx>hh->maxx)  { 
    tx = 0;
    ty = 0;
    mp->svg->dx = 0;
    mp->svg->dy = 0;
 } else {
    tx = (hh->minx<0 ? -hh->minx : 0) + hh->maxx;
    ty = (hh->miny<0 ? -hh->miny : 0) + hh->maxy;
    mp->svg->dx = (hh->minx<0 ? -hh->minx : 0);
    mp->svg->dy = (hh->miny<0 ? -hh->miny : 0) - ty;
  }
  mp_svg_print_nl(mp, "     width=\"");
  mp_svg_print_scaled(mp, tx);
  mp_svg_print(mp, "\"");
  mp_svg_print(mp," height=\"");
  mp_svg_print_scaled(mp, ty);
  mp_svg_print(mp, "\">");
  mp_svg_print_nl(mp,"<!-- points transformed from original BB: ");
  mp_svg_print_nl(mp,"     ");
  mp_svg_print_scaled(mp, hh->minx); mp_svg_print_char(mp,' ');
  mp_svg_print_scaled(mp, hh->miny); mp_svg_print_char(mp,' ');
  mp_svg_print_scaled(mp, hh->maxx); mp_svg_print_char(mp,' ');
  mp_svg_print_scaled(mp, hh->maxy);
  mp_svg_print(mp," -->");
  mp_svg_print_nl(mp, "<g>");
}

@ @<Print the MetaPost version and time @>=
{
  char *s;   
  mp_svg_print_nl(mp, "<!-- Created by MetaPost ");
  s = mp_metapost_version();
  mp_svg_print(mp, s);
  mp_xfree(s);
  mp_svg_print(mp, " on ");
  mp_svg_print_int(mp, mp_round_unscaled(mp, mp->internal[mp_year])); 
  mp_svg_print_char(mp, '.');
  mp_svg_print_dd(mp, mp_round_unscaled(mp, mp->internal[mp_month])); 
  mp_svg_print_char(mp, '.');
  mp_svg_print_dd(mp, mp_round_unscaled(mp, mp->internal[mp_day])); 
  mp_svg_print_char(mp, ':');
  t=mp_round_unscaled(mp, mp->internal[mp_time]);
  mp_svg_print_dd(mp, t / 60); 
  mp_svg_print_dd(mp, t % 60);
  mp_svg_print(mp, " -->");
}


@ Outputting a color specification.

@d set_color_objects(pq)
  object_color_model = pq->color_model;
  object_color_a = pq->color.a_val;
  object_color_b = pq->color.b_val;
  object_color_c = pq->color.c_val;
  object_color_d = pq->color.d_val; 

@c
static void mp_svg_color_out (MP mp, mp_graphic_object *p) {
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
  if ( object_color_model==mp_no_model ) {
    mp_svg_print(mp,"black");
  } else {
    if ( object_color_model==mp_grey_model ) {
       object_color_b = object_color_a;
       object_color_c = object_color_a;
    } else if ( object_color_model==mp_cmyk_model) {
      int c,m,y,k;
      c = object_color_a;
      m = object_color_b;
      y = object_color_c;
      k = object_color_d;
      object_color_a = unity - (c+k>unity ? unity : c+k);
      object_color_b = unity - (m+k>unity ? unity : m+k);
      object_color_c = unity - (y+k>unity ? unity : y+k);
    }
    mp_svg_print(mp,"rgb(");
    mp_svg_print_scaled(mp, (object_color_a * 100));
    mp_svg_print(mp,"%,");
    mp_svg_print_scaled(mp, (object_color_b * 100));
    mp_svg_print(mp,"%,");
    mp_svg_print_scaled(mp, (object_color_c * 100));
    mp_svg_print(mp,"%)");
  }
}

@ @<Declarations@>=
static void mp_svg_color_out (MP mp, mp_graphic_object *p);

@ This is the information that comes from a pen

@<Types...@>=
typedef struct mp_pen_info {
  scaled tx, ty;
  scaled sx, rx, ry, sy; 
  scaled ww;
} mp_pen_info;


@ (Re)discover the characteristics of an elliptical pen

@<Declarations@>=
mp_pen_info *mp_svg_pen_info(MP mp, mp_knot *pp, mp_knot *p);

@ The next two constants come from the original web source. 
Together with the two helper functions, they will tell whether 
the |x| or the |y| direction of the path is the most important

@d aspect_bound   10
@d aspect_default 1

@c
static scaled coord_range_x (mp_knot *h, scaled dz) {
  scaled z;
  scaled zlo = 0, zhi = 0;
  mp_knot *f = h; 
  while (h != NULL) {
    z = gr_x_coord(h);
    if (z < zlo) zlo = z; else if (z > zhi) zhi = z;
    z = gr_right_x(h);
    if (z < zlo) zlo = z; else if (z > zhi) zhi = z;
    z = gr_left_x(h);
    if (z < zlo) zlo = z; else if (z > zhi) zhi = z;
    h = gr_next_knot(h);
    if (h==f)
      break;
  }
  return (zhi - zlo <= dz ? aspect_bound : aspect_default);
}
static scaled coord_range_y (mp_knot *h, scaled dz) {
  scaled z;
  scaled zlo = 0, zhi = 0;
  mp_knot *f = h; 
  while (h != NULL) {
    z = gr_y_coord(h);
    if (z < zlo) zlo = z; else if (z > zhi) zhi = z;
    z = gr_right_y(h);
    if (z < zlo) zlo = z; else if (z > zhi) zhi = z;
    z = gr_left_y(h);
    if (z < zlo) zlo = z; else if (z > zhi) zhi = z;
    h = gr_next_knot(h);
    if (h==f)
      break;
  }
  return (zhi - zlo <= dz ? aspect_bound : aspect_default);
}

@ 
@c
mp_pen_info *mp_svg_pen_info(MP mp, mp_knot *pp, mp_knot *p) {
  scaled wx, wy; /* temporary pen widths, in either direction */
  struct mp_pen_info *pen; /* return structure */
  if (p == NULL)
     return NULL;
  pen = mp_xmalloc(mp, 1, sizeof(mp_pen_info));
  pen->rx = unity;
  pen->ry = unity;
  pen->ww = unity;
  if ((gr_right_x(p) == gr_x_coord(p)) 
       && 
      (gr_left_y(p) == gr_y_coord(p))) {
    wx = abs(gr_left_x(p)  - gr_x_coord(p));
    wy = abs(gr_right_y(p) - gr_y_coord(p));
  } else {
    wx = mp_pyth_add(mp, gr_left_x(p)-gr_x_coord(p),
                         gr_right_x(p)-gr_x_coord(p));
    wy = mp_pyth_add(mp, gr_left_y(p)-gr_y_coord(p),
                         gr_right_y(p)-gr_y_coord(p));
  }
  if ((wy/coord_range_x(pp, wx)) >= (wx/coord_range_y(pp, wy)))
    pen->ww = wy;
  else
    pen->ww = wx;
  pen->tx = gr_x_coord(p); 
  pen->ty = gr_y_coord(p);
  pen->sx = gr_left_x(p) - pen->tx; 
  pen->rx = gr_left_y(p) - pen->ty; 
  pen->ry = gr_right_x(p) - pen->tx; 
  pen->sy = gr_right_y(p) - pen->ty;
  if (pen->ww != unity) {
    if (pen->ww == 0) {
      pen->sx = unity;
      pen->sy = unity;
    } else {
      pen->rx = mp_make_scaled(mp, pen->rx, pen->ww);
      pen->ry = mp_make_scaled(mp, pen->ry, pen->ww);
      pen->sx = mp_make_scaled(mp, pen->sx, pen->ww);
      pen->sy = mp_make_scaled(mp, pen->sy, pen->ww);
    }
  }
  return pen;
}

@ Two types of straight lines come up often in \MP\ paths:
cubics with zero initial and final velocity as created by |make_path| or
|make_envelope|, and cubics with control points uniformly spaced on a line
as created by |make_choices|.

@<Declarations@>=
static boolean mp_is_curved(MP mp, mp_knot *p, mp_knot *q) ;


@ 
@d bend_tolerance 131 /* allow rounding error of $2\cdot10^{-3}$ */

@c 
boolean mp_is_curved(MP mp, mp_knot *p, mp_knot *q) {
  scaled d; /* a temporary value */
  if ( gr_right_x(p)==gr_x_coord(p) )
    if ( gr_right_y(p)==gr_y_coord(p) )
      if ( gr_left_x(q)==gr_x_coord(q) )
        if ( gr_left_y(q)==gr_y_coord(q) ) 
          return false;
  d=gr_left_x(q)-gr_right_x(p);
  if ( abs(gr_right_x(p)-gr_x_coord(p)-d)<=bend_tolerance )
    if ( abs(gr_x_coord(q)-gr_left_x(q)-d)<=bend_tolerance ) {
      d=gr_left_y(q)-gr_right_y(p);
      if ( abs(gr_right_y(p)-gr_y_coord(p)-d)<=bend_tolerance )
        if ( abs(gr_y_coord(q)-gr_left_y(q)-d)<=bend_tolerance )
           return false;
    }
  return true;
}


@ @c
static void mp_svg_path_out (MP mp, mp_knot *h) {
  mp_knot *p, *q; /* for scanning the path */
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
    mp_svg_print_ln(mp);
    if (mp_is_curved(mp, p, q)){ 
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
    p=q;
  } while (p!=h);
  mp_svg_print(mp, "\"");
}

@ @c
static void mp_svg_path_trans_out (MP mp, mp_knot *h, mp_pen_info *pen) {
  mp_knot *p, *q; /* for scanning the path */
  mp_svg_print(mp, " d=\"M ");
  mp_svg_trans_pair_out(mp, pen, gr_x_coord(h),gr_y_coord(h));
  mp_svg_print(mp, " ");
  p=h;
  do {  
    if ( gr_right_type(p)==mp_endpoint ) { 
      if ( p==h ) mp_svg_print(mp, " l 0 0 ");
      mp_svg_print(mp, "\"");
      return;
    }
    q=gr_next_knot(p);
    mp_svg_print_ln(mp);
    if (mp_is_curved(mp, p, q)){ 
      mp_svg_print(mp, "C ");
      mp_svg_trans_pair_out(mp, pen, gr_right_x(p),gr_right_y(p));
      mp_svg_print(mp, ", ");
      mp_svg_trans_pair_out(mp, pen,gr_left_x(q),gr_left_y(q));
      mp_svg_print(mp, ", ");
      mp_svg_trans_pair_out(mp, pen,gr_x_coord(q),gr_y_coord(q));
      mp_svg_print(mp, " ");
    } else if ( q!=h ){ 
      mp_svg_print(mp, "L ");
      mp_svg_trans_pair_out(mp, pen,gr_x_coord(q),gr_y_coord(q));
      mp_svg_print(mp, " ");
   }
    p=q;
  } while (p!=h);
  mp_svg_print(mp, "\"");
}

@ Now for outputting the actual graphic objects. 

@<Declarations@>=
static void mp_svg_text_out (MP mp, mp_text_object *p) ;

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
  mp_svg_print_nl(mp, "<g transform=\"");
  if ( transformed ) {
    mp_svg_print(mp, "matrix(");
    mp_svg_print_scaled(mp,gr_txx_val(p));
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,gr_tyx_val(p));
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,gr_txy_val(p));
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,gr_tyy_val(p));
    mp_svg_print(mp,",");
  } else { 
    mp_svg_print(mp, "translate(");
  }
  mp_svg_pair_out(mp,gr_tx_val(p),gr_ty_val(p));
  mp_svg_print(mp, ")\">");
  mp_svg_print_nl(mp, "<text font-size=\"");
  ds=(mp->font_dsize[gr_font_n(p)]+8) / 16;
  mp_svg_print_scaled(mp,ds);

  mp_svg_print(mp, "\"\r style=\"");
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
    } else {
      mp_svg_print_char(mp, k);
    }
  }

  mp_svg_print(mp, "</text></g>");
  mp_svg_print_ln(mp);
}

@ When stroking a path with an elliptical pen, it is necessary to transform
the coordinate system so that a unit circular pen will have the desired shape.
To keep this transformation local, we enclose it in a $$\&{<g>}\ldots\&{</g>}$$
block. Any translation component must be applied to the path being stroked
while the rest of the transformation must apply only to the pen.
If |fill_also=true|, the path is to be filled as well as stroked so we must
insert commands to do this after giving the path.

@<Declarations@>=
static void mp_svg_stroke_out (MP mp,  mp_graphic_object *h, 
                               mp_pen_info *pen, boolean fill_also) ;


@ @c
void mp_svg_stroke_out (MP mp,  mp_graphic_object *h, 
                              mp_pen_info *pen, boolean fill_also) {
  boolean transformed = false;
  if (pen != NULL) {
    transformed = true;
    if ((pen->sx==unity) &&
        (pen->rx==0) &&
        (pen->ry==0) &&
        (pen->sy==unity) &&
        (pen->tx==0) && 
        (pen->ty==0)) {
      transformed = false;
    }
  }
  if (transformed) {
    mp_svg_print_nl(mp, "<g transform=\"");
    mp_svg_print(mp, "matrix(");
    mp_svg_print_scaled(mp,pen->sx);
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,pen->rx);
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,pen->ry);
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,pen->sy);
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,pen->tx);
    mp_svg_print(mp,",");
    mp_svg_print_scaled(mp,pen->ty);
    mp_svg_print(mp, ")\">");
  }
  mp_svg_print_nl(mp, "<path");
  if (gr_type(h)==mp_fill_code) {
    if (transformed) 
      mp_svg_path_trans_out(mp, gr_path_p((mp_fill_object *)h), pen);
    else
      mp_svg_path_out(mp, gr_path_p((mp_fill_object *)h));
    mp_svg_print(mp, "\r style=\"");
    mp_svg_print(mp, "fill: ");
    mp_svg_color_out(mp,h);
    mp_svg_print(mp, "; ");
    mp_svg_print(mp, "stroke: none;");
    mp_svg_print(mp, "\"");
  } else {
    if (transformed) 
      mp_svg_path_trans_out(mp, gr_path_p((mp_stroked_object *)h), pen);
    else
      mp_svg_path_out(mp, gr_path_p((mp_stroked_object *)h));
    mp_svg_print(mp, "\r style=\"");

    mp_svg_print(mp, "stroke: ");
    mp_svg_color_out(mp,h);
    mp_svg_print(mp, ";");

    {
      mp_svg_print(mp, "stroke-width: ");
      if (pen != NULL) {
        mp_svg_print_scaled(mp, pen->ww);
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
         mp_svg_print(mp, "stroke-dasharray: ");
         for (i=0; *(hh->array+i) != -1;i++) {
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
  if (transformed) {
    mp_svg_print(mp, "</g>");
  }
  mp_svg_print_ln(mp);
}

@ Here is a simple routine that just fills a cycle.

@<Declarations@>=
static void mp_svg_fill_out (MP mp, mp_knot *p, mp_graphic_object *h);

@ @c
void mp_svg_fill_out (MP mp, mp_knot *p, mp_graphic_object *h) {
  mp_svg_print_nl(mp, "<path");
  mp_svg_path_out(mp, p);
  mp_svg_print(mp, "\r style=\"");
  mp_svg_print(mp, "fill: ");
  mp_svg_color_out(mp,h);
  mp_svg_print(mp, "; ");
  mp_svg_print(mp, "stroke: none;");
  mp_svg_print(mp, "\"/>");
  mp_svg_print_ln(mp);
}

@ The main output function

@d gr_has_scripts(A) (gr_type((A))<mp_start_clip_code)
@d pen_is_elliptical(A) ((A)==gr_next_knot((A)))

@<Exported function ...@>=
int mp_svg_gr_ship_out (mp_edge_object *hh, int prologues, int standalone) ;

@ @c 
int mp_svg_gr_ship_out (mp_edge_object *hh, int qprologues, int standalone) {
  mp_graphic_object *p;
  mp_pen_info *pen = NULL;
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
    if ( gr_has_scripts(p) ) {
      @<Write |pre_script| of |p|@>;
    }
    switch (gr_type(p)) {
    case mp_fill_code: 
      {
        mp_fill_object *ph = (mp_fill_object *)p;
        if ( gr_pen_p(ph)==NULL ) {
          mp_svg_fill_out(mp, gr_path_p(ph), p);
        } else if ( pen_is_elliptical(gr_pen_p(ph)) )  {
          pen = mp_svg_pen_info(mp, gr_path_p(ph), gr_pen_p(ph));
          mp_svg_stroke_out(mp, p, pen, true);
          mp_xfree(pen);
        } else { 
          mp_svg_fill_out(mp, gr_path_p(ph), p);
          mp_svg_fill_out(mp, gr_htap_p(ph), p);
        }
      }
      break;
    case mp_stroked_code:
      {
        mp_stroked_object *ph = (mp_stroked_object *)p;
        if ( pen_is_elliptical(gr_pen_p(ph))) {
          pen = mp_svg_pen_info(mp, gr_path_p(ph), gr_pen_p(ph));
	      mp_svg_stroke_out(mp, p, pen, false);
          mp_xfree(pen);
        } else { 
          mp_svg_fill_out(mp, gr_path_p(ph), p);
        }
      }
      break;
    case mp_text_code: 
      if ( (gr_font_n(p)!=null_font) && (strlen(gr_text_p(p))>0) ) {
        mp_svg_text_out(mp, (mp_text_object *)p);
      }
      break;
    case mp_start_clip_code: 
      mp_svg_print_nl(mp, "<g><defs>");
      mp_svg_print_nl(mp, "<clipPath id=\"XX\">");
      mp_svg_print_nl(mp, "<path ");
      mp_svg_path_out(mp, gr_path_p((mp_clip_object *)p));
      mp_svg_print(mp, "\r style=\"fill:black; stroke:none;\"/>");
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
    if ( gr_has_scripts(p) ) {
      @<Write |post_script| of |p|@>;
    }
    p=gr_link(p);
  }
  mp_svg_print_nl(mp, "</g></svg>"); mp_svg_print_ln(mp);
  (mp->close_file)(mp,mp->output_file);
  return 1;
}

@ @(mplibsvg.h@>=
int mp_svg_ship_out (mp_edge_object *hh, int prologues) ;

@ @c
int mp_svg_ship_out (mp_edge_object *hh, int prologues) {
  return mp_svg_gr_ship_out (hh, prologues, (int)true);
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


@ 
@d do_write_postscript(a,b) {
  if ( (gr_post_script((b *)a))!=NULL ) {
    mp_svg_print_nl (mp, gr_post_script((b *)a)); 
    mp_svg_print_ln(mp);
  }
}

@<Write |post_script| of |p|@>=
{
  if (gr_type(p)==mp_fill_code) { do_write_postscript(p,mp_fill_object); }
  else if (gr_type(p)==mp_stroked_code) { do_write_postscript(p,mp_stroked_object); }
  else if (gr_type(p)==mp_text_code) { do_write_postscript(p,mp_text_object); }
}
