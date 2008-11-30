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

	% Above is used to determine the bbox of the annulus
	picture h;
	h:=currentpicture; % Store the currentpicture
	currentpicture:=nullpicture; % Clear the currentpicture

	% Create magenta background
	fill bbox h withcolor (1,0,1);

	% Fill the big circle
	fill p withcolor (3/5,4/5,1);

	% Unfill the small circle
	unfill q;
	
	% Draw the big circle
	draw p;
	% Draw the small circle
	draw q;
endfig;
end
