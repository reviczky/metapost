# Copyright 2008 Taco Hoekwater.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

AUTOMAKE_OPTIONS = foreign

KPSEBUILDDIR = ../../../texk/kpathsea/.libs
KPSESRCDIR = ../../../../src/texk/kpathsea
KPSELIB=$(KPSEBUILDDIR)/libkpathsea.a
CFLAGS=-Wall -W -g -I. -I../.. -I$(KPSESRCDIR)/.. -I$(KPSESRCDIR)

bin_PROGRAMS = mpost

mpost_SOURCES = mpost.c mpxout.c
mpost_DEPENDENCIES = libmplib.a
mpost_LDADD = libmplib.a $(KPSELIB) -lm

noinst_LIBRARIES = libmplib.a
libmplib_a_SOURCES = avl.c mp.c psout.c tfmin.c memio.c

include_HEADERS = mplib.h

CTANGLE=ctangle

mp.c: psout.c

mpost.c: mpxout.c

.w.c:
	$(CTANGLE) $< $@

clean::
	$(RM) mp.c psout.c tfmin.c memio.c mplib.h mppsout.h mpmp.h mpxout.c mpxout.h *.o libmplib.a mpost.c mpost

distclean:: clean
	$(RM) Makefile config.h config.status config.log libtool
