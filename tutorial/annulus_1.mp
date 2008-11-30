beginfig(-1);
	% Set unit size to 54bp = 3/4in
	u:=54;

	path p,q;
	% Define circle of radius 3/4in
	p:=fullcircle scaled (2*u);
	% Define circle of radius 3/8in
	q:=fullcircle scaled u;

	% Fill annulus
	fill p--reverse q--cycle withcolor (3/5,4/5,1);
	
	% Draw big circle
	draw p;
	% Draw small circle
	draw q;
endfig;
end
