# Public macros for the TeX Live (TL) tree.
# Copyright (C) 2014 Taco Hoekwater <taco@metatex.org>
#
# This file is free software; the copyright holder
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 0

# KPSE_GMP_FLAGS
# -----------------
# Provide the configure options '--with-system-gmp' (if in the TL tree).
#
# Set the make variables GMP_INCLUDES and GMP_LIBS to the CPPFLAGS and
# LIBS required for the `-lgmp' library in libs/gmp/ of the TL tree.
AC_DEFUN([KPSE_GMP_FLAGS],
[_KPSE_LIB_FLAGS([gmp], [gmp], [],
                [-IBLD/libs/gmp/gmp-build], [BLD/libs/gmp/gmp-build/.libs/libgmp.a], [],
                [], [${top_builddir}/../../libs/gmp/gmp-build/gmp.h])[]dnl
]) # KPSE_GMP_FLAGS

# KPSE_GMP_OPTIONS([WITH-SYSTEM])
# ----------------------------------
AC_DEFUN([KPSE_GMP_OPTIONS],
[m4_ifval([$1],
          [AC_ARG_WITH([system-gmp],
                       AS_HELP_STRING([--with-system-gmp],
                                      [use installed gmp headers and library
                                       (requires pkg-config)]))])[]dnl
]) # KPSE_GMP_OPTIONS

# KPSE_GMP_SYSTEM_FLAGS
# ------------------------
AC_DEFUN([KPSE_GMP_SYSTEM_FLAGS],
[AC_REQUIRE([_KPSE_CHECK_PKG_CONFIG])[]dnl
if $PKG_CONFIG gmp; then
  GMP_INCLUDES=`$PKG_CONFIG gmp --cflags`
  GMP_LIBS=`$PKG_CONFIG gmp --libs`
elif test "x$need_gmp:$with_system_gmp" = xyes:yes; then
  AC_MSG_ERROR([did not find gmp])
fi
]) # KPSE_GMP_SYSTEM_FLAGS
