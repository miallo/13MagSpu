all: Prohaupt.tex
	pdflatex Prohaupt.tex
	bibtex Prohaupt
	pdflatex Prohaupt.tex
	pdflatex Prohaupt.tex
	rm -f Prohaupt.toc Prohaupt.log Prohaupt.aux Prohaupt.bbl Prohaupt.blg
