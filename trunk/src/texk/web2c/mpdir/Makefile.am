
AUTOMAKE_OPTIONS = foreign

KPSEBUILDDIR = ../../../texk/kpathsea/.libs
KPSELIB=$(KPSEBUILDDIR)/libkpathsea.a
CFLAGS=-Wall -W -g -I. -I../..

bin_PROGRAMS = mpost

mpost_SOURCES = mpost.c 
mpost_DEPENDENCIES = libmplib.a
mpost_LDADD = libmplib.a $(KPSELIB) -lm

noinst_LIBRARIES = libmplib.a
libmplib_a_SOURCES = avl.c mp.c psout.c mpxout.c

include_HEADERS = mplib.h

CTANGLE=ctangle

mp.c: psout.c mpxout.c

.w.c:
	$(CTANGLE) $< $@

clean::
	$(RM) mp.c psout.c mplib.h mppsout.h mpmp.h mpxout.c mpxout.h *.o libmplib.a mpost.c mpost

distclean:: clean
	$(RM) Makefile config.h config.status config.log libtool
