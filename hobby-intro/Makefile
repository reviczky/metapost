# Makefile for MetaPost documentation.  Public domain.
# Rules for the groff/troff docs are in TeX Live,
# texmf-dist/doc/metapost/base/Makefile.

latex = latex
pdflatex = pdflatex
dvips = dvips
bibtex = bibtex
mpost = mpost -tex=tex

all: pdf
pdf: mpintro.pdf
ps: mpintro.ps

mpintro.pdf: mpintro.tex mpintro.bib mpintro.mp mpman.mp
	$(mpost) mpintro
	$(mpost) mpman
	$(pdflatex) mpintro
	$(bibtex) mpintro
	$(pdflatex) mpintro
	$(pdflatex) mpintro

mpintro.ps: mpintro.tex mpintro.bib mpintro.mp mpman.mp
	$(mpost) mpintro
	$(mpost) mpman
	$(latex) mpintro
	$(bibtex) mpintro
	$(latex) mpintro
	$(latex) mpintro
	$(dvips) mpintro

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.log *.mpx *.mps
	rm -f *.idx *.ilg *.ind *.toc *.out

distclean: clean
	rm -f mp*.pdf mp*.ps
