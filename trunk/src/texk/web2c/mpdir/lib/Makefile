
RM = rm -f
CC = gcc
CTANGLE = ctangle
AR = ar
RANLIB = ranlib

CFLAGS = -Wall -W -g -I../../..
OBJECTS = avl.o mp.o psout.o

libmplib.a: $(OBJECTS)
	$(AR) cru libmplib.a $(OBJECTS)
	$(RANLIB) libmplib.a

mp.c: mp.w psout.c
	$(CTANGLE) mp.w

psout.c: psout.w 
	$(CTANGLE) psout.w 

$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) *.o libmplib.a mp.c psout.c mp*.h *.scn *.idx *.toc *.pdf *.log  
