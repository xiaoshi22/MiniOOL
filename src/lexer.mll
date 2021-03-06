(* File LEX.mll *)
{
open Parser;; (* Type token defined in miniYACC.mli *)
exception Error;;
exception Eof;;
}

rule token = parse
    [' ' '\t'] { token lexbuf } (* skip blanks and tabs*)
  | ['\n' ]         { EOL }
  | "var"           { VAR }
  | "true"          { TRUE }
  | "false"         { FALSE }  
  | "while"         { WHILE }  
  | "if"            { IF }  
  | "else"          { ELSE } 
  | "skip"          { SKIP }
  | "null"          { NULL }
  | "proc"          { PROC }
  | "malloc"        { MALLOC }
  | "atom"          { ATOM }
  | (['A'-'Z'])(['a'-'z'] | ['A'-'Z'] | ['0'-'9'])* as variable
                    { VARIABLE variable }
  | (['a'-'z'])(['a'-'z'] | ['A'-'Z'] | ['0'-'9'])* as field
                    { FIELD field }
  | ['0'-'9']+ as num
                    { NUM (int_of_string num) }
  | ';'             { SEMICOLON }
  | ':'             { COLON }
  | '='             { ASSIGN }
  | '+'             { ADD }
  | '-'             { MINUS }
  | '*'             { TIMES }
  | '/'             { DIV }
  | '{'             { LBRACE }
  | '}'             { RBRACE }
  | '('             { LPAREN }
  | ')'             { RPAREN }
  | "=="            { EQUALTO }
  | '<'             { LESSTHAN }
  | '.'             { DOT }
  | "|||"           { PARALLEL }
  | eof             { raise Eof }
  |_                { raise Error }
  