# HNU 本科毕业论文。
FILENAME:=thesis
COMPLIER:=latex
# TODO: 考虑一下 shell-escape
LD_FLAG:=-src -interaction=nonstopmode -shell-escape -file-line-error
CITATION_GEN:=biber
DVI2PDF:=dvipdfmx

all: 
	-$(COMPLIER) $(LD_FLAG) $(FILENAME).tex
	-$(CITATION_GEN) "$(FILENAME)"
	-$(COMPLIER) $(LD_FLAG) $(FILENAME).tex
	-$(DVI2PDF) "$(FILENAME)"

clean:
	latexmk -c

.PHONY: clean