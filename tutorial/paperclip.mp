if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

beginfig(0);
	path p;
	p:=(0,3/16)--(halfcircle rotated 180 scaled (1/4) shifted (1/8,-1/4))--(halfcircle scaled (5/16) shifted (3/32,3/8))--(halfcircle rotated 180 scaled (3/8) shifted (1/8,-1/2))--(5/16,3/16);
	linecap:=butt;
	draw p scaled 18 withcolor (0.665,0.85689,0.475);
endfig;
end
