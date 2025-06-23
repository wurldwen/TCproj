(*AST*)
type binop = 
  | Add | Sub | Mul | Div | Mod
  | Lt | Gt | Le | Ge | Eq | Ne
  | And | Or

type unop = Neg | Not

type expr =
  | IntLit of int
  | Identifier of string
  | BinOp of binop * expr * expr
  | UnOp of unop * expr
  | Call of string * expr list

type stmt =
  | Block of stmt list
  | EmptyStmt
  | ExprStmt of expr
  | VarDecl of string * expr  (* int id = expr; *)
  | Assign of string * expr   (* id = expr; *)
  | If of expr * stmt * stmt option (* if (expr) stmt [else stmt] *)
  | While of expr * stmt      (* while (expr) stmt *)
  | Break
  | Continue
  | Return of expr option

type param = { ptype: [`Int]; pname: string } 

type func_def = {
  return_type: [`Int | `Void];
  name: string;
  params: param list;
  body: stmt list;
}

type program = func_def list


