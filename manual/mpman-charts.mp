verbatimtex
	\def\appl#1{\applfontx#1\strut}
	\def\ext#1{\extfontx#1\strut}
	\font\applfontx=ec-lmri10
	\font\extfontx=ec-lmtt10
	\font\extfontvii=ec-lmtt8 at 7pt
etex

% Use the boxes package for drawing charts.
input boxes
input mpcharts
%prologues:=3;

if scantokens(mpversion) < 1.200:
  filenametemplate
else:
  outputtemplate :=
fi
"%j-%c.mps";


beginfig(1);
	interim applwidth := 72bp;
	interim applheight := 28bp;
	interim extwidth := 48bp;
	interim extheight := 28bp;
	interim rowscale := 56bp;
	interim colscale := 100bp;
	interim ahangle := 30;

% Build and draw boxes.
	ext_rc(fig.mp, (0,0), btex \ext{fig.mp} etex);
	appl_rc(mpost, (1,0), btex \appl{MetaPost} etex);
	ext_rc(fig.1, (2,0), btex \ext{fig.1} etex);
	ext_rc(doc.tex, (0,2), btex \ext{doc.tex} etex);
	appl_rc(tex, (1,2), btex \appl{\TeX} etex);
	ext_rc(doc.dvi, (2,2), btex \ext{doc.dvi} etex);
	appl_rc(dvips, (3,1), btex \appl{dvips} etex);
	ext_rc(doc.ps, (4,1), btex \ext{doc.ps} etex);

% Draw connections.
	line(fig.mp, mpost);
	line(mpost, fig.1);
	line(doc.tex, tex);
	line(tex, doc.dvi);
	curve(fig.1, dvips, -90, 0);
	curve(doc.dvi, dvips, -90, 180);
	line(dvips, doc.ps);

% Draw bounding box link.
	boxit.bb(btex \vbox{
			\hbox to 50bp {\hfil\strut bounding\hfil}
			\hbox to 50bp {\hfil\strut box\hfil}
			} etex scaled .8);
	path p;
	p := fig.1.e{right}..{right}tex.w;
	bb.c = point 0.5 of p;
	drawunboxed(bb);
	draw p cutafter bpath bb dashed evenly;
	drawarrow p cutbefore subpath (1,3) of bpath bb dashed evenly;
endfig;

end
