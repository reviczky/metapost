
LD = gcc
CC = gcc
CFLAGS = -Wall -W -g

KPSEBUILDDIR = ../../../texk/kpathsea/.libs
KPSESRCDIR = ../../../../src/texk
KPSELIB=$(KPSEBUILDDIR)/libkpathsea.a

MPLIBBUILDDIR = ../../../texk/web2c/mpdir/lib/.libs
MPLIBSRCDIR = ../../../../src/texk/web2c/mpdir/lib
MPLIB = $(MPLIBBUILDDIR)/libmplib.a

CFLAGS = -Wall -W -g -I../.. -I./lib
OBJECTS = mpost.o 

newmpost: $(MPLIB) $(OBJECTS) 
	$(LD) -o newmpost $(OBJECTS) $(MPLIB) $(KPSELIB)

clean:
	cd lib && make clean
	$(RM) *.o newmpost mpost.c *.scn *.idx *.toc *.pdf *.log


.c.o:
	$(CC) -c $< -o $@

.w.c:
	$(CTANGLE) $< $@

$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(MPLIBSRCDIR) -I$(KPSESRCDIR) $< -o $@
