# For installing latest mp over the tetex-3.0 equivalents (mp 0.641)

.PHONY: install install-exec install-mplib

INSTALL := rsync -ptv

# directories where the generated executables are put
edir1 := build/texk/web2c
edir2 := $(edir1)/mpware
# executables to install
execs := $(edir1)/mpost $(edir1)/dvitomp 
execs += $(edir2)/dmp $(edir2)/mpto $(edir2)/newer $(edir2)/makempx

# the "fmtutil-sys --all" might be overkill
install: install-exec install-mplib
	fmtutil-sys --all

install-exec: $(execs)
	$(INSTALL) $^ /usr/bin/
install-mplib:
	$(INSTALL) -r texmf/metapost /usr/share/texmf-tetex/
