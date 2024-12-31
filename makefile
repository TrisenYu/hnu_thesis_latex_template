mainfile:=thesis
proposalfile:=proposal
demofile:=demo

COMPILER:=latex
LD_FLAG:=-src -interaction=nonstopmode -shell-escape -file-line-error
CITATION_GEN:=biber
DVI2PDF:=dvipdfmx

define tex2pdf
	-$(COMPILER) $(LD_FLAG) $(1).tex
	-$(CITATION_GEN) "$(1)"
	-$(COMPILER) $(LD_FLAG) $(1).tex
	-$(DVI2PDF) "$(1)"
endef

# 首次编译索引表，则需要 make 两遍。

all: 
	$(call tex2pdf,$(mainfile))

clean:
	latexmk -c

pro:
	$(call tex2pdf,$(proposalfile))

demo:
	$(call tex2pdf,$(demofile))

.PHONY: clean clean report demo