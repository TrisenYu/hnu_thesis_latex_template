# HNU 本科毕业论文。
FILENAME:=thesis
COMPLIER:=latex 
LD_FLAG:= -src -interaction=nonstopmode -shell-escape -file-line-error
CITATION_GEN:=biber

all: 
	-$(COMPLIER) $(LD_FLAG) $(FILENAME).tex
	-$(CITATION_GEN) "$(FILENAME)"
	-$(COMPLIER) $(LD_FLAG) $(FILENAME).tex
	-dvipdfmx $(FILENAME).dvi

clean:
	latexmk -c

.PHONY: clean