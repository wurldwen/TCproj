type token =
  | EOF
  | INT
  | VOID
  | IF
  | ELSE
  | WHILE
  | BREAK
  | CONTINUE
  | RETURN
  | ID of (string)
  | NUM of (int)
  | ASSIGN
  | SEMI
  | COMMA
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | ADD
  | SUB
  | MUL
  | DIV
  | MOD
  | NOT
  | AND
  | OR
  | LT
  | GT
  | LE
  | GE
  | EQ
  | NE

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
