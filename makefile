all: pdf

pdf:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.pdf
