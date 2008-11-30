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

	% Draw diagonals of the square through the point
	draw (-7*w/16,-7*w/16)--(7*w/16,7*w/16);
	draw (-7*w/16,7*w/16)--(7*w/16,-7*w/16);

	% Label the 4 positions
	label.llft(btex \texttt{llft} etex,(-w/4,-w/4));
	label.ulft(btex \texttt{ulft} etex,(-w/4,w/4));
	label.lrt(btex \texttt{lrt} etex,(w/4,-w/4));
	label.urt(btex \texttt{urt} etex,(w/4,w/4));

	% Manually set the bbox
	setbounds currentpicture to (-11/4*w,-2*w)--(11/4*w,-2*w)--(11/4*w,2*w)--(-11/4*w,2*w)--cycle;
endfig;
end
