
LD = gcc
CC = gcc
CFLAGS = -Wall -W -g

LUABUILDDIR=/opt/tex/luatex/trunk/build/libs/lua51
LUASRCDIR =/opt/tex/luatex/trunk/src/libs/lua51
LUALIB=$(LUABUILDDIR)/liblua.a

KPSEBUILDDIR = ../../../texk/kpathsea/.libs
KPSESRCDIR = ../../../../src/texk
KPSELIB=$(KPSEBUILDDIR)/libkpathsea.a

MPLIBBUILDDIR = ../../../texk/web2c/mpdir/lib/.libs
MPLIBSRCDIR = ../../../../src/texk/web2c/mpdir/lib
MPLIB = $(MPLIBBUILDDIR)/libmplib.a

CFLAGS = -Wall -W -g -I../.. -I./lib
OBJECTS = mpost.o 
LUAOBJECTS = lmplib.o luamain.o

newmpost: $(MPLIB) $(OBJECTS) 
	$(LD) -o newmpost $(OBJECTS) $(MPLIB) $(KPSELIB)

luampost: $(MPLIB) $(LUAOBJECTS) 
	$(LD) -o luampost $(LUAOBJECTS) $(MPLIB) $(LUALIB) -lm

clean:
	cd lib && make clean
	$(RM) *.o newmpost luampost mpost.c *.scn *.idx *.toc *.pdf *.log

.c.o:
	$(CC) -c $< -o $@

.w.c:
	$(CTANGLE) $< $@

$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(MPLIBSRCDIR) -I$(KPSESRCDIR) $< -o $@

$(LUAOBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(MPLIBSRCDIR) -I$(LUASRCDIR) $< -o $@
