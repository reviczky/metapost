
LD = gcc
CC = gcc

LUABUILDDIR=/opt/tex/luatex/trunk/build/libs/lua51
LUASRCDIR =/opt/tex/luatex/trunk/src/libs/lua51
LUALIB=$(LUABUILDDIR)/liblua.a

KPSEBUILDDIR = ../../../texk/kpathsea/.libs
KPSESRCDIR = ../../../../src/texk
KPSELIB=$(KPSEBUILDDIR)/libkpathsea.a

MPLIBBUILDDIR = ../../../texk/web2c/mpdir/lib/.libs
MPLIBSRCDIR = ../../../../src/texk/web2c/mpdir/lib
MPLIB = $(MPLIBBUILDDIR)/libmplib.a

CFLAGS = -Wall -W -pedantic -g -I../.. -I./lib
OBJECTS = mpost.o mpxout.o makempx.o
LUAOBJECTS = lmplib.o luamain.o

newmpost: $(MPLIB) $(OBJECTS) 
	$(LD) -o newmpost $(OBJECTS) $(MPLIB) $(KPSELIB)

luampost: $(MPLIB) $(LUAOBJECTS) 
	$(LD) -o luampost $(LUAOBJECTS) $(MPLIB) $(LUALIB) -lm

lib/avl.o: lib/avl.c
	cd lib && make avl.o

makempx.o: mpxout.o

makempx: makempx.o mpxout.o lib/avl.o
	$(LD) -o makempx lib/avl.o makempx.o mpxout.o $(KPSELIB) -lm

clean:
	$(RM) *.o makempx newmpost luampost mpost.c *.scn *.idx *.toc *.pdf *.log mpxerr.*
	$(RM) mpxout.c mpxout.h makempx.c makempx.tex mpost.tex mpxout.tex

.c.o:
	$(CC) -c $< -o $@

.w.c:
	$(CTANGLE) $< $@

$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(MPLIBSRCDIR) -I$(KPSESRCDIR) $< -o $@

$(LUAOBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(MPLIBSRCDIR) -I$(LUASRCDIR) $< -o $@


