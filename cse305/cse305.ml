
open Printf

let interpreter(input, ouput) =
  printf "in:%s out:%s\n" input ouput

let _ =
  interpreter( Sys.argv.(1), Sys.argv.(2) )
