#!/usr/bin/env bash
# $Id$
#
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
#
# OME 20070912: Taken from luatex build.sh:
# try to find gnu make; we need it
MAKE=make;
if make -v 2>&1| grep "GNU Make" >/dev/null
then 
  echo "Your make is a GNU-make; I will use that"
elif gmake -v >/dev/null 2>&1
then
  MAKE=gmake;
  echo "You have a GNU-make installed as gmake; I will use that"
else
  echo "I can't find a GNU-make; I'll try to use make and hope that works." 
  echo "If it doesn't, please install GNU-make."
fi

# this deletes all previous builds. 
# comment out the rm and mkdir if you want to keep them (and uncomment and
# change the $MAKE distclean below)
rm -rf build
mkdir build
cd build
# clean up (uncomment the next line if you have commented out the rm and
# mkdir above)
# $MAKE distclean;
#
# guess the correct datadir

DATADIR=`which kpsewhich > /dev/null && kpsewhich texmf.cnf | sed 's%/texmf.cnf$%%' | sed 's%/web2c$%%' | sed 's%/texmf[^\/]*$%%'`
if test -z "$DATADIR"; then 
  DATADIR=/usr/share
fi
mkdir texk
cd texk
../../src/texk/configure --datadir=$DATADIR || exit 1 

# make the kpathsea library
(cd kpathsea;  $MAKE ../kpathsea/libkpathsea.la) || exit 1

# make ctangle
mkdir web2c/cwebdir
cd web2c/cwebdir
(cp ../../../../src/texk/web2c/cwebdir/* .; $MAKE )|| exit 1 
cd ../..

CTANGLE=../cwebdir/ctangle 
export CTANGLE 

# make the library
mkdir web2c/mpdir
cd web2c/mpdir
(../../../../src/texk/web2c/mpdir/configure --enable-lua=yes; $MAKE )|| exit 1 

# go back
cd ../../../..
# show the results
ls -l build/texk/web2c/mpdir/mpost
#ls -l build/texk/web2c/mpdir/.libs/mplib.so
