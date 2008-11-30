verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

beginfig(-1);
	% Determine the size of the default font
	w:=fontsize defaultfont;

	% Place a "point" at (0,0)
   label(btex $\scriptscriptstyle\bullet$ etex,(0,0)) scaled 1.5;

	% Draw a square around the point
	draw (-7*w/16,-7*w/16)--(7*w/16,-7*w/16)--(7*w/16,7*w/16)--(-7*w/16,7*w/16)--cycle;

	% Draw vertical and horizontal lines through the point
	draw (0,-7*w/16)--(0,7*w/16);
	draw (-7*w/16,0)--(7*w/16,0);

	% Label the 4 positions
	label.lft(btex \texttt{lft} etex,(-w/4,0));
	label.rt(btex \texttt{rt} etex,(w/4,0));
	label.bot(btex \texttt{bot} etex,(0,-w/4));
	label.top(btex \texttt{top} etex,(0,w/4));

	% Manually set the bbox
	setbounds currentpicture to (-2*w,-2*w)--(2*w,-2*w)--(2*w,2*w)--(-2*w,2*w)--cycle;
endfig;
end
