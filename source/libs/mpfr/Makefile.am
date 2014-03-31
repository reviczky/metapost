## Wrapper Makefile.am to build MPFR for TeX Live.
##
##   Copyright (C) 2014 Taco Hoekwater <taco@metatex.org>
##
##   This file is free software; the copyright holder
##   gives unlimited permission to copy and/or distribute it,
##   with or without modifications, as long as this notice is preserved.
##
ACLOCAL_AMFLAGS = -I ../../m4

## We want to re-distribute the whole MPFR source tree.
EXTRA_DIST = $(MPFR_TREE)

## Patches applied to the original source tree
##
EXTRA_DIST += $(MPFR_TREE)-PATCHES

# in case of an SVN repository
dist-hook:
	rm -rf `find $(distdir) -name .svn`

SUBDIRS = .

if build
all-local: mpfrbuild
else !build
all-local: mpfr-build/Makefile
endif !build

mpfr-build/Makefile:
	$(MKDIR_P) mpfr-build
	@cmd="$(mpfr_config) --with-gmp-include=$(abs_builddir)/../gmp/gmp-build --with-gmp-lib=$(abs_builddir)/../gmp/gmp-build/.libs $(mpfr_build_args)"; \
	(cd mpfr-build && echo "=== configuring in mpfr-build (`pwd`)" && \
	  echo "make: running $(SHELL) $$cmd" && \
	  CONFIG_SHELL=$(SHELL) && export CONFIG_SHELL && \
	  eval $(SHELL) $$cmd)

.PHONY: mpfrbuild check-makeflags

mpfrbuild: mpfr-build/Makefile check-makeflags
	cd mpfr-build && $(MAKE) $(AM_MAKEFLAGS) all

check-makeflags:
	@for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    CFLAGS=* | CPPFLAGS=* | CXXFLAGS=* | LDFLAGS=*) \
	      echo "Sorry, the mpfr build systems disallows \`make $$f'."; \
	      exit 1;; \
	  esac; \
	done

distclean-local:
	rm -rf mpfr-build

if build
check_PROGRAMS = mpfrtest
dist_check_SCRIPTS = mpfr.test
TESTS = mpfr.test
endif build

mpfrtest_SOURCES = mpfrtest.c

# Force Automake to use CXXLD for linking
nodist_EXTRA_mpfrtest_SOURCES = dummy.cxx

# mpfrtest_CPPFLAGS = -Iinclude

LDADD = mpfr-build/.libs/libmpfr.a

# Rebuild
rebuild_prereq =
rebuild_target = mpfrbuild
CLEANFILES =

include $(srcdir)/../../am/rebuild.am

