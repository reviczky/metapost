dnl Process this file with autoconf to produce a configure script.
dnl
dnl   Copyright (C) 2009-2011 Peter Breitenlohner <tex-live@tug.org>
dnl
dnl   This file is free software; the copyright holder
dnl   gives unlimited permission to copy and/or distribute it,
dnl   with or without modifications, as long as this notice is preserved.
dnl
m4_include([version.ac])[] dnl define cairo_version

AC_INIT([cairo for TeX Live], cairo_version, [tex-k@tug.org])
AC_PREREQ([2.63])
AC_CONFIG_SRCDIR([cairo-]cairo_version[/src/cairo.h])
AC_CONFIG_HEADERS(config.h)
AC_CONFIG_AUX_DIR([../../build-aux])
AC_CONFIG_MACRO_DIR([../../m4])

AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE

AC_USE_SYSTEM_EXTENSIONS

AC_DEFINE(CAIRO_NO_MUTEX, 1, [We do not want threading])

AM_CONDITIONAL([build], [test "x$enable_build" != xno])

# Initialize libtool
LT_PREREQ([2.2])
LT_INIT([win32-dll])


# Api documentation
# GTK_DOC_CHECK([1.15],[--flavour no-tmpl])

AC_SYS_LARGEFILE

dnl ===========================================================================
dnl
dnl The order of the includes here is rather important
dnl
m4_include(build/configure.ac.version)        dnl macros setting up various version declares
dnl m4_include(build/configure.ac.tools)  dnl checks for tools we use

AC_PROG_CC
AC_PROG_CPP
AC_PROG_CXX dnl required for BeOS (and cannot be a conditional dependency)
AC_C_INLINE

m4_include(build/configure.ac.features)       dnl macros for backend/feature handling
m4_include(build/configure.ac.warnings)       dnl checks for compiler warning
m4_include(build/configure.ac.system) dnl checks for system functions, headers, libs
dnl m4_include(build/configure.ac.analysis)       dnl checks for analysis tools (lcov, etc)
m4_include(build/configure.ac.noversion) dnl disable builtin libtool versioning
m4_include(build/configure.ac.pthread)  dnl checks for pthreads
AC_CACHE_SAVE

dnl ===========================================================================

AM_CONDITIONAL(CAIRO_HAS_DL, test "x$have_dl" = "xyes")

AM_CONDITIONAL(CAIRO_HAS_DLSYM, test "x$have_dlsym" = "xyes")

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(xlib, Xlib, no, [])

CAIRO_ENABLE_SURFACE_BACKEND(xlib_xrender, Xlib Xrender, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(xcb, XCB, no, [])

CAIRO_ENABLE_FUNCTIONS(xlib_xcb, Xlib/XCB, no, [])

CAIRO_ENABLE_FUNCTIONS(xcb_shm, XCB/SHM, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(qt, Qt, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(quartz, Quartz, no, [])

CAIRO_ENABLE_FONT_BACKEND(quartz_font, Quartz, no, [])

CAIRO_ENABLE_SURFACE_BACKEND(quartz_image, Quartz Image, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(win32, Microsoft Windows, no, [])

CAIRO_ENABLE_FONT_BACKEND(win32_font, Microsoft Windows, no, [])

AM_CONDITIONAL(CAIRO_CAN_TEST_WIN32_PRINTING_SURFACE, test "x$test_win32_printing" = "xyes")

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(skia, Skia, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(os2, OS/2, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(beos, BeOS/Zeta, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(drm, DRM, no, [])

CAIRO_ENABLE_SURFACE_BACKEND(gallium, Gallium3D, no, [])

dnl ===========================================================================

CAIRO_ENABLE_FUNCTIONS(png, PNG, no, [])

dnl ===========================================================================
CAIRO_ENABLE_SURFACE_BACKEND(gl, OpenGL, no, [])

dnl ===========================================================================
CAIRO_ENABLE_SURFACE_BACKEND(glesv2, OpenGLESv2, no, [])

dnl ===========================================================================
CAIRO_ENABLE_SURFACE_BACKEND(cogl, Cogl, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(directfb, directfb, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(vg, OpenVG, no, [])

CAIRO_ENABLE_FUNCTIONS(egl, EGL, no, [])

CAIRO_ENABLE_FUNCTIONS(glx, GLX, no, [])

CAIRO_ENABLE_FUNCTIONS(wgl, WGL, no, [])

dnl ===========================================================================

dnl any2ppm_cs=no
CAIRO_ENABLE_SURFACE_BACKEND(script, script, no, [])

dnl ===========================================================================

CAIRO_ENABLE_FONT_BACKEND(ft, FreeType, no, [])

CAIRO_ENABLE_FONT_BACKEND(fc, Fontconfig, no, [])

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(ps, PostScript, no, [])

dnl ===========================================================================

AM_CONDITIONAL(CAIRO_CAN_TEST_PS_SURFACE, test "x$test_ps" = "xyes")
AM_CONDITIONAL(CAIRO_HAS_SPECTRE, test "x$any2ppm_ps" = "xyes")

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(pdf, PDF, no, [])

dnl ===========================================================================

AM_CONDITIONAL(CAIRO_CAN_TEST_PDF_SURFACE, test "x$test_pdf" = "xyes")

AM_CONDITIONAL(CAIRO_HAS_MULTI_PAGE_SURFACES, test "x$use_ps" = "xyes" -o "x$use_pdf" = "xyes")

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(svg, SVG, no, [])

AM_CONDITIONAL(CAIRO_CAN_TEST_SVG_SURFACE, test "x$test_svg" = "xyes")

dnl ===========================================================================

dnl XXX make this a private feature?
CAIRO_ENABLE(test_surfaces, test surfaces, no)

dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(image, image, always, [
  pixman_CFLAGS='-I../../../../source/libs/pixman/pixman -I../../../../build/libs/pixman/pixman'
  image_CFLAGS=$pixman_CFLAGS
])

dnl if pkg-config --exists 'pixman-1 >= 0.27.1'; then
    AC_DEFINE([HAS_PIXMAN_GLYPHS], 1, [Enable pixman glyph cache])
dnl fi


dnl ===========================================================================

CAIRO_ENABLE_SURFACE_BACKEND(mime, mime, always)
CAIRO_ENABLE_SURFACE_BACKEND(recording, recording, always)
CAIRO_ENABLE_SURFACE_BACKEND(observer, observer, always)
CAIRO_ENABLE_SURFACE_BACKEND(tee, tee, no)
CAIRO_ENABLE_SURFACE_BACKEND(xml, xml, no, [])

dnl ===========================================================================

CAIRO_ENABLE_FONT_BACKEND(user, user, always)

dnl ===========================================================================
dnl
dnl This needs to be last on our list of features so that the pthread libs and flags
dnl gets prefixed in front of everything else in CAIRO_{CFLAGS,LIBS}.
dnl
have_real_pthread=no
have_pthread=no
CAIRO_ENABLE(pthread, pthread, no, [CAIRO_CONFIGURE_PTHREAD])
AM_CONDITIONAL(HAVE_REAL_PTHREAD, test "x$use_pthread" = "xyes" -a "x$have_real_pthread" = "xyes")
AM_CONDITIONAL(HAVE_PTHREAD, test "x$use_pthread" = "xyes")


dnl ===========================================================================
dnl Build gobject integration library

CAIRO_ENABLE_FUNCTIONS(gobject, gobject, no, [])

dnl ===========================================================================
dnl Build the external converter if we have any of the test backends
AM_CONDITIONAL(BUILD_ANY2PPM,
	       test "x$any2ppm_svg" = "xyes" \
	         -o "x$any2ppm_pdf" = "xyes" \
		 -o "x$any2ppm_ps"  = "xyes" \
		 -o "x$any2ppm_cs"  = "xyes")


CAIRO_ENABLE(trace, cairo-trace, no, [])

CAIRO_ENABLE(interpreter, cairo-script-interpreter, no, [])

CAIRO_ENABLE(symbol_lookup, symbol-lookup, no, [])

dnl ===========================================================================

AM_CONDITIONAL(DISABLE_SOME_FLOATING_POINT,
               test "x$disable_some_floating_point" = "xyes")

dnl ===========================================================================

AM_CONDITIONAL(BUILD_CXX, test "x$need_cxx" = "xyes")

dnl ===========================================================================

AM_CONDITIONAL(HAVE_GTK, test "x$have_gtk" = "xyes")

AC_CONFIG_FILES([
Makefile
src/Makefile
])

AC_OUTPUT