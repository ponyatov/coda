CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

.PHONY: all
all: ./$(MODULE) $(MODULE).ini
	./$^

./$(MODULE): frame.cmo c_lexer.cmo c_parser.cmo main.cmo
	ocamlc -o $@ $^

%.cmi: %.mli
	ocamlc -c $<
%.cmo: %.ml
	ocamlc -c $<

%_lexer.ml: %_lexer.mll
	ocamllex -q $<
%_parser.ml %_parser.mli: %_parser.mly
	ocamlyacc $<
