dnl Process this file with autoconf to produce a configure script.
dnl
dnl   Copyright (C) 2014 Taco Hoekwater <taco@metatex.org>
dnl
dnl   This file is free software; the copyright holder
dnl   gives unlimited permission to copy and/or distribute it,
dnl   with or without modifications, as long as this notice is preserved.
dnl
m4_include([version.ac])[] dnl define mpfr_version
AC_INIT([mpfr (TeX Live)], mpfr_version, [tex-k@tug.org])
AC_PREREQ([2.65])
AC_CONFIG_SRCDIR([mpfr-]mpfr_version[/src/mpfr.h])
AC_CONFIG_AUX_DIR([../../build-aux])
AC_CONFIG_MACRO_DIR([../../m4])

KPSE_BASIC([mpfr])

KPSE_CANONICAL_HOST

AM_CONDITIONAL([build], [test "x$enable_build" != xno])

AM_CONDITIONAL([cross], [test "x$cross_compiling" = xyes])

AC_PROG_CXX
AC_PROG_LN_S

MPFR_TREE=[mpfr-]mpfr_version
AC_SUBST([MPFR_TREE])

# Prepare configure arguments for GNU MP.
# Can not share the cache file for various reasons.
mpfr_config="'\${abs_srcdir}'/$MPFR_TREE/configure --enable-static --disable-shared"
if test "x$cache_file" != x/dev/null; then
  mpfr_config="$mpfr_config -C"
fi
AC_SUBST([mpfr_config])

mpfr_build_args="--build=$kpse_build_alias"

eval "set x $ac_configure_args"
shift
for mpfr_arg
do
  case $mpfr_arg in
  BUILD*=*) mpfr_arg=`echo "$mpfr_arg" | sed 's/^BUILD//'`; mpfr_list=native ;;
  *) mpfr_list=build ;;
  esac
  case $mpfr_arg in
  CC=* | CFLAGS=* | CPPFLAGS=* | CXX=* | CXXFLAGS=* | LDFLAGS=*) ;;
  *) continue ;;
  esac
  case $mpfr_arg in
  *\'*) mpfr_arg=`echo "$mpfr_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
  esac
  eval mpfr_${mpfr_list}_args="\"\$mpfr_${mpfr_list}_args '\$mpfr_arg'\""
done
AC_SUBST([mpfr_build_args])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
