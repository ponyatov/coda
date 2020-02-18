%{
  open Printf
%}

%token EOF EOL
%token <char> CHAR
%token <string> SYM

%start grammar
%type <unit> grammar
%%

grammar:              {                         }
grammar: grammar EOF  { printf "\n" ; exit 0    }
grammar: grammar EOL  { printf "\n"             }
grammar: grammar CHAR { printf "<%c> "      $2  }
grammar: grammar SYM  { printf "<sym:%s> "  $2  }
