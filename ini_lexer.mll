{
  open Ini_parser
}

rule token = parse
  | _   as x  { CHAR(x) }
  | eof       { EOF     }
