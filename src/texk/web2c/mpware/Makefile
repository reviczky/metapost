# $Id: Makefile,v 1.6 2005/03/19 09:13:25 taco Exp $
# Public domain.

CC = gcc
CFLAGS = -g -O2 $(XCFLAGS)
compile_command = $(CC) -o $@ $(CFLAGS) 

CCLD = $(CC)
LDFLAGS =  $(XLDFLAGS)
link_command = $(CCLD) -o $@ $(LDFLAGS) 

RM = rm -f
CP = cp -f

programs=dmp newer mpto makempx

all: $(programs) 

mpto: mpto.o
	$(link_command) mpto.o

newer: newer.o
	$(link_command) newer.o

dmp: dmp.o dmp_ffile.o
	$(link_command) dmp.o dmp_ffile.o -lm

dmp.o dmp_ffile.o: dmp.h

.c.o:
	$(compile_command) -c $< -o $@

makempx: makempx.in
	$(CP) makempx.in $@
	-chmod a+x $@


clean:
	$(RM) *.o $(programs)
