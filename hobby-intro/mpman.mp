% Figures for MetaPost manual, by John Hobby.  Public domain.

filenametemplate "%j-%c.mps";

%%% This redefinition of dotlabel draws dots as a closed path
%%% which are rendered more smoothly in Adobe Reader.
vardef dotlabel@#(expr s,z) text t_ =
  label@#(s,z) t_;
  addto currentpicture
    contour (makepath pencircle scaled dotlabeldiam) shifted z t_;
enddef;


%%% TeX macro \place is only used in figure 0.
verbatimtex
\input texnames.sty
\def\place#1{\vphantom{FiMP}\smash{#1}}
etex

%%% The boxes package is only used in figure 0.
input boxes

beginfig(0);
ba.dy = bb.dy = d.dy = 12bp;
d.dx = 100bp;
boxit.aa(btex \place{Figures in MetaPost} etex);
boxit.ab(btex \place{\TeX\ Document} etex);
boxit.ba(btex \hbox to 75bp {\hfil\place{MetaPost}\hfil} etex);
boxit.bb.(btex \hbox to 75bp {\hfil\place{\TeX\ or \LaTeX}\hfil} etex);
boxit.ca(btex \place{Figures in PostScript} etex);
boxit.cb(btex \place{{\tt dvi} file} etex);
boxit.d(btex \place{\tt dvips} etex);
boxit.e(btex PostScript etex);
boxit.f(btex \vbox{
          \hbox to 50bp {\hfil\hbox{bounding}\hfil}
          \hbox to 50bp {\hfil\hbox{box}\hfil}
        } etex scaled .8);
ba.n - aa.s = ca.n - ba.s
= bb.n - ab.s = cb.n - bb.s
= e.n - d.s = down * 25bp;
ypart cb.s - ypart d.n = 25bp;
e.s = origin;
ypart ca.s = ypart cb.s;
xpart aa.n = xpart 0.1[d.nw,d.ne];
xpart ab.n = xpart 0.9[d.nw,d.ne];
drawunboxed(aa,ab,ca,cb,e);
drawboxed(ba,bb,d);
drawarrow aa.s -- top ba.n; drawarrow ab.s -- top bb.n;
drawarrow ba.s -- top ca.n; drawarrow bb.s -- top cb.n;
drawarrow ca.s -- top 0.1[d.nw,d.ne];
drawarrow cb.s -- top 0.9[d.nw,d.ne];
drawarrow d.s -- top e.n;
path p;
p = ca.e{right} .. {right}bb.w;
f.c = point .5 of p;
drawunboxed(f);
draw p cutafter bpath f dashed evenly;
drawarrow p cutbefore subpath (1,3) of bpath f dashed evenly;
endfig;

end
