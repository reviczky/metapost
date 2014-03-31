dnl Process this file with autoconf to produce a configure script.
dnl
dnl   Copyright (C) 2014 Taco Hoekwater <taco@metatex.org>
dnl
dnl   This file is free software; the copyright holder
dnl   gives unlimited permission to copy and/or distribute it,
dnl   with or without modifications, as long as this notice is preserved.
dnl
m4_include([version.ac])[] dnl define gmp_version
AC_INIT([gmp (TeX Live)], gmp_version, [tex-k@tug.org])
AC_PREREQ([2.65])
AC_CONFIG_SRCDIR([gmp-]gmp_version[/gmp-impl.h])
AC_CONFIG_AUX_DIR([../../build-aux])
AC_CONFIG_MACRO_DIR([../../m4])

KPSE_BASIC([gmp])

KPSE_CANONICAL_HOST

AM_CONDITIONAL([build], [test "x$enable_build" != xno])

AM_CONDITIONAL([cross], [test "x$cross_compiling" = xyes])

AC_PROG_CXX
AC_PROG_LN_S

GMP_TREE=[gmp-]gmp_version
AC_SUBST([GMP_TREE])

# Prepare configure arguments for GNU MP.
# Can not share the cache file for various reasons.
gmp_config="'\${abs_srcdir}'/$GMP_TREE/configure --enable-static --disable-shared"
if test "x$cache_file" != x/dev/null; then
  gmp_config="$gmp_config -C"
fi
AC_SUBST([gmp_config])

gmp_build_args="--build=$kpse_build_alias"

eval "set x $ac_configure_args"
shift
for gmp_arg
do
  case $gmp_arg in
  BUILD*=*) gmp_arg=`echo "$gmp_arg" | sed 's/^BUILD//'`; gmp_list=native ;;
  *) gmp_list=build ;;
  esac
  case $gmp_arg in
  CC=* | CFLAGS=* | CPPFLAGS=* | CXX=* | CXXFLAGS=* | LDFLAGS=*) ;;
  *) continue ;;
  esac
  case $gmp_arg in
  *\'*) gmp_arg=`echo "$gmp_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
  esac
  eval gmp_${gmp_list}_args="\"\$gmp_${gmp_list}_args '\$gmp_arg'\""
done
AC_SUBST([gmp_build_args])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
