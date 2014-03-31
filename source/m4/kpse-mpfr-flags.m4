# Public macros for the TeX Live (TL) tree.
# Copyright (C) 2012, 2013 Peter Breitenlohner <tex-live@tug.org>
#
# This file is free software; the copyright holder
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# KPSE_MPFR_FLAGS
# ---------------
# Provide the configure options '--with-system-mpfr' (if in the TL tree).
#
# Set the make variables MPFR_INCLUDES and MPFR_LIBS to the CPPFLAGS and
# LIBS required for the `-lmpfr' library in libs/mpfr/ of the TL tree.
AC_DEFUN([KPSE_MPFR_FLAGS],
[AC_REQUIRE([KPSE_GMP_FLAGS])[]dnl
_KPSE_LIB_FLAGS([mpfr], [mpfr], [],
                 [-ISRC/libs/mpfr/mpfr-3.1.2/src], [BLD/libs/mpfr/mpfr-build/src/.libs/libmpfr.a], [],
                 [], [${top_builddir}/../../libs/mpfr/mpfr/mpfr.h])[]dnl
]) # KPSE_MPFR_FLAGS

# KPSE_MPFR_OPTIONS([WITH-SYSTEM])
# --------------------------------
AC_DEFUN([KPSE_MPFR_OPTIONS],
[m4_ifval([$1],
          [AC_ARG_WITH([system-mpfr],
                       AS_HELP_STRING([--with-system-mpfr],
                                      [use installed mpfr headers and library (requires pkg-config)]))])[]dnl
]) # KPSE_MPFR_OPTIONS

# KPSE_MPFR_SYSTEM_FLAGS
# ----------------------
AC_DEFUN([KPSE_MPFR_SYSTEM_FLAGS],
[AC_REQUIRE([_KPSE_CHECK_PKG_CONFIG])[]dnl
if $PKG_CONFIG mpfr --atleast-version=3.1; then
  MPFR_INCLUDES=`$PKG_CONFIG mpfr --cflags`
  MPFR_LIBS=`$PKG_CONFIG mpfr --libs`
elif test "x$need_mpfr:$with_system_mpfr" = xyes:yes; then
  AC_MSG_ERROR([did not find mpfr-3.1 or better])
fi
]) # KPSE_MPFR_SYSTEM_FLAGS
