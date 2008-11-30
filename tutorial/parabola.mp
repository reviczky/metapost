verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

beginfig(-1);
	% Set unit size to 108pt = 3/2in
	u:=108;
	v:=2*u/(1+sqrt(5));

	% Determine the size of the default font
	w:=fontsize defaultfont;

	% Draw the parabola
	draw (-u,2*v){dir -angle(1*u,4*v)}..(-u/2,v/2){dir -angle(1*u,2*v)}..(0,0){right}..(u/2,v/2){dir angle(1*u,2*v)}..(u,2*v){dir angle(1*u,4*v)} withcolor red;

	% Label f(x)
	label.lft(btex $f(x)=x^2$ etex,(u/sqrt(2),v));
	
	% Draw x and y axes arrows
	drawarrow (-u,0)--(u+w/2,0);
	drawarrow (0,0)--(0,2*v+w/2);
	
	% Label the x and y axes
	label.rt(btex $x$ etex,(u+w/2,0));
	label.top(btex $y$ etex,(0,2*v+w/2));

	% Pad left size to horizontally center figure
	label.lft(btex $\phantom{x}$ etex,(-u-w/2,0));

	% Shrink figure
	currentpicture:=currentpicture scaled 0.75;
endfig;
end