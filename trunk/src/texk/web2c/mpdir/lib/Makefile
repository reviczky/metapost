
srcdir = .

KPSEBUILDDIR = ../../../../../build/texk/kpathsea/.libs
KPSESRCDIR = ../../..

RM = rm -f
LD = gcc
CC = gcc
CTANGLE = ctangle

CFLAGS = -Wall -W -g -I../../..
OBJECTS = avl.o mp.o mpost.o psout.o


newmpost: $(OBJECTS) avl.h $(KPSEBUILDDIR)/libkpathsea.a
	$(LD) -o newmpost $(OBJECTS) $(KPSEBUILDDIR)/libkpathsea.a 

mp.c: mp.w psout.c
	$(CTANGLE) mp.w

mpost.c: mpost.w 
	$(CTANGLE) mpost.w 

psout.c: psout.w 
	$(CTANGLE) psout.w 

$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) -I$(KPSESRCDIR) $< -o $@

clean:
	$(RM) *.o newmpost mp.c mpost.c psout.c mp*.h *.scn *.idx *.toc *.pdf *.log  
