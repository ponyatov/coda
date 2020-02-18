CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

.PHONY: all
all: ./$(MODULE) $(MODULE).ini
	./$^

./$(MODULE): frame.cmo ini_lexer.cmo ini_parser.cmo ini_main.cmo
	ocamlc -o $@ $^

%_main.cmo: %_main.ml %_parser.cmi %_lexer.cmi
	ocamlc -c $<
%_lexer.cmo: %_lexer.ml %_parser.cmi
	ocamlc -c $<

%.cmi: %.mli
	ocamlc -c $<
%.cmo: %.ml
	ocamlc -c $<

%_lexer.ml: %_lexer.mll
	ocamllex -q $<
%_parser.ml %_parser.mli: %_parser.mly
	ocamlyacc $<
