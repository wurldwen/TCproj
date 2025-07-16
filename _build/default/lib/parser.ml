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

open Parsing;;
let _ = parse_error;;
# 2 "lib/parser.mly"
  open Ast
# 40 "lib/parser.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* INT *);
  258 (* VOID *);
  259 (* IF *);
  260 (* ELSE *);
  261 (* WHILE *);
  262 (* BREAK *);
  263 (* CONTINUE *);
  264 (* RETURN *);
  267 (* ASSIGN *);
  268 (* SEMI *);
  269 (* COMMA *);
  270 (* LPAREN *);
  271 (* RPAREN *);
  272 (* LBRACE *);
  273 (* RBRACE *);
  274 (* ADD *);
  275 (* SUB *);
  276 (* MUL *);
  277 (* DIV *);
  278 (* MOD *);
  279 (* NOT *);
  280 (* AND *);
  281 (* OR *);
  282 (* LT *);
  283 (* GT *);
  284 (* LE *);
  285 (* GE *);
  286 (* EQ *);
  287 (* NE *);
    0|]

let yytransl_block = [|
  265 (* ID *);
  266 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\004\000\004\000\005\000\005\000\
\005\000\007\000\006\000\008\000\008\000\009\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\012\000\012\000\012\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\006\000\001\000\001\000\000\000\001\000\
\003\000\002\000\003\000\000\000\002\000\001\000\002\000\004\000\
\005\000\003\000\002\000\003\000\005\000\007\000\005\000\002\000\
\002\000\001\000\001\000\003\000\002\000\002\000\003\000\004\000\
\000\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\002\000"

let yydefred = "\000\000\
\002\000\000\000\049\000\000\000\001\000\006\000\005\000\003\000\
\000\000\000\000\000\000\000\000\000\000\008\000\010\000\000\000\
\000\000\009\000\012\000\004\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\026\000\014\000\000\000\012\000\
\011\000\000\000\000\000\013\000\000\000\000\000\000\000\000\000\
\024\000\025\000\000\000\019\000\000\000\000\000\000\000\000\000\
\000\000\029\000\030\000\015\000\036\000\037\000\038\000\039\000\
\040\000\047\000\048\000\043\000\044\000\045\000\046\000\041\000\
\042\000\000\000\000\000\000\000\000\000\018\000\000\000\000\000\
\000\000\028\000\020\000\000\000\000\000\000\000\000\000\016\000\
\000\000\032\000\017\000\000\000\023\000\000\000\000\000\022\000"

let yydgoto = "\002\000\
\003\000\004\000\008\000\009\000\013\000\020\000\014\000\021\000\
\036\000\037\000\066\000\073\000"

let yysindex = "\004\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\001\255\007\255\025\255\028\255\003\255\000\000\000\000\025\255\
\027\255\000\000\000\000\000\000\041\255\043\255\042\255\045\255\
\050\255\063\255\009\000\251\254\000\000\000\000\015\000\000\000\
\000\000\015\000\015\000\000\000\108\255\067\255\015\000\015\000\
\000\000\000\000\080\255\000\000\128\255\015\000\015\000\205\255\
\060\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\015\000\015\000\222\255\242\255\000\000\148\255\021\000\
\009\255\000\000\000\000\021\000\168\255\022\255\022\255\000\000\
\015\000\000\000\000\000\100\255\000\000\021\000\022\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\020\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\188\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\088\255\000\000\000\000\000\000\058\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\077\255\
\000\000\000\000\000\000\002\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\079\255\000\000\084\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\065\000\073\000\
\180\255\229\255\000\000\000\000"

let yytablesize = 308
let yytable = "\045\000\
\005\000\084\000\085\000\048\000\001\000\046\000\050\000\051\000\
\047\000\010\000\088\000\068\000\069\000\031\000\031\000\016\000\
\031\000\017\000\071\000\072\000\011\000\081\000\022\000\082\000\
\023\000\012\000\024\000\025\000\026\000\027\000\028\000\029\000\
\007\000\030\000\007\000\031\000\015\000\032\000\076\000\077\000\
\034\000\022\000\019\000\023\000\035\000\024\000\025\000\026\000\
\027\000\028\000\029\000\038\000\030\000\086\000\031\000\039\000\
\032\000\033\000\040\000\034\000\022\000\041\000\023\000\035\000\
\024\000\025\000\026\000\027\000\028\000\029\000\033\000\030\000\
\033\000\031\000\042\000\032\000\075\000\067\000\034\000\021\000\
\018\000\021\000\035\000\021\000\021\000\021\000\021\000\021\000\
\021\000\034\000\021\000\034\000\021\000\047\000\021\000\021\000\
\035\000\021\000\035\000\027\000\027\000\021\000\027\000\087\000\
\049\000\027\000\027\000\027\000\027\000\027\000\000\000\027\000\
\027\000\027\000\027\000\027\000\027\000\027\000\027\000\052\000\
\000\000\000\000\000\000\000\000\000\000\053\000\054\000\055\000\
\056\000\057\000\000\000\058\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\070\000\000\000\000\000\000\000\000\000\
\000\000\053\000\054\000\055\000\056\000\057\000\000\000\058\000\
\059\000\060\000\061\000\062\000\063\000\064\000\065\000\080\000\
\000\000\000\000\000\000\000\000\000\000\053\000\054\000\055\000\
\056\000\057\000\000\000\058\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\083\000\000\000\000\000\000\000\000\000\
\000\000\053\000\054\000\055\000\056\000\057\000\000\000\058\000\
\059\000\060\000\061\000\062\000\063\000\064\000\065\000\027\000\
\000\000\000\000\000\000\000\000\000\000\027\000\027\000\027\000\
\027\000\027\000\000\000\027\000\027\000\027\000\027\000\027\000\
\027\000\027\000\027\000\074\000\000\000\000\000\053\000\054\000\
\055\000\056\000\057\000\000\000\058\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\078\000\000\000\000\000\053\000\
\054\000\055\000\056\000\057\000\000\000\058\000\059\000\060\000\
\061\000\062\000\063\000\064\000\065\000\000\000\000\000\000\000\
\079\000\006\000\007\000\053\000\054\000\055\000\056\000\057\000\
\000\000\058\000\059\000\060\000\061\000\062\000\063\000\064\000\
\065\000\043\000\029\000\000\000\044\000\000\000\031\000\043\000\
\029\000\000\000\000\000\034\000\031\000\000\000\000\000\035\000\
\000\000\034\000\000\000\000\000\000\000\035\000\053\000\054\000\
\055\000\056\000\057\000\000\000\058\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000"

let yycheck = "\027\000\
\000\000\078\000\079\000\031\000\001\000\011\001\034\000\035\000\
\014\001\009\001\087\000\039\000\040\000\012\001\013\001\013\001\
\015\001\015\001\046\000\047\000\014\001\013\001\001\001\015\001\
\003\001\001\001\005\001\006\001\007\001\008\001\009\001\010\001\
\013\001\012\001\015\001\014\001\009\001\016\001\066\000\067\000\
\019\001\001\001\016\001\003\001\023\001\005\001\006\001\007\001\
\008\001\009\001\010\001\009\001\012\001\081\000\014\001\014\001\
\016\001\017\001\014\001\019\001\001\001\012\001\003\001\023\001\
\005\001\006\001\007\001\008\001\009\001\010\001\013\001\012\001\
\015\001\014\001\012\001\016\001\017\001\011\001\019\001\001\001\
\016\000\003\001\023\001\005\001\006\001\007\001\008\001\009\001\
\010\001\013\001\012\001\015\001\014\001\014\001\016\001\017\001\
\013\001\019\001\015\001\012\001\013\001\023\001\015\001\004\001\
\032\000\018\001\019\001\020\001\021\001\022\001\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\012\001\
\255\255\255\255\255\255\255\255\255\255\018\001\019\001\020\001\
\021\001\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\012\001\255\255\255\255\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\012\001\
\255\255\255\255\255\255\255\255\255\255\018\001\019\001\020\001\
\021\001\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\012\001\255\255\255\255\255\255\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\012\001\
\255\255\255\255\255\255\255\255\255\255\018\001\019\001\020\001\
\021\001\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\015\001\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\255\255\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\031\001\015\001\255\255\255\255\018\001\
\019\001\020\001\021\001\022\001\255\255\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\255\255\255\255\255\255\
\015\001\001\001\002\001\018\001\019\001\020\001\021\001\022\001\
\255\255\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\009\001\010\001\255\255\012\001\255\255\014\001\009\001\
\010\001\255\255\255\255\019\001\014\001\255\255\255\255\023\001\
\255\255\019\001\255\255\255\255\255\255\023\001\018\001\019\001\
\020\001\021\001\022\001\255\255\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\031\001"

let yynames_const = "\
  EOF\000\
  INT\000\
  VOID\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  BREAK\000\
  CONTINUE\000\
  RETURN\000\
  ASSIGN\000\
  SEMI\000\
  COMMA\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  ADD\000\
  SUB\000\
  MUL\000\
  DIV\000\
  MOD\000\
  NOT\000\
  AND\000\
  OR\000\
  LT\000\
  GT\000\
  LE\000\
  GE\000\
  EQ\000\
  NE\000\
  "

let yynames_block = "\
  ID\000\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'function_def_list) in
    Obj.repr(
# 35 "lib/parser.mly"
                          ( _1 )
# 272 "lib/parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "lib/parser.mly"
    ([])
# 278 "lib/parser.ml"
               : 'function_def_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'function_def_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'function_def) in
    Obj.repr(
# 40 "lib/parser.mly"
                                   ( _1 @ [_2] )
# 286 "lib/parser.ml"
               : 'function_def_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'function_type) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'params) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 43 "lib/parser.mly"
                                               (
    {return_type = _1; name = _2; params = _4; body = _6}
  )
# 298 "lib/parser.ml"
               : 'function_def))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "lib/parser.mly"
         (Void)
# 304 "lib/parser.ml"
               : 'function_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "lib/parser.mly"
        (Int)
# 310 "lib/parser.ml"
               : 'function_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "lib/parser.mly"
    ([])
# 316 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 53 "lib/parser.mly"
          ([_1])
# 323 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 54 "lib/parser.mly"
                       ( _1 @ [_3] )
# 331 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "lib/parser.mly"
           ({ptype = Int; pname = _2})
# 338 "lib/parser.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 60 "lib/parser.mly"
                            ( _2 )
# 345 "lib/parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "lib/parser.mly"
    ([])
# 351 "lib/parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "lib/parser.mly"
                   ( _1 @ [_2] )
# 359 "lib/parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "lib/parser.mly"
         ( Block [] )
# 365 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 68 "lib/parser.mly"
              ( Expr _1 )
# 372 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 69 "lib/parser.mly"
                        ( Assign (_1, _3) )
# 380 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 70 "lib/parser.mly"
                            ( VarDecl ("int", _2, _4) )
# 388 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 71 "lib/parser.mly"
                     ( Return (Some _2) )
# 395 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "lib/parser.mly"
                ( Return None )
# 401 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 73 "lib/parser.mly"
                            ( Block _2 )
# 408 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "lib/parser.mly"
                                            ( If (_3, _5, None) )
# 416 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 75 "lib/parser.mly"
                                         ( If (_3, _5, Some _7) )
# 425 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 76 "lib/parser.mly"
                                  ( While (_3, _5) )
# 433 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "lib/parser.mly"
               ( Break )
# 439 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "lib/parser.mly"
                  ( Continue )
# 445 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 81 "lib/parser.mly"
        ( Num _1 )
# 452 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 82 "lib/parser.mly"
       ( Var _1 )
# 459 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 83 "lib/parser.mly"
                       ( _2 )
# 466 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "lib/parser.mly"
                          ( Neg _2 )
# 473 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "lib/parser.mly"
             ( Not _2 )
# 480 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'binop) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "lib/parser.mly"
                    ( Binop (_1, _2, _3) )
# 489 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args) in
    Obj.repr(
# 87 "lib/parser.mly"
                          ( Call (_1, _3) )
# 497 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "lib/parser.mly"
    ([])
# 503 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "lib/parser.mly"
         ([_1])
# 510 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "lib/parser.mly"
                    ( _1 @ [_3] )
# 518 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "lib/parser.mly"
        ( Add )
# 524 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 96 "lib/parser.mly"
        ( Sub )
# 530 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "lib/parser.mly"
        ( Mul )
# 536 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 98 "lib/parser.mly"
        ( Div )
# 542 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 99 "lib/parser.mly"
        ( Mod )
# 548 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 100 "lib/parser.mly"
       ( Eq )
# 554 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 101 "lib/parser.mly"
       ( Ne )
# 560 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "lib/parser.mly"
       ( Lt )
# 566 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "lib/parser.mly"
       ( Gt )
# 572 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "lib/parser.mly"
       ( Le )
# 578 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 105 "lib/parser.mly"
       ( Ge )
# 584 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "lib/parser.mly"
        ( And )
# 590 "lib/parser.ml"
               : 'binop))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "lib/parser.mly"
       ( Or )
# 596 "lib/parser.ml"
               : 'binop))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
;;
