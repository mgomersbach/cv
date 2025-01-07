all: md pdf docx html

md:
	@awk '!/\\pagebreak/' cv.md > dist/cv-mdout.md

pdf:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output dist/cv.pdf
	@pandoc --standalone --self-contained -f markdown+smart cv-mdout.md --output dist/cv-np.pdf
	
docx:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output dist/cv.docx
	@pandoc --standalone --self-contained -f markdown+smart cv-mdout.md --output dist/cv-np.docx

html:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output dist/cv.html