# Makefile for MetaPost documentation.  Public domain.
# Rules for the groff/troff docs are in TeX Live,
# texmf-dist/doc/metapost/base/Makefile.

latex = latex
pdflatex = pdflatex
dvips = dvips
bibtex = bibtex
mpost = mpost -tex=tex
mkindex = makeindex -c -s mpman.ist

all: pdf
pdf: mpman.pdf mpgraph.pdf mpboxes.pdf
ps: mpman.ps mpgraph.ps mpboxes.ps

mpboxes.pdf: mpboxes.tex mpboxes.bib mpboxes.mp
	$(mpost) mpboxes
	$(pdflatex) mpboxes
	$(bibtex) mpboxes
	$(pdflatex) mpboxes
	$(mkindex) mpboxes
	$(pdflatex) mpboxes

mpgraph.pdf: mpgraph.tex mpgraph.bib mpgraph.mp
	$(mpost) mpgraph
	$(pdflatex) mpgraph
	$(bibtex) mpgraph
	$(pdflatex) mpgraph
	$(pdflatex) mpgraph

mpman.pdf: mpman.tex mpman-app-legacy.tex mpman-app-mpimport.tex mpman-app-optab.tex mpman-app-refman.tex mpman.bib mpman.ist mpman.mp charts.mp mpman-charts.mp
	$(mpost) mpman
	$(mpost) mpman-charts
	$(pdflatex) mpman
	$(bibtex) mpman
	$(pdflatex) mpman
	$(pdflatex) mpman
	$(mkindex) mpman
	$(pdflatex) mpman

mpboxes.ps: mpboxes.tex mpboxes.bib mpboxes.mp
	$(mpost) mpboxes
	$(latex) mpboxes
	$(bibtex) mpboxes
	$(latex) mpboxes
	$(latex) mpboxes
	$(mkindex) mpboxes
	$(latex) mpboxes
	$(dvips) mpboxes

mpgraph.ps: mpgraph.tex mpgraph.bib mpgraph.mp
	$(mpost) mpgraph
	$(latex) mpgraph
	$(bibtex) mpgraph
	$(latex) mpgraph
	$(latex) mpgraph
	$(dvips) mpgraph

mpman.ps: mpman.tex mpman-app-legacy.tex mpman-app-mpimport.tex mpman-app-optab.tex mpman-app-refman.tex mpman.bib mpman.ist mpman.mp charts.mp mpman-charts.mp
	$(mpost) mpman
	$(mpost) mpman-charts
	$(latex) mpman
	$(bibtex) mpman
	$(latex) mpman
	$(latex) mpman
	$(mkindex) mpman
	$(latex) mpman
	$(dvips) mpman

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.log *.mpx *.mps
	rm -f *.idx *.ilg *.ind *.toc *.out

distclean: clean
	rm -f mp*.pdf mp*.ps
