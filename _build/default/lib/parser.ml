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
\009\000\011\000\011\000\012\000\012\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\013\000\013\000\013\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\006\000\001\000\001\000\000\000\001\000\
\003\000\002\000\003\000\000\000\002\000\001\000\002\000\004\000\
\003\000\003\000\002\000\003\000\005\000\007\000\005\000\002\000\
\002\000\001\000\003\000\003\000\001\000\001\000\001\000\003\000\
\002\000\002\000\002\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\004\000\000\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\053\000\000\000\001\000\006\000\005\000\003\000\
\000\000\000\000\000\000\000\000\000\000\008\000\010\000\000\000\
\000\000\009\000\012\000\004\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\030\000\014\000\000\000\012\000\
\011\000\000\000\000\000\000\000\013\000\000\000\000\000\000\000\
\026\000\000\000\000\000\024\000\025\000\000\000\019\000\000\000\
\000\000\000\000\000\000\000\000\034\000\033\000\035\000\015\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\017\000\000\000\
\000\000\000\000\018\000\000\000\000\000\000\000\032\000\020\000\
\000\000\000\000\038\000\039\000\040\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\027\000\000\000\
\000\000\016\000\000\000\049\000\000\000\023\000\000\000\000\000\
\022\000"

let yydgoto = "\002\000\
\003\000\004\000\008\000\009\000\013\000\020\000\014\000\021\000\
\037\000\038\000\040\000\041\000\078\000"

let yysindex = "\012\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\009\255\005\255\020\255\049\255\032\255\000\000\000\000\020\255\
\048\255\000\000\000\000\000\000\043\255\058\255\069\255\075\255\
\090\255\096\255\133\000\006\255\000\000\000\000\139\000\000\000\
\000\000\139\000\139\000\139\000\000\000\135\255\108\255\249\254\
\000\000\139\000\139\000\000\000\000\000\103\255\000\000\155\255\
\139\000\139\000\076\000\068\255\000\000\000\000\000\000\000\000\
\139\000\139\000\139\000\139\000\139\000\139\000\139\000\139\000\
\139\000\139\000\139\000\139\000\139\000\139\000\000\000\058\255\
\093\000\110\000\000\000\175\255\145\000\041\255\000\000\000\000\
\128\255\128\255\000\000\000\000\000\000\173\000\159\000\007\255\
\007\255\007\255\007\255\194\000\194\000\145\000\000\000\106\255\
\106\255\000\000\139\000\000\000\117\255\000\000\145\000\106\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\050\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\195\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\119\255\000\000\
\000\000\000\000\000\000\000\000\000\000\115\255\000\000\000\000\
\000\000\055\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\066\255\000\000\000\000\000\000\
\215\255\236\255\000\000\000\000\000\000\193\000\255\254\002\000\
\010\000\030\000\038\000\058\000\062\000\139\255\000\000\000\000\
\000\000\000\000\000\000\000\000\087\255\000\000\085\255\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\107\000\094\000\
\162\255\229\255\000\000\066\000\000\000"

let yytablesize = 479
let yytable = "\048\000\
\005\000\101\000\102\000\051\000\071\000\072\000\053\000\054\000\
\055\000\105\000\048\000\048\000\001\000\048\000\073\000\074\000\
\049\000\010\000\011\000\050\000\012\000\076\000\077\000\048\000\
\057\000\058\000\059\000\060\000\061\000\081\000\082\000\083\000\
\084\000\085\000\086\000\087\000\088\000\089\000\090\000\091\000\
\092\000\093\000\094\000\022\000\016\000\023\000\017\000\024\000\
\025\000\026\000\027\000\028\000\029\000\099\000\030\000\100\000\
\031\000\015\000\032\000\033\000\034\000\035\000\007\000\019\000\
\007\000\036\000\039\000\050\000\022\000\050\000\023\000\103\000\
\024\000\025\000\026\000\027\000\028\000\029\000\051\000\030\000\
\051\000\031\000\042\000\032\000\080\000\034\000\035\000\021\000\
\043\000\021\000\036\000\021\000\021\000\021\000\021\000\021\000\
\021\000\052\000\021\000\052\000\021\000\044\000\021\000\021\000\
\021\000\021\000\022\000\045\000\023\000\021\000\024\000\025\000\
\026\000\027\000\028\000\029\000\050\000\030\000\070\000\031\000\
\104\000\032\000\018\000\034\000\035\000\052\000\031\000\031\000\
\036\000\031\000\029\000\029\000\031\000\031\000\031\000\031\000\
\031\000\095\000\031\000\031\000\031\000\031\000\031\000\031\000\
\031\000\031\000\056\000\059\000\060\000\061\000\028\000\028\000\
\057\000\058\000\059\000\060\000\061\000\000\000\062\000\063\000\
\064\000\065\000\066\000\067\000\068\000\069\000\075\000\000\000\
\000\000\000\000\000\000\000\000\057\000\058\000\059\000\060\000\
\061\000\000\000\062\000\063\000\064\000\065\000\066\000\067\000\
\068\000\069\000\098\000\000\000\000\000\000\000\000\000\000\000\
\057\000\058\000\059\000\060\000\061\000\000\000\062\000\063\000\
\064\000\065\000\066\000\067\000\068\000\069\000\031\000\000\000\
\000\000\000\000\000\000\000\000\031\000\031\000\031\000\031\000\
\031\000\000\000\031\000\031\000\031\000\031\000\031\000\031\000\
\031\000\031\000\036\000\036\000\000\000\036\000\000\000\000\000\
\036\000\036\000\000\000\000\000\000\000\000\000\036\000\036\000\
\036\000\036\000\036\000\036\000\036\000\036\000\000\000\037\000\
\037\000\000\000\037\000\000\000\000\000\037\000\037\000\000\000\
\000\000\006\000\007\000\037\000\037\000\037\000\037\000\037\000\
\037\000\037\000\037\000\000\000\000\000\043\000\043\000\000\000\
\043\000\000\000\000\000\000\000\000\000\044\000\044\000\000\000\
\044\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
\043\000\044\000\044\000\044\000\044\000\044\000\044\000\044\000\
\044\000\045\000\045\000\000\000\045\000\000\000\000\000\000\000\
\000\000\046\000\046\000\000\000\046\000\045\000\045\000\045\000\
\045\000\045\000\045\000\045\000\045\000\046\000\046\000\046\000\
\046\000\046\000\046\000\046\000\046\000\041\000\041\000\000\000\
\041\000\042\000\042\000\000\000\042\000\000\000\000\000\000\000\
\000\000\041\000\041\000\000\000\000\000\042\000\042\000\041\000\
\041\000\000\000\079\000\042\000\042\000\057\000\058\000\059\000\
\060\000\061\000\000\000\062\000\063\000\064\000\065\000\066\000\
\067\000\068\000\069\000\096\000\000\000\000\000\057\000\058\000\
\059\000\060\000\061\000\000\000\062\000\063\000\064\000\065\000\
\066\000\067\000\068\000\069\000\097\000\000\000\000\000\057\000\
\058\000\059\000\060\000\061\000\000\000\062\000\063\000\064\000\
\065\000\066\000\067\000\068\000\069\000\046\000\029\000\000\000\
\047\000\000\000\031\000\046\000\029\000\000\000\034\000\035\000\
\031\000\000\000\000\000\036\000\034\000\035\000\000\000\000\000\
\000\000\036\000\057\000\058\000\059\000\060\000\061\000\000\000\
\062\000\063\000\064\000\065\000\066\000\067\000\068\000\069\000\
\057\000\058\000\059\000\060\000\061\000\000\000\062\000\000\000\
\064\000\065\000\066\000\067\000\068\000\069\000\057\000\058\000\
\059\000\060\000\061\000\000\000\000\000\000\000\064\000\065\000\
\066\000\067\000\068\000\069\000\047\000\047\000\000\000\047\000\
\000\000\000\000\000\000\057\000\058\000\059\000\060\000\061\000\
\047\000\047\000\000\000\064\000\065\000\066\000\067\000"

let yycheck = "\027\000\
\000\000\096\000\097\000\031\000\012\001\013\001\034\000\035\000\
\036\000\104\000\012\001\013\001\001\000\015\001\042\000\043\000\
\011\001\009\001\014\001\014\001\001\001\049\000\050\000\025\001\
\018\001\019\001\020\001\021\001\022\001\057\000\058\000\059\000\
\060\000\061\000\062\000\063\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\001\001\013\001\003\001\015\001\005\001\
\006\001\007\001\008\001\009\001\010\001\013\001\012\001\015\001\
\014\001\009\001\016\001\017\001\018\001\019\001\013\001\016\001\
\015\001\023\001\009\001\013\001\001\001\015\001\003\001\099\000\
\005\001\006\001\007\001\008\001\009\001\010\001\013\001\012\001\
\015\001\014\001\014\001\016\001\017\001\018\001\019\001\001\001\
\014\001\003\001\023\001\005\001\006\001\007\001\008\001\009\001\
\010\001\013\001\012\001\015\001\014\001\012\001\016\001\017\001\
\018\001\019\001\001\001\012\001\003\001\023\001\005\001\006\001\
\007\001\008\001\009\001\010\001\014\001\012\001\011\001\014\001\
\004\001\016\001\016\000\018\001\019\001\032\000\012\001\013\001\
\023\001\015\001\012\001\013\001\018\001\019\001\020\001\021\001\
\022\001\072\000\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\012\001\020\001\021\001\022\001\012\001\013\001\
\018\001\019\001\020\001\021\001\022\001\255\255\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\012\001\255\255\
\255\255\255\255\255\255\255\255\018\001\019\001\020\001\021\001\
\022\001\255\255\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\012\001\255\255\255\255\255\255\255\255\255\255\
\018\001\019\001\020\001\021\001\022\001\255\255\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\012\001\255\255\
\255\255\255\255\255\255\255\255\018\001\019\001\020\001\021\001\
\022\001\255\255\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\012\001\013\001\255\255\015\001\255\255\255\255\
\018\001\019\001\255\255\255\255\255\255\255\255\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\255\255\012\001\
\013\001\255\255\015\001\255\255\255\255\018\001\019\001\255\255\
\255\255\001\001\002\001\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\255\255\255\255\012\001\013\001\255\255\
\015\001\255\255\255\255\255\255\255\255\012\001\013\001\255\255\
\015\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\012\001\013\001\255\255\015\001\255\255\255\255\255\255\
\255\255\012\001\013\001\255\255\015\001\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\012\001\013\001\255\255\
\015\001\012\001\013\001\255\255\015\001\255\255\255\255\255\255\
\255\255\024\001\025\001\255\255\255\255\024\001\025\001\030\001\
\031\001\255\255\015\001\030\001\031\001\018\001\019\001\020\001\
\021\001\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\015\001\255\255\255\255\018\001\019\001\
\020\001\021\001\022\001\255\255\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\031\001\015\001\255\255\255\255\018\001\
\019\001\020\001\021\001\022\001\255\255\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\009\001\010\001\255\255\
\012\001\255\255\014\001\009\001\010\001\255\255\018\001\019\001\
\014\001\255\255\255\255\023\001\018\001\019\001\255\255\255\255\
\255\255\023\001\018\001\019\001\020\001\021\001\022\001\255\255\
\024\001\025\001\026\001\027\001\028\001\029\001\030\001\031\001\
\018\001\019\001\020\001\021\001\022\001\255\255\024\001\255\255\
\026\001\027\001\028\001\029\001\030\001\031\001\018\001\019\001\
\020\001\021\001\022\001\255\255\255\255\255\255\026\001\027\001\
\028\001\029\001\030\001\031\001\012\001\013\001\255\255\015\001\
\255\255\255\255\255\255\018\001\019\001\020\001\021\001\022\001\
\024\001\025\001\255\255\026\001\027\001\028\001\029\001"

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
# 331 "lib/parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "lib/parser.mly"
    ([])
# 337 "lib/parser.ml"
               : 'function_def_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'function_def_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'function_def) in
    Obj.repr(
# 38 "lib/parser.mly"
                                   ( _1 @ [_2] )
# 345 "lib/parser.ml"
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
# 357 "lib/parser.ml"
               : 'function_def))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "lib/parser.mly"
         (Void)
# 363 "lib/parser.ml"
               : 'function_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "lib/parser.mly"
        (Int)
# 369 "lib/parser.ml"
               : 'function_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "lib/parser.mly"
    ([])
# 375 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 51 "lib/parser.mly"
          ([_1])
# 382 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 52 "lib/parser.mly"
                       ( _1 @ [_3] )
# 390 "lib/parser.ml"
               : 'params))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 55 "lib/parser.mly"
           ({ptype = Int; pname = _2})
# 397 "lib/parser.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 58 "lib/parser.mly"
                            ( _2 )
# 404 "lib/parser.ml"
               : 'body))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "lib/parser.mly"
    ([])
# 410 "lib/parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "lib/parser.mly"
                   ( _1 @ [_2] )
# 418 "lib/parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "lib/parser.mly"
         ( Block [] )
# 424 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 66 "lib/parser.mly"
              ( Expr _1 )
# 431 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 67 "lib/parser.mly"
                        ( Assign (_1, _3) )
# 439 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl_list) in
    Obj.repr(
# 69 "lib/parser.mly"
                           ( Block _2 )
# 446 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 70 "lib/parser.mly"
                     ( Return (Some _2) )
# 453 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "lib/parser.mly"
                ( Return None )
# 459 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 72 "lib/parser.mly"
                            ( Block _2 )
# 466 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 73 "lib/parser.mly"
                                            ( If (_3, _5, None) )
# 474 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "lib/parser.mly"
                                         ( If (_3, _5, Some _7) )
# 483 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 75 "lib/parser.mly"
                                  ( While (_3, _5) )
# 491 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "lib/parser.mly"
               ( Break )
# 497 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "lib/parser.mly"
                  ( Continue )
# 503 "lib/parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 81 "lib/parser.mly"
             ( [_1] )
# 510 "lib/parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_decl_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 82 "lib/parser.mly"
                                 ( _1 @ [_3] )
# 518 "lib/parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "lib/parser.mly"
                   ( VarDecl ("int", _1, _3) )
# 526 "lib/parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 87 "lib/parser.mly"
       ( VarDecl ("int", _1, Num 0) )
# 533 "lib/parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 90 "lib/parser.mly"
        ( Num _1 )
# 540 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 91 "lib/parser.mly"
       ( Var _1 )
# 547 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 92 "lib/parser.mly"
                       ( _2 )
# 554 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "lib/parser.mly"
                          ( Neg _2 )
# 561 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "lib/parser.mly"
                         ( _2 )
# 568 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "lib/parser.mly"
             ( Not _2 )
# 575 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "lib/parser.mly"
                  ( Binop (_1, Add, _3) )
# 583 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "lib/parser.mly"
                  ( Binop (_1, Sub, _3) )
# 591 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "lib/parser.mly"
                  ( Binop (_1, Mul, _3) )
# 599 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "lib/parser.mly"
                  ( Binop (_1, Div, _3) )
# 607 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "lib/parser.mly"
                  ( Binop (_1, Mod, _3) )
# 615 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "lib/parser.mly"
                 ( Binop (_1, Eq, _3) )
# 623 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "lib/parser.mly"
                 ( Binop (_1, Ne, _3) )
# 631 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "lib/parser.mly"
                 ( Binop (_1, Lt, _3) )
# 639 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "lib/parser.mly"
                 ( Binop (_1, Gt, _3) )
# 647 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "lib/parser.mly"
                 ( Binop (_1, Le, _3) )
# 655 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "lib/parser.mly"
                 ( Binop (_1, Ge, _3) )
# 663 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "lib/parser.mly"
                  ( Binop (_1, And, _3) )
# 671 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "lib/parser.mly"
                 ( Binop (_1, Or, _3) )
# 679 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args) in
    Obj.repr(
# 113 "lib/parser.mly"
                          ( Call (_1, _3) )
# 687 "lib/parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 116 "lib/parser.mly"
    ([])
# 693 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "lib/parser.mly"
         ([_1])
# 700 "lib/parser.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "lib/parser.mly"
                    ( _1 @ [_3] )
# 708 "lib/parser.ml"
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
