all: md pdf docx html

md:
	@pip install pyyaml > /dev/null 2>&1 || true
	@python3 generate_cv.py
	@awk '!/\\pagebreak/' cv.md > dist/cv-mdout.md

pdf: md
	@pandoc --standalone --toc -f markdown+smart cv.md --pdf-engine=typst --output dist/cv.pdf
	@pandoc --standalone -f markdown+smart dist/cv-mdout.md --pdf-engine=typst --output dist/cv-np.pdf
	
docx:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output dist/cv.docx
	@pandoc --standalone --self-contained -f markdown+smart dist/cv-mdout.md --output dist/cv-np.docx

html:
	@pandoc --standalone --self-contained --toc -f markdown+smart cv.md --output dist/cv.html