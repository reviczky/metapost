
AUTOMAKE_OPTIONS = foreign

CFLAGS=-Wall -W -g

lib_LTLIBRARIES = libmplib.la

libmplib_la_SOURCES = avl.c mp.c psout.c

include_HEADERS = mplib.h

libmplib_la_LDFLAGS = -version-info 0:0:0

CTANGLE=ctangle

mp.c: psout.c

.w.c:
	$(CTANGLE) $< $@

clean::
	rm mp.c psout.c mplib.h mppsout.h mpmp.h