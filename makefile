all: pdf

pdf:
	@pandoc --pdf-engine=xelatex --toc -f gfm cv.md --output cv.pdf
