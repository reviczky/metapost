#!/usr/bin/env bash
#
# Public Domain
#
# new script to build mpost binary
# ----------
# Options:
#       --make      : only make, no make distclean; configure
#       --parallel  : make -j 2 -l 3.0
#       --nostrip   : do not strip binary
#       --mingw     : crosscompile for mingw32 from i-386linux
      

# try to find gnu make; we may need it
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

ONLY_MAKE=FALSE
STRIP_MPOST=TRUE
MINGWCROSS=FALSE
PPCCROSS=FALSE
JOBS_IF_PARALLEL=2
MAX_LOAD_IF_PARALLEL=3.0

while [ "$1" != "" ] ; do
  if [ "$1" = "--make" ] ;
  then ONLY_MAKE=TRUE ;
  elif [ "$1" = "--nostrip" ] ;
  then STRIP_MPOST=FALSE ;
  elif [ "$1" = "--mingw" ] ;
  then MINGWCROSS=TRUE ;
  elif [ "$1" = "--ppc" ] ;
  then PPCCROSS=TRUE ;
  elif [ "$1" = "--parallel" ] ;
  then MAKE="$MAKE -j $JOBS_IF_PARALLEL -l $MAX_LOAD_IF_PARALLEL" ;
  fi ;
  shift ;
done
#
STRIP=strip
MPOSTEXE=mpost

if [ `uname` = "Darwin" ] ; 
then
   export MACOSX_DEPLOYMENT_TARGET=10.4
fi;

B=build
CONFHOST=

if [ "$MINGWCROSS" = "TRUE" ]
then
  B=build-windows
  STRIP=mingw32-strip
  MPOSTEXE=mpost.exe
  CONFHOST="--host=i586-pc-mingw32 --build=i586-linux-gnu "
fi

if [ "$PPCCROSS" = "TRUE" ]
then
  B=ppc
  CFLAGS="-arch ppc $CFLAGS"
  XCFLAGS="-arch ppc $XCFLAGS"
  CXXFLAGS="-arch ppc $CXXFLAGS"
  LDFLAGS="-arch ppc $LDFLAGS" 
  export CFLAGS CXXFLAGS LDFLAGS XCFLAGS  
fi

case `uname` in
  MINGW32*    ) MPOSTEXE=mpost.exe ;;
  CYGWIN*    ) MPOSTEXE=mpost.exe ;;
esac

# ----------
# clean up, if needed
if [ -r "$B"/Makefile -a $ONLY_MAKE = "FALSE" ]
then
  rm -rf "$B"
elif [ ! -r "$B"/Makefile ]
then
    ONLY_MAKE=FALSE
fi
if [ ! -r "$B" ]
then
  mkdir "$B"
fi
#
cd "$B"

if [ "$ONLY_MAKE" = "FALSE" ]
then
../source/configure  $CONFHOST \
    --disable-all-pkgs \
    --disable-shared    \
    --disable-largefile \
    --disable-ptex \
    --enable-mp  \
    --enable-compiler-warnings=max \
    --without-ptexenc \
    --without-system-ptexenc \
    --without-system-kpathsea \
    --without-system-xpdf \
    --without-system-freetype \
    --without-system-freetype2 \
    --without-system-gd \
    --without-system-libpng \
    --without-system-teckit \
    --without-system-zlib \
    --without-system-t1lib \
    --without-system-icu \
    --without-system-graphite \
    --without-system-zziplib \
    --without-mf-x-toolkit --without-x \
    || exit 1 
fi

$MAKE
(cd texk/kpathsea; $MAKE )
(cd texk/web2c; $MAKE $MPOSTEXE )

# go back
cd ..

if [ "$STRIP_MPOST" = "TRUE" ] ;
then
  $STRIP "$B"/texk/web2c/$MPOSTEXE
else
  echo "mpost binary not stripped"
fi

# show the results
ls -l "$B"/texk/web2c/$MPOSTEXE
 
