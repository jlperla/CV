.PHONY: clean

all: Output/CV.pdf

res.cls: 
	curl -o $@ -L https://www.ctan.org/tex-archive/macros/latex/contrib/resume/res.cls

Output/CV.pdf: res.cls CV.md CV-templ.tex
	mkdir -p Output
	pandoc --template=CV-templ.tex --pdf-engine=pdflatex CV.md -o $@

Output/%.pdf: %.md
	mkdir -p Output
	pandoc --pdf-engine=pdflatex $< -o $@

clean:
	rm -rf Output
