# Makefile for MetaPost tutorial.

latex = latex
pdflatex = pdflatex
dvips = dvips
bibtex = bibtex
mpost = mpost -tex=tex

all: pdf
pdf: mpguide.pdf
ps: mpguide.ps

mpguide.pdf: abstract.tex arrows.tex biblio.tex commands.tex compilation.tex conclusion.tex data.tex draw.tex fill.tex graph.tex inclusion.tex intro.tex label.tex mpguide.tex mpguide.bib
	$(pdflatex) mpguide
	$(bibtex) mpguide
	$(pdflatex) mpguide
	$(pdflatex) mpguide

mpguide.ps: abstract.tex arrows.tex biblio.tex commands.tex compilation.tex conclusion.tex data.tex draw.tex fill.tex graph.tex inclusion.tex intro.tex label.tex mpguide.tex mpguide.bib
	$(latex) mpguide
	$(bibtex) mpguide
	$(latex) mpguide
	$(latex) mpguide

clean:
	rm -f *.aux *.bbl *.blg *.dvi *.log *.mpx *.mps
	rm -f *.idx *.ilg *.ind *.toc *.out

distclean: clean
	rm -f mp*.pdf mp*.ps
