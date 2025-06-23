(* OCamllex实现词法分析器 *)
{
  open Token
  exception LexicalError of string
}

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let alnum = ['a'-'z' 'A'-'Z' '0'-'9']
let whitespace = [' ' '\t' '\r' '\n']
let newline = '\r' | '\n' | "\r\n"

rule token = parse
  | whitespace+    { token lexbuf }  
  | "//" [^ '\n' ]* { token lexbuf }  (* 跳过单行注释 *)
  | "/*"           { multi_line_comment lexbuf }  (* 处理多行注释 *)
  
  (* 关键字 *)
  | "int"          { INT }
  | "void"         { VOID }
  | "if"           { IF }
  | "else"         { ELSE }
  | "while"        { WHILE }
  | "break"        { BREAK }
  | "continue"     { CONTINUE }
  | "return"       { RETURN }
  
  (* 标识符 *)
  | alpha alnum* as id { ID id }
  
  (* 整数 *)
  | '-'? '0'       { NUM 0 }
  |'-'? ['1'-'9'] digit* as num { NUM (int_of_string num) }
  
  (* 运算符和分隔符 *)
  | '='            { ASSIGN }
  | ';'            { SEMI }
  | ','            { COMMA }
  | '('            { LPAREN }
  | ')'            { RPAREN }
  | '{'            { LBRACE }
  | '}'            { RBRACE }
  | '+'            { ADD }
  | '-'            { SUB }
  | '*'            { MUL }
  | '/'            { DIV }
  | '%'            { MOD }
  | '!'            { NOT }
  | "&&"           { AND }
  | "||"           { OR }
  | "<="           { LE }
  | ">="           { GE }
  | "=="           { EQ }
  | "!="           { NE }
  | '<'            { LT }
  | '>'            { GT }
  
  (* 结束和错误处理 *)
  | eof            { EOF }
  | _ as c         { 
      let msg = Printf.sprintf "Illegal character: %c" c in
      raise (LexicalError msg)
    }

and multi_line_comment = parse
  | "*/"       { token lexbuf }  
  | newline    { multi_line_comment lexbuf }  
  | _          { multi_line_comment lexbuf }  
  | eof        { 
      raise (LexicalError "Unterminated multi-line comment") 
    }