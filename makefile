MAIN:=thesis
PRO:=proposal
DEMO:=demo
SECT:=sections

COMPILER:=pdflatex
LD_FLAG:=-src -interaction=nonstopmode -shell-escape -file-line-error
AUX_FOLDER:=--aux-directory=
OUT_FOLDER:=--output-directory=
CITATION_GEN:=biber
# DVI2PDF:=dvipdfmx

RM:=rm
ifeq ($(OS),Windows_NT)
	RM=del
endif

define tex2pdf
	-$(COMPILER) $(AUX_FOLDER)$(2) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
	-$(CITATION_GEN) "$(2)/$(1)"
	-$(COMPILER) $(AUX_FOLDER)$(2) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
	-$(COMPILER) $(AUX_FOLDER)$(2) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
endef

define aux_cleaner
	latexmk -C -cd $(1)
endef

define sh_remove
	-cd $(1) &&\
    $(RM) $(1).aux $(1).bbl $(1).bcf\
          $(1).blg $(1).lof $(1).lot\
          $(1).out $(1).run.xml\
          $(1).toc $(1).log &&\
    cd ..
endef

# 注意到谁在前面谁先执行。

phony:=all
all: 
	$(call tex2pdf,$(MAIN),.)

phony += pro
pro:
	$(call tex2pdf,$(PRO),./$(PRO))

phony += demo
demo:
	$(call tex2pdf,$(DEMO),./$(DEMO))

phony += clean
clean:
	-latexmk -C
	-$(call aux_cleaner,./$(SECT)/)
	@$(call sh_remove,$(PRO))
	@$(call sh_remove,$(DEMO))

phony += help
help:
	@$(info clean: clean aux-file)
	@$(info all: generate thesis.pdf)
	@$(info pro: generate proposal.pdf)
	@$(info demo: generate demo.pdf)
	@$(info help: description of latent commands)


.PHONY: $(phony)
.IGNORE: clean