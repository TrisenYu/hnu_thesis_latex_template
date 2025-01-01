MAIN:=thesis
PRO:=proposal
DEMO:=demo
SECT:=sections

# 终于成功换用 pdflatex 了。
COMPILER:=pdflatex
LD_FLAG:=-src -interaction=nonstopmode -shell-escape -file-line-error
AUX_FOLDER:=--aux-directory=
OUT_FOLDER:=--output-directory=
CITATION_GEN:=biber
# DVI2PDF:=dvipdfmx

define tex2pdf
	-$(COMPILER) $(AUX_FOLDER)$(2) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
	-$(CITATION_GEN) "$(2)/$(1)"
	-$(COMPILER) $(AUX_FOLDER)$(2) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
	-$(COMPILER) $(AUX_FOLDER)$(2) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
endef

define switch_and_clean_aux
	latexmk -C -cd $(1)
endef

all: 
	$(call tex2pdf,$(MAIN),.)

# TODO: 不是 thesis.tex 的那两个清不干净
clean:
	-latexmk -C
	-$(call switch_and_clean_aux,./$(DEMO)/)
	-$(call switch_and_clean_aux,./$(PRO)/)
	-$(call switch_and_clean_aux,./$(SECT)/)

pro:
	$(call tex2pdf,$(PRO),./$(PRO))

demo:
	$(call tex2pdf,$(DEMO),./$(DEMO))

.PHONY: all clean pro demo