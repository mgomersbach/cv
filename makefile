all: pdf docx html

pdf:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.pdf
	
docx:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.docx

html:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.html