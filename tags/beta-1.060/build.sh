#!/usr/bin/env bash
# $Id: Build,v 1.3 2005/05/08 15:55:26 taco Exp $

# builds new metapost binary. 
# this is a temporary hack, it simply copies the source dir to the build dir.
# no mpware support yet, either

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
# do a configure without all the things we don't need
../../src/texk/configure --datadir=$DATADIR || exit 1 

# make the kpathsea library
(cd kpathsea;  $MAKE ../kpathsea/libkpathsea.la) || exit 1

# make the library
mkdir web2c/mpdir
cd web2c/mpdir
(../../../../src/texk/web2c/mpdir/configure; $MAKE )|| exit 1 

# strip them
#STRIP=strip
# $STRIP web2c/mpdir/newmpost
# go back
cd ../../../..
# show the results
ls -l build/texk/web2c/mpdir/mpost
