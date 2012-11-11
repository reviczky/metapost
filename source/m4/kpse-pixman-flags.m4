# Public macros for the TeX Live (TL) tree.
# Copyright (C) 2009 Peter Breitenlohner <tex-live@tug.org>
#
# This file is free software; the copyright holder
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 0

# KPSE_PIXMAN_FLAGS
# ---------------
# Provide the configure options '--with-system-pixman' (if in the TL tree),
# '--with-pixman-includes', and '--with-pixman-libdir'.
#
# Set the make variables PIXMAN_INCLUDES and PIXMAN_LIBS to the CPPFLAGS and
# LIBS required for the `-lpixman-1' library in libs/pixman/ of the TL tree.
AC_DEFUN([KPSE_PIXMAN_FLAGS],
[_KPSE_LIB_FLAGS([pixman], [pixman], [],
                 [-IBLD/libs/pixman/pixman], [BLD/libs/pixman/pixman/.libs/libpixman-1.a], [],
                 [], [${top_builddir}/../../libs/pixman/pixman/pixman.h])[]dnl
]) # KPSE_PIXMAN_FLAGS

# KPSE_PIXMAN_OPTIONS([WITH-SYSTEM])
# --------------------------------
AC_DEFUN([KPSE_PIXMAN_OPTIONS], [_KPSE_LIB_OPTIONS([pixman], [$1])])

# KPSE_PIXMAN_SYSTEM_FLAGS
# ----------------------
AC_DEFUN([KPSE_PIXMAN_SYSTEM_FLAGS], [_KPSE_LIB_FLAGS_SYSTEM([pixman], [pixman-1])])
