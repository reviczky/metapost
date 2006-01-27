# For installing mp 0.901 over the tetex-3.0 files (mp 0.641)

.PHONY: install install-exec install-pool install-mplib

INSTALL := rsync -ptv

edir1 := metapost-0.901/build/texk/web2c
edir2 := $(edir1)/mpware

install: install-exec install-pool install-mplib
	fmtutil-sys --refresh

install-exec: $(edir1)/mpost $(edir1)/dvitomp $(edir2)/dmp $(edir2)/mpto $(edir2)/newer $(edir2)/makempx
	$(INSTALL) $^ /usr/bin/
install-pool: $(edir1)/mp.pool
	$(INSTALL) $^ /usr/share/texmf/web2c/
install-mplib: 
	$(INSTALL) -r metapost-0.901/texmf/metapost /usr/share/texmf-tetex/
