# HNU 本科毕业论文。
target:=thesis.pdf
src:=thesis.tex
mid_obj:=thesis.dvi
compiler:=latex
ld_flag:= -src -interaction=nonstopmode
citation_aux:=biber

all:
	-$(compiler) $(ld_flag) $(src)
	-@$(citation_aux) "thesis"
	-@$(compiler) $(ld_flag) $(src)
	-@dvipdfm $(mid_obj)
