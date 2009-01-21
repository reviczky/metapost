if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

beginfig(0);
	path p;
	p:=(0,3/16)--(halfcircle rotated 180 scaled (1/4) shifted (1/8,-1/4))--(halfcircle scaled (9/32) shifted (7/64,3/8))--(halfcircle rotated 180 scaled (81/256) shifted (65/512,-1/2))--(73/256,3/16);
	linecap:=butt;
	draw p scaled 18 withpen pencircle scaled 0.35bp;
endfig;
end
