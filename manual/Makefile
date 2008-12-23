# Makefile for MetaPost documentation.  Public domain.
# Rules for the groff/troff docs are in TeX Live,
# texmf-dist/doc/metapost/base/Makefile.

latex = latex
pdflatex = pdflatex
dvips = dvips
bibtex = bibtex
mpost = mpost -tex=tex

all: pdf
pdf: mpman.pdf mpgraph.pdf mpboxes.pdf grdemo.pdf
ps: mpman.ps mpgraph.ps mpboxes.ps

mpboxes.pdf: mpboxes.tex mpboxes.bib mpboxes.mp
	$(mpost) mpboxes
	$(pdflatex) mpboxes
	$(bibtex) mpboxes
	$(pdflatex) mpboxes
	makeindex -s mpman.ist mpboxes
	$(pdflatex) mpboxes

mpgraph.pdf: mpgraph.tex mpgraph.bib mpgraph.mp
	$(mpost) mpgraph
	$(pdflatex) mpgraph
	$(bibtex) mpgraph
	$(pdflatex) mpgraph
	$(pdflatex) mpgraph

mpman.pdf: mpman.tex mpman-optab.tex mpman.bib mpman.ist mpman.mp
	$(mpost) mpman
	$(pdflatex) mpman
	$(bibtex) mpman
	$(pdflatex) mpman
	$(pdflatex) mpman
	makeindex -s mpman.ist mpman
	$(pdflatex) mpman

mpgraph.ps: mpgraph.tex mpgraph.bib mpgraph.mp
	$(mpost) mpgraph
	$(latex) mpgraph
	$(bibtex) mpgraph
	$(latex) mpgraph
	$(latex) mpgraph
	$(dvips) mpgraph

mpman.ps: mpman.tex mpman-optab.tex mpman.bib mpman.ist mpman.mp
	$(mpost) mpman
	$(latex) mpman
	$(bibtex) mpman
	$(latex) mpman
	$(latex) mpman
	makeindex -s mpman.ist mpman
	$(latex) mpman
	$(dvips) mpman

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.log *.mpx *.mps
	rm -f *.idx *.ilg *.ind *.toc *.out

distclean: clean
	rm -f mp*.pdf mp*.ps
