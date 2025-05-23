MAIN:=thesis
DEMO:=demo
SECT:=sections

COMPILER:=pdflatex
LD_FLAG:=-src -shell-escape -file-line-error
OUT_FOLDER:=--output-directory=

# 非 -draftmode 而是 --no-pdf, -draftmode 是 pdflatex 的做法。
# https://tex.stackexchange.com/a/219815
DRAFT_MODE=
ifeq ($(COMPILER), xelatex)
	DRAFT_MODE:=--no-pdf
else
	DRAFT_MODE:=
endif

# TODO!!!
# 要不换成更方便的python生成工具？
LD_FLAG+=-interaction=batchmode
CITATION_GEN:=biber

RM:=rm
ifeq ($(OS),Windows_NT)
	RM=del
endif
# TODO: makeglossaries 不一定总是需要的.
define tex2pdf
	-$(COMPILER) $(OUT_FOLDER)$(2) $(LD_FLAG) $(DRAFT_MODE) $(1).tex
	-cd $(2) && makeglossaries $(1)
	-$(CITATION_GEN) "$(2)/$(1)"
	-$(COMPILER) $(OUT_FOLDER)$(2) $(LD_FLAG) $(DRAFT_MODE) $(1).tex
	-cd $(2) && makeglossaries $(1)
	-$(COMPILER) $(OUT_FOLDER)$(2) $(LD_FLAG) $(DRAFT_MODE) $(1).tex
	-$(COMPILER) $(OUT_FOLDER)$(2) $(LD_FLAG) $(1).tex
endef

define aux_cleaner
	latexmk -C -cd $(1)
endef

define rm_thesis
	$(RM) $(1).aux $(1).bbl $(1).bcf $(1).glg \
          $(1).blg $(1).lof $(1).lot $(1).glo \
          $(1).out $(1).run.xml $(1).gls \
          $(1).toc $(1).log $(1).thm $(1).xdy
endef

define sh_remove
	-cd $(1) && $(call rm_thesis,$(1)) && cd ..
endef

# 注意到谁在前面谁先执行。
## TODO: 直接扫描文件夹内容辅助预检
# phony:=evaluation
# evaluation:
phony:=all
all: 
	$(call tex2pdf,$(MAIN),.)

phony += demo
demo:
	-echo $(OS)
	$(call tex2pdf,$(DEMO),./$(DEMO))

phony += clean
clean:
	-latexmk -C
	-$(call aux_cleaner,./$(SECT)/)
	@$(call sh_remove,$(DEMO))
	@$(call rm_thesis,$(MAIN))

phony += help
help:
	@$(info clean: clean aux-file)
	@$(info all: generate thesis.pdf)
	@$(info demo: generate demo.pdf)
	@$(info os-test: generate demo.pdf on different os)
	@$(info help: description of latent commands)

phony += os-test
os-test:
	-echo $(OS)
	$(call tex2pdf,$(DEMO),./os-test)

.PHONY: $(phony)
.IGNORE: clean
