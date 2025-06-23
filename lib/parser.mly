(*OCamlyacc实现语法分析器*)
%{
  open Ast
  open Token
%}

%token EOF
%token INT VOID
%token IF ELSE WHILE BREAK CONTINUE RETURN
%token <string> ID
%token <int> NUM
%token ASSIGN SEMI COMMA
%token LPAREN RPAREN LBRACE RBRACE
%token ADD SUB MUL DIV MOD
%token NOT AND OR
%token LT GT LE GE EQ NE

%start program
%type <Ast.program> program

%%
