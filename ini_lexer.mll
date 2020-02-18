{
  open Ini_parser
}

rule token = parse
  | '#'[^'\n']*'\n'       { token lexbuf  }
  | ['\r''\n']+           { EOL           }
  | _               as x  { CHAR(x)       }
  | eof                   { EOF           }
