open Ast

(* RISC-V32 寄存器名 *)
let zero = "zero"
let sp = "sp"
let ra = "ra"
let fp = "s0"
let a0 = "a0"
let t0 = "t0"
let t1 = "t1"

(* 标签生成器 *)
let label_counter = ref 0
let new_label () =
  incr label_counter;
  "L" ^ string_of_int !label_counter

(* 代码生成环境：变量名->偏移，当前局部变量偏移 *)
type env = {
  var_offset: (string * int) list;
  current_offset: int;
}

let new_env () = { var_offset = []; current_offset = -16 }  (* 局部变量从-16(fp)开始，避免与ra/fp重叠 *)

(* 添加局部变量：负偏移，从-16(fp)开始递减 *)
let add_local_var env name =
  let offset = env.current_offset - 4 in
  { var_offset = (name, offset) :: env.var_offset; current_offset = offset }

(* 添加参数：正偏移，从8开始 *)
let add_param env name idx =
  let offset = 8 + idx * 4 in
  { var_offset = (name, offset) :: env.var_offset; current_offset = env.current_offset }

let find_var env name =
  try List.assoc name env.var_offset
  with Not_found -> failwith ("Undefined variable: " ^ name)

(* 生成表达式代码，结果放 t0 *)
let rec gen_expr env oc = function
  | Num n -> Printf.fprintf oc "  li %s, %d\n" t0 n
  | Var id ->
      let offset = find_var env id in
      Printf.fprintf oc "  lw %s, %d(%s)\n" t0 offset fp
  | Neg e ->
      gen_expr env oc e;
      Printf.fprintf oc "  sub %s, %s, %s\n" t0 zero t0
  | Not e ->
      gen_expr env oc e;
      Printf.fprintf oc "  seqz %s, %s\n" t0 t0
  | Binop (e1, op, e2) ->
      gen_expr env oc e1;
      Printf.fprintf oc "  mv %s, %s\n" t1 t0;
      gen_expr env oc e2;
      (match op with
      | Add -> Printf.fprintf oc "  add %s, %s, %s\n" t0 t1 t0
      | Sub -> Printf.fprintf oc "  sub %s, %s, %s\n" t0 t1 t0
      | Mul -> Printf.fprintf oc "  mul %s, %s, %s\n" t0 t1 t0
      | Div -> Printf.fprintf oc "  div %s, %s, %s\n" t0 t1 t0
      | Mod -> Printf.fprintf oc "  rem %s, %s, %s\n" t0 t1 t0
      | Lt -> Printf.fprintf oc "  slt %s, %s, %s\n" t0 t1 t0
      | Gt -> Printf.fprintf oc "  sgt %s, %s, %s\n" t0 t1 t0
      | Le -> Printf.fprintf oc "  sgt %s, %s, %s\n  xori %s, %s, 1\n" t0 t1 t0 t0 t0
      | Ge -> Printf.fprintf oc "  slt %s, %s, %s\n  xori %s, %s, 1\n" t0 t1 t0 t0 t0
      | Eq -> Printf.fprintf oc "  xor %s, %s, %s\n  seqz %s, %s\n" t0 t1 t0 t0 t0
      | Ne -> Printf.fprintf oc "  xor %s, %s, %s\n  snez %s, %s\n" t0 t1 t0 t0 t0
      | And ->
          let false_label = new_label () in
          let end_label = new_label () in
          Printf.fprintf oc "  beqz %s, %s\n" t1 false_label;
          Printf.fprintf oc "  snez %s, %s\n" t0 t0;
          Printf.fprintf oc "  j %s\n" end_label;
          Printf.fprintf oc "%s:\n  li %s, 0\n%s:\n" false_label t0 end_label
      | Or ->
          let true_label = new_label () in
          let end_label = new_label () in
          Printf.fprintf oc "  bnez %s, %s\n" t1 true_label;
          Printf.fprintf oc "  snez %s, %s\n" t0 t0;
          Printf.fprintf oc "  j %s\n" end_label;
          Printf.fprintf oc "%s:\n  li %s, 1\n%s:\n" true_label t0 end_label
      )
  | Call (fname, args) ->
      (* 传递前8个参数到a0~a7，其余压栈 *)
      let n = List.length args in
      List.iteri (fun i arg ->
        gen_expr env oc arg;
        if i < 8 then
          Printf.fprintf oc "  mv a%d, %s\n" i t0
        else (
          Printf.fprintf oc "  addi %s, %s, -4\n" sp sp;
          Printf.fprintf oc "  sw %s, 0(%s)\n" t0 sp
        )
      ) args;
      Printf.fprintf oc "  call %s\n" fname;
      if n > 8 then
        Printf.fprintf oc "  addi %s, %s, %d\n" sp sp ((n-8)*4);
      Printf.fprintf oc "  mv %s, %s\n" t0 a0

(* 生成语句代码 *)
let rec gen_stmt env oc ret_label break_label cont_label = function
  | Block stmts ->
      let rec aux env = function
        | [] -> env
        | s::ss -> aux (gen_stmt env oc ret_label break_label cont_label s) ss
      in
      let env' = aux env stmts in
      { env with current_offset = env'.current_offset }
  | Expr e -> gen_expr env oc e; env
  | VarDecl (_, id, e) ->
      let new_env = add_local_var env id in
      gen_expr env oc e;
      let offset = find_var new_env id in
      Printf.fprintf oc "  sw %s, %d(%s)\n" t0 offset fp;
      new_env
  | Assign (id, e) ->
      gen_expr env oc e;
      let offset = find_var env id in
      Printf.fprintf oc "  sw %s, %d(%s)\n" t0 offset fp;
      env
  | If (cond, s1, s2_opt) ->
      let else_label = new_label () in
      let end_label = new_label () in
      gen_expr env oc cond;
      Printf.fprintf oc "  beqz %s, %s\n" t0 else_label;
      let env1 = gen_stmt env oc ret_label break_label cont_label s1 in
      Printf.fprintf oc "  j %s\n" end_label;
      Printf.fprintf oc "%s:\n" else_label;
      let env2 = match s2_opt with Some s2 -> gen_stmt env oc ret_label break_label cont_label s2 | None -> env1 in
      Printf.fprintf oc "%s:\n" end_label;
      env2
  | While (cond, s) ->
      let start_label = new_label () in
      let end_label = new_label () in
      Printf.fprintf oc "%s:\n" start_label;
      gen_expr env oc cond;
      Printf.fprintf oc "  beqz %s, %s\n" t0 end_label;
      let env' = gen_stmt env oc ret_label end_label start_label s in
      Printf.fprintf oc "  j %s\n" start_label;
      Printf.fprintf oc "%s:\n" end_label;
      env'
  | Break -> Printf.fprintf oc "  j %s\n" break_label; env
  | Continue -> Printf.fprintf oc "  j %s\n" cont_label; env
  | Return None -> Printf.fprintf oc "  li %s, 0\n  j %s\n" a0 ret_label; env
  | Return (Some e) ->
      gen_expr env oc e;
      Printf.fprintf oc "  mv %s, %s\n  j %s\n" a0 t0 ret_label; env

(* 生成函数代码 *)
let gen_function oc func =
  let ret_label = func.name ^ "_ret" in
  (* 参数入环境，正偏移 *)
  let env =
    List.mapi (fun i p -> (i, p)) func.params
    |> List.fold_left (fun env (i, p) -> add_param env p.pname i) (new_env ())
  in
  (* 计算局部变量空间 *)
  let env_body = gen_stmt env oc ret_label "" "" (Block func.body) in
  let stack_size = -env_body.current_offset in
  let total_stack = 16 + stack_size in
  Printf.fprintf oc "\n%s:\n" func.name;
  (* prologue *)
  Printf.fprintf oc "  addi %s, %s, -%d\n" sp sp total_stack;
  Printf.fprintf oc "  sw %s, %d(%s)\n" ra (total_stack-4) sp;
  Printf.fprintf oc "  sw %s, %d(%s)\n" fp (total_stack-8) sp;
  Printf.fprintf oc "  addi %s, %s, %d\n" fp sp total_stack;
  (* 保存前8个参数到fp+8, fp+12... *)
  List.iteri (fun i _ ->
    if i < 8 then
      Printf.fprintf oc "  sw a%d, %d(%s)\n" i (8 + i * 4) fp
  ) func.params;
  (* 生成函数体 *)
  ignore (gen_stmt env oc ret_label "" "" (Block func.body));
  (* return标签 *)
  Printf.fprintf oc "%s:\n" ret_label;
  (* epilogue *)
  Printf.fprintf oc "  lw %s, %d(%s)\n" ra (total_stack-4) sp;
  Printf.fprintf oc "  lw %s, %d(%s)\n" fp (total_stack-8) sp;
  Printf.fprintf oc "  addi %s, %s, %d\n" sp sp total_stack;
  Printf.fprintf oc "  ret\n"

(* 生成整个程序 *)
let gen_program oc program =
  Printf.fprintf oc "  .text\n  .globl main\n";
  List.iter (gen_function oc) program