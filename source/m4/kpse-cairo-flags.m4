# Public macros for the TeX Live (TL) tree.
# Copyright (C) 2009 Peter Breitenlohner <tex-live@tug.org>
#
# This file is free software; the copyright holder
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 0

# KPSE_CAIRO_FLAGS
# ---------------
# Provide the configure options '--with-system-cairo' (if in the TL tree),
# '--with-cairo-includes', and '--with-cairo-libdir'.
#
# Set the make variables CAIRO_INCLUDES and CAIRO_LIBS to the CPPFLAGS and
# LIBS required for the `-lcairo' library in libs/cairo/ of the TL tree.
AC_DEFUN([KPSE_CAIRO_FLAGS],
[_KPSE_LIB_FLAGS([cairo], [cairo], [],
                 [-IBLD/libs/cairo/src -ISRC/libs/cairo/src], [BLD/libs/cairo/src/.libs/libcairo.a], [],
                 [], [${top_builddir}/../../libs/cairo/src/cairo.h])[]dnl
]) # KPSE_CAIRO_FLAGS

# KPSE_CAIRO_OPTIONS([WITH-SYSTEM])
# --------------------------------
AC_DEFUN([KPSE_CAIRO_OPTIONS], [_KPSE_LIB_OPTIONS([cairo], [$1])])

# KPSE_CAIRO_SYSTEM_FLAGS
# ----------------------
AC_DEFUN([KPSE_CAIRO_SYSTEM_FLAGS], [_KPSE_LIB_FLAGS_SYSTEM([cairo], [cairo])])
