## Wrapper Makefile.am to build GMP for TeX Live.
##
##   Copyright (C) 2014 Taco Hoekwater <taco@metatex.org>
##
##   This file is free software; the copyright holder
##   gives unlimited permission to copy and/or distribute it,
##   with or without modifications, as long as this notice is preserved.
##
ACLOCAL_AMFLAGS = -I ../../m4

## We want to re-distribute the whole GMP source tree.
EXTRA_DIST = $(GMP_TREE)

## Patches applied to the original source tree
##
EXTRA_DIST += $(GMP_TREE)-PATCHES

# in case of an SVN repository
dist-hook:
	rm -rf `find $(distdir) -name .svn`

SUBDIRS = .

if build
all-local: gmpbuild
else !build
all-local: gmp-build/Makefile
endif !build

gmp-build/Makefile:
	$(MKDIR_P) gmp-build
	@cmd="$(gmp_config) $(gmp_build_args)"; \
	(cd gmp-build && echo "=== configuring in gmp-build (`pwd`)" && \
	  echo "make: running $(SHELL) $$cmd" && \
	  CONFIG_SHELL=$(SHELL) && export CONFIG_SHELL && \
	  eval $(SHELL) $$cmd)

.PHONY: gmpbuild check-makeflags

gmpbuild: gmp-build/Makefile check-makeflags
	cd gmp-build && $(MAKE) $(AM_MAKEFLAGS) all

check-makeflags:
	@for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    CFLAGS=* | CPPFLAGS=* | CXXFLAGS=* | LDFLAGS=*) \
	      echo "Sorry, the gmp build systems disallows \`make $$f'."; \
	      exit 1;; \
	  esac; \
	done

distclean-local:
	rm -rf gmp-build

if build
check_PROGRAMS = gmptest
dist_check_SCRIPTS = gmp.test
TESTS = gmp.test
endif build

gmptest_SOURCES = gmptest.c

# Force Automake to use CXXLD for linking
nodist_EXTRA_gmptest_SOURCES = dummy.cxx

# gmptest_CPPFLAGS = -Iinclude

LDADD = gmp-build/.libs/libgmp.a

# Rebuild
rebuild_prereq =
rebuild_target = gmpbuild
CLEANFILES =

include $(srcdir)/../../am/rebuild.am

