%{
  open Printf
%}

%token EOF EOL
%token <char> CHAR

%start grammar
%type <unit> grammar
%%

grammar:              {                     }
grammar: grammar EOF  { exit            0   }
grammar: grammar CHAR { printf "<%c> "  $2  }
