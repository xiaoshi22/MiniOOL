(* File miniool.ml *)
open Parsing;;
open MinioolAST;;

let lexbuf = Lexing.from_channel stdin in
  try
    print_command (MinioolYACC.prog MinioolLEX.token lexbuf) "START" false;
  with 
    | MinioolLEX.Error ->
      Printf.fprintf stderr "At offset %d: unexpected character.\n%!"(Lexing.lexeme_start lexbuf)
    |Parse_error ->
      Printf.fprintf stderr "At offset %d: syntax error.\n%!"(Lexing.lexeme_start lexbuf)
;;
