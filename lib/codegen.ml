open Ast

(* 寄存器 *)
let tmp1 = "t0"  (* 临时寄存器1 *)
let tmp2 = "t1"  (* 临时寄存器2 *)
let sp = "sp"    (* 栈指针 *)
let ra = "ra"    (* 返回地址 *)
let a0 = "a0"    (* 参数/返回值寄存器 *)
let fp = "s0"    (* 帧指针 *)

(* 计数器，用于生成唯一标签 *)
let label_count = ref 0
let new_label () =
  incr label_count;
  "L" ^ string_of_int !label_count

(* 代码生成环境 *)
type codegen_env = {
  var_offset: (string * int) list;  (* 变量到栈偏移的映射 *)
  current_offset: int;              (* 当前栈偏移（负数，局部变量）*)
}

(* 初始化环境 *)
let new_env () = { var_offset = []; current_offset = 0 }

(* 添加局部变量到栈（负偏移） *)
let add_var env id =
  let offset = env.current_offset - 4 in
  { var_offset = (id, offset) :: env.var_offset; current_offset = offset }

(* 添加参数到环境（正偏移，从8开始） *)
let add_param env id idx =
  let offset = 8 + idx * 4 in
  { var_offset = (id, offset) :: env.var_offset; current_offset = env.current_offset }

(* 查找变量偏移 *)
let find_var env id =
  try List.assoc id env.var_offset
  with Not_found -> failwith ("未找到变量: " ^ id)

(* 生成表达式代码 *)
let rec gen_expr env oc = function
  | Num n ->
      Printf.fprintf oc "  li %s, %d\n" tmp1 n
  | Var id ->
      let offset = find_var env id in
      Printf.fprintf oc "  lw %s, %d(%s)\n" tmp1 offset fp
  | Neg e ->
      gen_expr env oc e;
      Printf.fprintf oc "  sub %s, zero, %s\n" tmp1 tmp1
  | Not e ->
      gen_expr env oc e;
      Printf.fprintf oc "  seqz %s, %s\n" tmp1 tmp1
  | Binop (e1, op, e2) ->
      gen_expr env oc e1;
      Printf.fprintf oc "  mv %s, %s\n" tmp2 tmp1;
      gen_expr env oc e2;
      (match op with
      | Add -> Printf.fprintf oc "  add %s, %s, %s\n" tmp1 tmp2 tmp1
      | Sub -> Printf.fprintf oc "  sub %s, %s, %s\n" tmp1 tmp2 tmp1
      | Mul -> Printf.fprintf oc "  mul %s, %s, %s\n" tmp1 tmp2 tmp1
      | Div -> Printf.fprintf oc "  div %s, %s, %s\n" tmp1 tmp2 tmp1
      | Mod -> Printf.fprintf oc "  rem %s, %s, %s\n" tmp1 tmp2 tmp1
      | Eq -> Printf.fprintf oc "  xor %s, %s, %s\n  seqz %s, %s\n" tmp1 tmp2 tmp1 tmp1 tmp1
      | Ne -> Printf.fprintf oc "  xor %s, %s, %s\n  snez %s, %s\n" tmp1 tmp2 tmp1 tmp1 tmp1
      | Lt -> Printf.fprintf oc "  slt %s, %s, %s\n" tmp1 tmp2 tmp1
      | Gt -> Printf.fprintf oc "  sgt %s, %s, %s\n" tmp1 tmp2 tmp1
      | Le -> Printf.fprintf oc "  sgt %s, %s, %s\n  xori %s, %s, 1\n" tmp1 tmp2 tmp1 tmp1 tmp1
      | Ge -> Printf.fprintf oc "  slt %s, %s, %s\n  xori %s, %s, 1\n" tmp1 tmp2 tmp1 tmp1 tmp1
      | And ->
          let false_label = new_label () in
          let end_label = new_label () in
          Printf.fprintf oc "  beqz %s, %s\n" tmp2 false_label;
          Printf.fprintf oc "  snez %s, %s\n" tmp1 tmp1;
          Printf.fprintf oc "  j %s\n" end_label;
          Printf.fprintf oc "%s:\n  li %s, 0\n%s:\n" false_label tmp1 end_label
      | Or ->
          let true_label = new_label () in
          let end_label = new_label () in
          Printf.fprintf oc "  bnez %s, %s\n" tmp2 true_label;
          Printf.fprintf oc "  snez %s, %s\n" tmp1 tmp1;
          Printf.fprintf oc "  j %s\n" end_label;
          Printf.fprintf oc "%s:\n  li %s, 1\n%s:\n" true_label tmp1 end_label
      )
  | Call (fname, args) ->
      (* 传递前8个参数到a0~a7，其余压栈 *)
      let n = List.length args in
      List.iteri (fun i arg ->
        gen_expr env oc arg;
        if i < 8 then
          Printf.fprintf oc "  mv a%d, %s\n" i tmp1
        else (
          Printf.fprintf oc "  addi %s, %s, -4\n" sp sp;
          Printf.fprintf oc "  sw %s, 0(%s)\n" tmp1 sp
        )
      ) args;
      Printf.fprintf oc "  call %s\n" fname;
      if n > 8 then
        Printf.fprintf oc "  addi %s, %s, %d\n" sp sp ((n-8)*4);
      Printf.fprintf oc "  mv %s, %s\n" tmp1 a0

(* 生成语句代码 *)
let rec gen_stmt env oc break_label cont_label = function
  | Expr e -> gen_expr env oc e; env
  | Block stmts ->
      List.fold_left (fun env stmt -> gen_stmt env oc break_label cont_label stmt) env stmts
  | If (cond, s1, s2_opt) ->
      let else_label = new_label () in
      let end_label = new_label () in
      gen_expr env oc cond;
      Printf.fprintf oc "  beqz %s, %s\n" tmp1 else_label;
      let env1 = gen_stmt env oc break_label cont_label s1 in
      Printf.fprintf oc "  j %s\n" end_label;
      Printf.fprintf oc "%s:\n" else_label;
      let env2 = match s2_opt with Some s2 -> gen_stmt env1 oc break_label cont_label s2 | None -> env1 in
      Printf.fprintf oc "%s:\n" end_label;
      env2
  | While (cond, s) ->
      let start_label = new_label () in
      let end_label = new_label () in
      Printf.fprintf oc "%s:\n" start_label;
      gen_expr env oc cond;
      Printf.fprintf oc "  beqz %s, %s\n" tmp1 end_label;
      let env' = gen_stmt env oc end_label start_label s in
      Printf.fprintf oc "  j %s\n" start_label;
      Printf.fprintf oc "%s:\n" end_label;
      env'
  | Break ->
      Printf.fprintf oc "  j %s\n" break_label; env
  | Continue ->
      Printf.fprintf oc "  j %s\n" cont_label; env
  | Return None ->
      Printf.fprintf oc "  li %s, 0\n  j __ret_%s\n" a0 a0; env
  | Return (Some e) ->
      gen_expr env oc e;
      Printf.fprintf oc "  mv %s, %s\n  j __ret_%s\n" a0 tmp1 a0; env
  | VarDecl (_, id, e) ->
      let new_env = add_var env id in
      gen_expr env oc e;
      let offset = find_var new_env id in
      Printf.fprintf oc "  sw %s, %d(%s)\n" tmp1 offset fp;
      new_env
  | Assign (id, e) ->
      gen_expr env oc e;
      let offset = find_var env id in
      Printf.fprintf oc "  sw %s, %d(%s)\n" tmp1 offset fp;
      env

(* 生成函数代码 *)
let gen_function oc func =
  (* 参数入环境，正偏移 *)
  let env =
    List.mapi (fun i p -> (i, p)) func.params
    |> List.fold_left (fun env (i, p) -> add_param env p.pname i) (new_env ())
  in
  Printf.fprintf oc "\n%s:\n" func.name;
  (* 计算局部变量空间 *)
  let env_body = gen_stmt env oc "" "" (Block func.body) in
  let stack_size = -env_body.current_offset in
  let total_stack = 16 + stack_size in
  (* prologue *)
  Printf.fprintf oc "  addi %s, %s, -%d\n" sp sp total_stack;
  Printf.fprintf oc "  sw %s, %d(%s)\n" fp (total_stack-4) sp;
  Printf.fprintf oc "  addi %s, %s, %d\n" fp sp total_stack;
  (* 保存前8个参数到fp+8, fp+12... *)
  List.iteri (fun i _ ->
    if i < 8 then
      Printf.fprintf oc "  sw a%d, %d(%s)\n" i (8 + i * 4) fp
  ) func.params;
  (* 生成函数体 *)
  ignore (gen_stmt env oc "" "" (Block func.body));
  (* return标签 *)
  Printf.fprintf oc "__ret_%s:\n" a0;
  (* epilogue *)
  Printf.fprintf oc "  lw %s, %d(%s)\n" fp (total_stack-4) sp;
  Printf.fprintf oc "  addi %s, %s, %d\n" sp sp total_stack;
  Printf.fprintf oc "  ret\n"

(* 生成整个程序 *)
let gen_program oc program =
  Printf.fprintf oc "  .text\n  .globl main\n";
  List.iter (gen_function oc) program