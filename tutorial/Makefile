MAKE=make
MPOST=mpost
LTX=pdflatex
BIB=bibtex

SRC=mpguide.ltx
INCL=$(wildcard *.tex)
MYBIB=mpguide.bib
MPMPS=annulus-1.mps annulus-2.mps annulus-3.mps circles.mps data.mps draw-1.mps draw-2.mps fill.mps label-1.mps label-2.mps parabola.mps
MP=$(patsubst %,%.mp,$(patsubst %.mps,%,$(filter-out -%,$(subst -, -,$(MPMPS)))))
MPLOG=$(patsubst %.mp,%.log,$(MP))
MPMPX=$(patsubst %.mp,%.mpx,$(MP))
RASTPDF=previewer.pdf

BASE=$(patsubst %.ltx,%,$(SRC))
PDF=$(BASE).pdf

.PHONY: clean

$(PDF): $(SRC) $(MYBIB) $(INCL) $(MPMPS) $(RASTPDF)
	$(LTX) $<
	$(BIB) $(BASE)
	$(LTX) $<
	$(LTX) $<

$(RASTPDF): $(patsubst %.pdf,%.png,$(RASTPDF))
	sam2p $< PDF: $@

%.mps: %.mp
	$(MPOST) $<

%.mps:: $(patsubst %,%.mp,$(patsubst %.pdf,%,$(filter-out -%,$(subst -, -,$(MPPDF)))))
	$(MPOST) $(patsubst %,%.mp,$(patsubst %.pdf,%,$(filter-out -%,$(subst -, -,$@))))

clean:
	rm -f $(MPLOG) $(MPMPS) $(MPMPX) $(MPPDF) texnum.mpx
	rm -f $(BASE).aux $(BASE).bbl $(BASE).blg $(BASE).log $(BASE).out
#	rm -f $(PDF) $(RASTPDF)
