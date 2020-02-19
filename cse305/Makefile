CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

.PHONY: all
all: $(MODULE).out
$(MODULE).out: ./$(MODULE).ml $(MODULE).in
	ocaml ./$^ $@
