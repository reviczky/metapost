if scantokens(mpversion) > 1.005:
  outputtemplate :=
else:
  filenametemplate
fi
"%j.mps";

beginfig(0);
	path p;
	p:=(0,3/16)
			--(halfcircle rotated 180 scaled (1/4) shifted (1/8,-1/4))
			--(halfcircle scaled (11/32) shifted (5/64,3/8))
			--(halfcircle rotated 180 scaled (7/16) shifted (1/8,-1/2))
			--(11/32,3/16);
	linecap:=squared;
	draw p scaled 18 withpen pencircle scaled 1.25bp;
	draw p scaled 18 withcolor (0.56,0.72159,0.4);
endfig;
end
