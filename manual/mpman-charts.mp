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


verbatimtex
	\font\applfontx=ec-lmbxi10
etex

beginfig(2);
% Store human face in picture variables.
  picture unituserLeft, unituserRight;
  unituserLeft := image(
		path face;
	  face :=
			(3, 0)..% chin
			{up}(0, 30){dir 195}..% bottom nose onset
			(-10, 30)..% somewhere along the nose
			{dir -80}(0, 41.5){up}..% top nose onset
			(3, 65);% forehead
		draw face;% face
		draw (point 0.5 of face){right}..(22, 20);% mouth
		draw fullcircle scaled 7 shifted (12, 55);% eye
		) scaled 1/65;
	unituserLeft := unituserLeft shifted (-llcorner unituserLeft -.5urcorner unituserLeft);
	unituserRight := unituserLeft reflectedabout ((0,0), (0,1));

% The size of the user icon.
	usersize := 32bp;

% Pre-define workflow segment parameters.
	wfsegments := 5;% counter
  wfsegangle = 360/wfsegments;% angle
	wfstart := 90 + .5wfsegangle;% angle
	wfdiam := 200bp;% dimension
	wfthick := 48bp;% dimension
	wfgap := 10;% angle
	wfarrowangle := 10;% angle

% Pre-define colors of some graphic elements.
	color wf_col, appl_col, ext_col, user_col;
	wf_col = .9white;
	appl_col = (.1, .1, .7);
	ext_col = 0white;
	user_col = (1, 0.7, 0);

% Construct a workflow segment.
%
% wfang[] stores the angle on a circle corresponding to a
% vertex of a workflow segment.  The mapping of indices to
% vertices is:
%     2---------0
%    /         /
%   3         1
%    \         \
%     2---------0
%
% For wfscale[] the mapping is:
%     3---------0
%    /         /
%   <         <
%    \         \
%     2---------1
  numeric wfang[], wfscale[];
  path wfseg;
  wfang0 = .5(-wfsegangle + wfgap - wfarrowangle);
  wfang1 = .5(-wfsegangle + wfgap + wfarrowangle);
  wfang2 = .5( wfsegangle - wfgap - wfarrowangle);
  wfang3 = .5( wfsegangle - wfgap + wfarrowangle);
	wfscale[0] = 1 + wfthick/wfdiam;
	wfscale[1] = 1 - wfthick/wfdiam;
	wfscale[2] = 1 - 1.0*wfthick/wfdiam;
	wfscale[3] = 1 + 1.0*wfthick/wfdiam;
	wfseg :=              0.5dir(wfang0)*wfscale0 {dir(wfang0-180)}
		..{dir(wfang1+135)} 0.5dir(wfang1)          {dir(wfang1-135)}
	  ..{dir(wfang0+180)} 0.5dir(wfang0)*wfscale1 {dir(wfang0+90)}
		..{dir(wfang2+90)}  0.5dir(wfang2)*wfscale2 {dir(wfang2)}
		..{dir(wfang3+45)}  0.5dir(wfang3)          {dir(wfang3-45)}
		..{dir(wfang2)}     0.5dir(wfang2)*wfscale3 {dir(wfang2-90)}
		..{dir(wfang0-90)}  cycle;

% Helper function: transform location on workflow circle in
% degrees into cartesian coordinates.
	def degtoxy(expr d) =
		(point d/45 of fullcircle scaled wfdiam)
	enddef;

% Draw workflow segments.
	for i=0 upto wfsegments:
		fill wfseg scaled wfdiam rotated (wfstart+i*wfsegangle) withcolor wf_col;
	endfor

% Fill-in workflow segment descriptions.
	label(btex \appl{Editor} etex, degtoxy(wfstart+wfsegangle*0+5)) withcolor appl_col;
	label(btex \ext{fig.mp} etex, degtoxy(wfstart+wfsegangle*1)) withcolor ext_col;
	label(btex \appl{MetaPost} etex, degtoxy(wfstart+wfsegangle*2)) withcolor appl_col;
	label(btex \ext{fig.1} etex, degtoxy(wfstart+wfsegangle*3+10)) withcolor ext_col;
	label(btex {\extfontvii fig.log} etex, degtoxy(wfstart+wfsegangle*3-10)) withcolor ext_col;
	label(btex \appl{Previewer} etex, degtoxy(wfstart+wfsegangle*4-5)) withcolor appl_col;

% Draw users.
	label(unituserLeft scaled usersize rotated 14, degtoxy(wfstart+wfsegangle*0-15))
		withpen pencircle scaled 1.25bp withcolor user_col;% editor user
	label(unituserRight scaled usersize rotated -14, degtoxy(wfstart+wfsegangle*4+15))
		withpen pencircle scaled 1.25bp withcolor user_col;% previewer user
endfig;

end
