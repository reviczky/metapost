#!/bin/sh
CFLAGS="-DCAIRO_NO_MUTEX=1 $CFLAGS"
png_CFLAGS='-I../../../../build/libs/libpng/include'
png_LIBS='../../../../build/libs/libpng/libpng.a ../../../../trunk/build/libs/zlexport png_CFLAGS png_LIBS CFLAGS
cd cairo-1.12.8
./configure \
--disable-silent-rules \
--enable-xlib=no  \
--enable-xcb=no \
--enable-qt=no \
--enable-quartz=no \
--enable-win32=no \
--enable-skia=no \
--enable-os2=no \
--enable-beos=no \
--enable-drm=no \
--enable-gallium=no \
--enable-png=yes \
--enable-gl=no \
--enable-glesv2=no \
--enable-cogl=no \
--enable-directfb=no \
--enable-vg=no \
--enable-egl=no \
--enable-glx=no \
--enable-wgl=no \
--enable-script=no \
--enable-ft=no \
--enable-fc=no \
--enable-ps=no \
--enable-pdf=no \
--enable-svg=no \
--enable-test-surfaces=no \
--enable-tee=no \
--enable-xml=no \
--enable-gobject=no \
--enable-interpreter=no \
--enable-symbol-lookup=no \
--enable-pthread=no \
--enable-shared=no
# disable building test & tools suite ? test suite linking fails because 
# of --enable-shared=no combined with static libpng/zlib
cd ..