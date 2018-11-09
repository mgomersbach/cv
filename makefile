all: md pdf docx html

md:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv-mdout.md

pdf:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.pdf
	
docx:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.docx

html:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output cv.html