
LD = gcc

KPSEBUILDDIR = ../../../texk/kpathsea/.libs
KPSESRCDIR = ../..

CFLAGS = -Wall -W -g -I../.. -I./lib
OBJECTS = mpost.o 
MPLIB = lib/libmplib.a
KPSELIB=$(KPSEBUILDDIR)/libkpathsea.a


newmpost: $(MPLIB) $(OBJECTS) 
	$(LD) -o newmpost $(OBJECTS) $(MPLIB) $(KPSELIB)

$(MPLIB):
	cd lib && make

mpost.c: mpost.w 
	$(CTANGLE) mpost.w 

clean:
	cd lib && make clean
	$(RM) *.o newmpost mp.c mpost.c *.scn *.idx *.toc *.pdf *.log


$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(KPSESRCDIR) $< -o $@
