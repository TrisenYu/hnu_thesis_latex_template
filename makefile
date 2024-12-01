# HNU 本科毕业论文。
target:=thesis.pdf
src:=thesis.tex
mid_obj:=thesis.dvi
compiler:=latex
ld_flag:= -src -interaction=nonstopmode
citation_aux:=bibtex

all:
	-$(compiler) $(ld_flag) $(src)
	-@$(citation_aux) "thesis"
	-@$(compiler) $(ld_flag) $(src)
	-$(citation_aux) "thesis"
	-@dvipdfm $(mid_obj)
