let _ =
  for i =1 to Array.length Sys.argv -1 do
  Printf.printf "argv[%i] = %s\n" i Sys.argv.(i);
  let cin = open_in Sys.argv.(i) in
    let lexbuf = Lexing.from_channel cin in
      C_parser.grammar C_lexer.token lexbuf;
  done
