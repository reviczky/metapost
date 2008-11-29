#!/usr/bin/env bash
# $Id: Build,v 1.3 2005/05/08 15:55:26 taco Exp $
# builds new pdftex binaries

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

STRIP=strip
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

# do a configure without all the things we don't need
../src/configure \
            --datadir=$DATADIR  \
            --without-bibtex8   \
            --without-cjkutils  \
            --without-detex     \
            --without-dialog    \
            --without-dtl       \
            --without-dvi2tty   \
            --without-dvidvi    \
            --without-dviljk    \
            --without-dvipdfm   \
            --without-dvipsk    \
            --without-eomega    \
            --without-etex      \
            --without-gsftopk   \
            --without-lacheck   \
            --without-makeindexk\
            --without-musixflx  \
            --without-odvipsk   \
            --without-omega     \
            --without-oxdvik    \
            --without-ps2pkm    \
            --without-seetexk   \
            --without-t1utils   \
            --without-tetex     \
            --without-tex4htk   \
            --without-texinfo   \
            --without-texlive   \
            --without-ttf2pk    \
            --without-tth       \
            --without-xdvik     \
            || exit 1 

# make the binaries
(cd texk/web2c/web2c; $MAKE) || exit 1
(cd texk/web2c; $MAKE ../kpathsea/libkpathsea.la) || exit 1
(cd texk/web2c/lib; $MAKE) || exit 1
(cd texk/web2c; $MAKE mp-programs) || exit 1
# strip them
$STRIP texk/web2c/mpost texk/web2c/dvitomp
# go back
cd ..
# show the results
ls -l build/texk/web2c/mpost build/texk/web2c/dvitomp build/texk/web2c/mp.pool \
      build/texk/web2c/mpware/dmp build/texk/web2c/mpware/makempx \
      build/texk/web2c/mpware/mpto build/texk/web2c/mpware/newer
