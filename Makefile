CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

.PHONY: all
all: ./ini $(MODULE).ini
	./$^


.PHONY: clean
clean:
	rm -f $(MODULE) ini cpp *.cm? *.mli *lexer.ml *parser.ml


./%: frame.cmo %_parser.cmo %_lexer.cmo %_main.cmo
	ocamlc -o $@ $^

%_main.cmo: %_main.ml %_parser.cmi %_lexer.cmi
	ocamlc -c $<
%_lexer.cmo: %_lexer.ml %_parser.cmi
	ocamlc -c $<
%_parser.cmo: %_parser.ml %_parser.cmi
	ocamlc -c $<

%.cmi: %.mli
	ocamlc -c $<
%.cmo: %.ml
	ocamlc -c $<

%_lexer.ml: %_lexer.mll
	ocamllex -q $<
%_parser.ml %_parser.mli: %_parser.mly
	ocamlyacc $<



.PHONY: ext
ext:
	# git submodule add https://github.com/ColinShaw/ocaml-v4l.git
	# git submodule add git@bitbucket.org:ponyatov/fpvip.git
	git submodule init
	git submodule update
