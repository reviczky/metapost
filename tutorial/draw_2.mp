verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

beginfig(-1);
	% Set unit size to 72bp = 1in
	u:=72;
	
	% Draw arrow around curved path
	drawarrow (0,0){right}..{dir 45}(3*u/4,u/4){dir 45}..{up}(u,u);

	% Label the 3 points
	label.bot(btex \texttt{z1} etex,(0,0));
	label.lrt(btex \texttt{z2} etex,(3*u/4,u/4));
	label.rt(btex \texttt{z3} etex,(u,u));			
endfig;
end
