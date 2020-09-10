.PHONY: clean

all: Output/perla_cv.pdf

res.cls: 
	curl -o $@ -L https://www.ctan.org/tex-archive/macros/latex/contrib/resume/res.cls

Output/perla_cv.pdf: res.cls perla_cv.md CV-templ.tex
	mkdir -p Output
	pandoc --template=CV-templ.tex --pdf-engine=pdflatex perla_cv.md -o $@

Output/%.pdf: %.md
	mkdir -p Output
	pandoc --pdf-engine=pdflatex $< -o $@

clean:
	rm -rf Output
