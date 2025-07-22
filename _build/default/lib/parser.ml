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
  | ID of (
# 8 "lib/parser.mly"
        string
# 15 "lib/parser.ml"
)
  | NUM of (
# 9 "lib/parser.mly"
        int
# 20 "lib/parser.ml"
)
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

open Parsing
let _ = parse_error;;
# 2 "lib/parser.mly"
  open Ast
# 48 "lib/parser.ml"
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
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\011\000\
\011\000\011\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\006\000\001\000\001\000\000\000\001\000\
\003\000\002\000\003\000\000\000\002\000\001\000\002\000\004\000\
\005\000\003\000\002\000\003\000\005\000\007\000\005\000\002\000\
\002\000\001\000\001\000\003\000\002\000\002\000\002\000\002\000\
\002\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\004\000\000\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\051\000\000\000\001\000\006\000\005\000\003\000\
\000\000\000\000\000\000\000\000\000\000\008\000\010\000\000\000\
\000\000\009\000\012\000\004\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\026\000\014\000\000\000\012\000\
\011\000\000\000\000\000\000\000\013\000\000\000\000\000\000\000\
\000\000\024\000\025\000\000\000\019\000\000\000\000\000\000\000\
\000\000\000\000\031\000\029\000\033\000\015\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\018\000\000\000\
\000\000\000\000\028\000\020\000\000\000\000\000\036\000\037\000\
\038\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\016\000\000\000\047\000\017\000\
\000\000\023\000\000\000\000\000\022\000"

let yydgoto = "\002\000\
\003\000\004\000\008\000\009\000\013\000\020\000\014\000\021\000\
\037\000\038\000\074\000"

let yysindex = "\005\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\003\255\013\255\055\255\060\255\030\255\000\000\000\000\055\255\
\064\255\000\000\000\000\000\000\041\255\077\255\085\255\091\255\
\106\255\108\255\151\000\051\255\000\000\000\000\157\000\000\000\
\000\000\157\000\157\000\157\000\000\000\132\255\117\255\157\000\
\157\000\000\000\000\000\109\255\000\000\152\255\157\000\157\000\
\094\000\065\255\000\000\000\000\000\000\000\000\157\000\157\000\
\157\000\157\000\157\000\157\000\157\000\157\000\157\000\157\000\
\157\000\157\000\157\000\157\000\111\000\128\000\000\000\172\255\
\163\000\039\255\000\000\000\000\252\254\252\254\000\000\000\000\
\000\000\191\000\177\000\004\255\004\255\004\255\004\255\205\000\
\205\000\192\255\103\255\103\255\000\000\157\000\000\000\000\000\
\125\255\000\000\163\000\103\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\048\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\212\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\112\255\000\000\000\000\000\000\063\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\082\255\000\000\000\000\000\000\236\255\002\000\000\000\000\000\
\000\000\232\255\246\254\010\000\030\000\038\000\058\000\066\000\
\080\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\084\255\000\000\101\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\119\000\113\000\
\175\255\229\255\000\000"

let yytablesize = 490
let yytable = "\046\000\
\005\000\046\000\046\000\049\000\046\000\001\000\051\000\052\000\
\053\000\097\000\098\000\010\000\069\000\070\000\046\000\057\000\
\058\000\059\000\101\000\072\000\073\000\055\000\056\000\057\000\
\058\000\059\000\011\000\077\000\078\000\079\000\080\000\081\000\
\082\000\083\000\084\000\085\000\086\000\087\000\088\000\089\000\
\090\000\022\000\016\000\023\000\017\000\024\000\025\000\026\000\
\027\000\028\000\029\000\094\000\030\000\095\000\031\000\012\000\
\032\000\033\000\034\000\035\000\007\000\047\000\007\000\036\000\
\048\000\022\000\099\000\023\000\015\000\024\000\025\000\026\000\
\027\000\028\000\029\000\048\000\030\000\048\000\031\000\019\000\
\032\000\076\000\034\000\035\000\021\000\039\000\021\000\036\000\
\021\000\021\000\021\000\021\000\021\000\021\000\049\000\021\000\
\049\000\021\000\040\000\021\000\021\000\021\000\021\000\022\000\
\041\000\023\000\021\000\024\000\025\000\026\000\027\000\028\000\
\029\000\050\000\030\000\050\000\031\000\042\000\032\000\043\000\
\034\000\035\000\048\000\027\000\027\000\036\000\027\000\068\000\
\100\000\027\000\027\000\027\000\027\000\027\000\018\000\027\000\
\027\000\027\000\027\000\027\000\027\000\027\000\027\000\054\000\
\050\000\000\000\000\000\000\000\000\000\055\000\056\000\057\000\
\058\000\059\000\000\000\060\000\061\000\062\000\063\000\064\000\
\065\000\066\000\067\000\071\000\000\000\000\000\000\000\000\000\
\000\000\055\000\056\000\057\000\058\000\059\000\000\000\060\000\
\061\000\062\000\063\000\064\000\065\000\066\000\067\000\093\000\
\000\000\000\000\000\000\000\000\000\000\055\000\056\000\057\000\
\058\000\059\000\000\000\060\000\061\000\062\000\063\000\064\000\
\065\000\066\000\067\000\096\000\000\000\000\000\000\000\000\000\
\000\000\055\000\056\000\057\000\058\000\059\000\000\000\060\000\
\061\000\062\000\063\000\064\000\065\000\066\000\067\000\027\000\
\000\000\000\000\000\000\000\000\000\000\027\000\027\000\027\000\
\027\000\027\000\000\000\027\000\027\000\027\000\027\000\027\000\
\027\000\027\000\027\000\045\000\045\000\000\000\045\000\034\000\
\034\000\000\000\034\000\000\000\000\000\034\000\034\000\045\000\
\045\000\006\000\007\000\034\000\034\000\034\000\034\000\034\000\
\034\000\034\000\034\000\000\000\000\000\035\000\035\000\000\000\
\035\000\000\000\000\000\035\000\035\000\041\000\041\000\000\000\
\041\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
\035\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
\041\000\042\000\042\000\000\000\042\000\000\000\000\000\000\000\
\000\000\043\000\043\000\000\000\043\000\042\000\042\000\042\000\
\042\000\042\000\042\000\042\000\042\000\043\000\043\000\043\000\
\043\000\043\000\043\000\043\000\043\000\044\000\044\000\000\000\
\044\000\000\000\000\000\000\000\000\000\039\000\039\000\000\000\
\039\000\044\000\044\000\044\000\044\000\044\000\044\000\044\000\
\044\000\039\000\039\000\040\000\040\000\000\000\040\000\039\000\
\039\000\000\000\000\000\000\000\000\000\000\000\000\000\040\000\
\040\000\000\000\000\000\000\000\075\000\040\000\040\000\055\000\
\056\000\057\000\058\000\059\000\000\000\060\000\061\000\062\000\
\063\000\064\000\065\000\066\000\067\000\091\000\000\000\000\000\
\055\000\056\000\057\000\058\000\059\000\000\000\060\000\061\000\
\062\000\063\000\064\000\065\000\066\000\067\000\092\000\000\000\
\000\000\055\000\056\000\057\000\058\000\059\000\000\000\060\000\
\061\000\062\000\063\000\064\000\065\000\066\000\067\000\044\000\
\029\000\000\000\045\000\000\000\031\000\044\000\029\000\000\000\
\034\000\035\000\031\000\000\000\000\000\036\000\034\000\035\000\
\000\000\000\000\000\000\036\000\055\000\056\000\057\000\058\000\
\059\000\000\000\060\000\061\000\062\000\063\000\064\000\065\000\
\066\000\067\000\055\000\056\000\057\000\058\000\059\000\000\000\
\060\000\000\000\062\000\063\000\064\000\065\000\066\000\067\000\
\055\000\056\000\057\000\058\000\059\000\000\000\000\000\000\000\
\062\000\063\000\064\000\065\000\066\000\067\000\055\000\056\000\
\057\000\058\000\059\000\000\000\000\000\000\000\062\000\063\000\
\064\000\065\000"

let yycheck = "\027\000\
\000\000\012\001\013\001\031\000\015\001\001\000\034\000\035\000\
\036\000\091\000\092\000\009\001\040\000\041\000\025\001\020\001\
\021\001\022\001\100\000\047\000\048\000\018\001\019\001\020\001\
\021\001\022\001\014\001\055\000\056\000\057\000\058\000\059\000\
\060\000\061\000\062\000\063\000\064\000\065\000\066\000\067\000\
\068\000\001\001\013\001\003\001\015\001\005\001\006\001\007\001\
\008\001\009\001\010\001\013\001\012\001\015\001\014\001\001\001\
\016\001\017\001\018\001\019\001\013\001\011\001\015\001\023\001\
\014\001\001\001\094\000\003\001\009\001\005\001\006\001\007\001\
\008\001\009\001\010\001\013\001\012\001\015\001\014\001\016\001\
\016\001\017\001\018\001\019\001\001\001\009\001\003\001\023\001\
\005\001\006\001\007\001\008\001\009\001\010\001\013\001\012\001\
\015\001\014\001\014\001\016\001\017\001\018\001\019\001\001\001\
\014\001\003\001\023\001\005\001\006\001\007\001\008\001\009\001\
\010\001\013\001\012\001\015\001\014\001\012\001\016\001\012\001\
\018\001\019\001\014\001\012\001\013\001\023\001\015\001\011\001\
\004\001\018\001\019\001\020\001\021\001\022\001\016\000\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\012\001\
\032\000\255\255\255\255\255\255\255\255\018\001\019\001\020\001\
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
\029\001\030\001\031\001\012\001\013\001\255\255\015\001\012\001\
\013\001\255\255\015\001\255\255\255\255\018\001\019\001\024\001\
\025\001\001\001\002\001\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\255\255\255\255\012\001\013\001\255\255\
\015\001\255\255\255\255\018\001\019\001\012\001\013\001\255\255\
\015\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\012\001\013\001\255\255\015\001\255\255\255\255\255\255\
\255\255\012\001\013\001\255\255\015\001\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\255\255\012\001\013\001\255\255\
\015\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\024\001\025\001\012\001\013\001\255\255\015\001\030\001\
\031\001\255\255\255\255\255\255\255\255\255\255\255\255\024\001\
\025\001\255\255\255\255\255\255\015\001\030\001\031\001\018\001\
\019\001\020\001\021\001\022\001\255\255\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\015\001\255\255\255\255\
\018\001\019\001\020\001\021\001\022\001\255\255\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\015\001\255\255\
\255\255\018\001\019\001\020\001\021\001\022\001\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\009\001\
\010\001\255\255\012\001\255\255\014\001\009\001\010\001\255\255\
\018\001\019\001\014\001\255\255\255\255\023\001\018\001\019\001\
\255\255\255\255\255\255\023\001\018\001\019\001\020\001\021\001\
\022\001\255\255\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\018\001\019\001\020\001\021\001\022\001\255\255\
\024\001\255\255\026\001\027\001\028\001\029\001\030\001\031\001\
\018\001\019\001\020\001\021\001\022\001\255\255\255\255\255\255\
\026\001\027\001\028\001\029\001\030\001\031\001\018\001\019\001\
\020\001\021\001\022\001\255\255\255\255\255\255\026\001\027\001\
\028\001\029\001"

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
# 34 "lib/parser.mly"
                          ( _1 )
# 332 "lib/parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "lib/parser.mly"
    ([])
# 338 "lib/parser.ml"
               : 'function_def_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'function_def_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'function_def) in
    Obj.repr(
# 38 "lib/parser.mly"
                                   ( _1 @ [_2] )
# 346 "lib/parser.ml"
               : 'function_def_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'function_type) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'params) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'body) in
    Obj.repr(
# 41 "lib/parser.mly"
                                               (
    {return_type = _1; name = _2; params = _4; body = _6}
  )
# 358 "lib/parser.ml"
               : 'function_def))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "lib/parser.mly"
         (Void)
# 364 "lib/parser.ml"
               : 'function_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "lib/parser.mly"
        (Int)
# 370 "lib/parser.ml"
               : 'function_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "lib/parser.mly"
    ([])
# 376 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 51 "lib/parser.mly"
          ([_1])
# 383 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 52 "lib/parser.mly"
                       ( _1 @ [_3] )
# 391 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 55 "lib/parser.mly"
           ({ptype = Int; pname = _2})
# 398 "lib/parser.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 58 "lib/parser.mly"
                            ( _2 )
# 405 "lib/parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "lib/parser.mly"
    ([])
# 411 "lib/parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "lib/parser.mly"
                   ( _1 @ [_2] )
# 419 "lib/parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "lib/parser.mly"
         ( Block [] )
# 425 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 66 "lib/parser.mly"
              ( Expr _1 )
# 432 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 67 "lib/parser.mly"
                        ( Assign (_1, _3) )
# 440 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 68 "lib/parser.mly"
                            ( VarDecl ("int", _2, _4) )
# 448 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 69 "lib/parser.mly"
                     ( Return (Some _2) )
# 455 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "lib/parser.mly"
                ( Return None )
# 461 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 71 "lib/parser.mly"
                            ( Block _2 )
# 468 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 72 "lib/parser.mly"
                                            ( If (_3, _5, None) )
# 476 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 73 "lib/parser.mly"
                                         ( If (_3, _5, Some _7) )
# 485 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "lib/parser.mly"
                                  ( While (_3, _5) )
# 493 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "lib/parser.mly"
               ( Break )
# 499 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "lib/parser.mly"
                  ( Continue )
# 505 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 79 "lib/parser.mly"
        ( Num _1 )
# 512 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 80 "lib/parser.mly"
       ( Var _1 )
# 519 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 81 "lib/parser.mly"
                       ( _2 )
# 526 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "lib/parser.mly"
                         ( _2 )
# 533 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "lib/parser.mly"
                          ( Neg _2 )
# 540 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "lib/parser.mly"
                         ( _2 )
# 547 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "lib/parser.mly"
                          ( Neg _2 )
# 554 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "lib/parser.mly"
             ( Not _2 )
# 561 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "lib/parser.mly"
                  ( Binop (_1, Add, _3) )
# 569 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "lib/parser.mly"
                  ( Binop (_1, Sub, _3) )
# 577 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "lib/parser.mly"
                  ( Binop (_1, Mul, _3) )
# 585 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "lib/parser.mly"
                  ( Binop (_1, Div, _3) )
# 593 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "lib/parser.mly"
                  ( Binop (_1, Mod, _3) )
# 601 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "lib/parser.mly"
                 ( Binop (_1, Eq, _3) )
# 609 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "lib/parser.mly"
                 ( Binop (_1, Ne, _3) )
# 617 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "lib/parser.mly"
                 ( Binop (_1, Lt, _3) )
# 625 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "lib/parser.mly"
                 ( Binop (_1, Gt, _3) )
# 633 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "lib/parser.mly"
                 ( Binop (_1, Le, _3) )
# 641 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "lib/parser.mly"
                 ( Binop (_1, Ge, _3) )
# 649 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "lib/parser.mly"
                  ( Binop (_1, And, _3) )
# 657 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "lib/parser.mly"
                 ( Binop (_1, Or, _3) )
# 665 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args) in
    Obj.repr(
# 102 "lib/parser.mly"
                          ( Call (_1, _3) )
# 673 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 105 "lib/parser.mly"
    ([])
# 679 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "lib/parser.mly"
         ([_1])
# 686 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "lib/parser.mly"
                    ( _1 @ [_3] )
# 694 "lib/parser.ml"
               : 'args))
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
