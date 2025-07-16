open Ast

(* 寄存器定义 *)
let zero = "zero"
let sp = "sp"    (* 栈指针 *)
let ra = "ra"    (* 返回地址 *)
let a0 = "a0"    (* 返回值寄存器 *)
let t0 = "t0"    (* 临时寄存器0 *)
let t1 = "t1"    (* 临时寄存器1 *)
let fp = "s0"    (* 帧指针 *)

(* 标签计数器 *)
let label_counter = ref 0
let new_label () =
  incr label_counter;
  "L" ^ string_of_int !label_counter

(* 代码生成环境 *)
type env = {
  var_offset: (string * int) list;  (* 变量名 -> 栈偏移 *)
  current_offset: int;              (* 当前栈偏移 *)
  param_count: int;                 (* 参数计数器 *)
}

(* 创建新环境 *)
let new_env () = { 
  var_offset = []; 
  current_offset = 0;  (* 局部变量从-4开始分配，current_offset为负数 *)
  param_count = 0; 
}

(* 添加局部变量到环境 *)
let add_local_var env name =
  let offset = env.current_offset - 4 in
  {
    var_offset = (name, offset) :: env.var_offset;
    current_offset = offset;
    param_count = env.param_count;
  }

(* 添加函数参数到环境 *)
let add_param env name =
  let offset = 8 + env.param_count * 4 in  (* fp+8是第一个参数位置 *)
  {
    var_offset = (name, offset) :: env.var_offset;
    current_offset = env.current_offset;
    param_count = env.param_count + 1;
  }

(* 查找变量偏移量 *)
let find_var env name =
  try List.assoc name env.var_offset
  with Not_found -> failwith ("Undefined variable: " ^ name)

(* 生成表达式代码 *)
let rec gen_expr env oc expr =
  match expr with
  | Num n ->
      Printf.fprintf oc "  li %s, %d\n" t0 n
  | Var id ->
      let offset = find_var env id in
      Printf.fprintf oc "  lw %s, %d(%s)\n" t0 offset fp
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
      | Le -> Printf.fprintf oc "  slt %s, %s, %s\n" t0 t0 t1;
              Printf.fprintf oc "  xori %s, %s, 1\n" t0 t0
      | Ge -> Printf.fprintf oc "  slt %s, %s, %s\n" t0 t0 t1;
              Printf.fprintf oc "  xori %s, %s, 1\n" t0 t0
      | Eq -> Printf.fprintf oc "  xor %s, %s, %s\n" t0 t1 t0;
              Printf.fprintf oc "  seqz %s, %s\n" t0 t0
      | Ne -> Printf.fprintf oc "  xor %s, %s, %s\n" t0 t1 t0;
              Printf.fprintf oc "  snez %s, %s\n" t0 t0
      | And -> 
          let false_label = new_label () in
          let end_label = new_label () in
          Printf.fprintf oc "  beqz %s, %s\n" t1 false_label;
          Printf.fprintf oc "  snez %s, %s\n" t0 t0;  (* Set to 1 if e2 true *)
          Printf.fprintf oc "  j %s\n" end_label;
          Printf.fprintf oc "%s:\n" false_label;
          Printf.fprintf oc "  li %s, 0\n" t0;
          Printf.fprintf oc "%s:\n" end_label
      | Or ->
          let true_label = new_label () in
          let end_label = new_label () in
          Printf.fprintf oc "  bnez %s, %s\n" t1 true_label;
          Printf.fprintf oc "  snez %s, %s\n" t0 t0;  (* Set to 1 if e2 true *)
          Printf.fprintf oc "  j %s\n" end_label;
          Printf.fprintf oc "%s:\n" true_label;
          Printf.fprintf oc "  li %s, 1\n" t0;
          Printf.fprintf oc "%s:\n" end_label)
  | Neg e ->
      gen_expr env oc e;
      Printf.fprintf oc "  sub %s, %s, %s\n" t0 zero t0
  | Not e ->
      gen_expr env oc e;
      Printf.fprintf oc "  seqz %s, %s\n" t0 t0
  | Call (func_name, args) ->
      (* 保存调用者保存的寄存器 *)
      Printf.fprintf oc "  addi %s, %s, -8\n" sp sp;
      Printf.fprintf oc "  sw %s, 0(%s)\n" ra sp;
      Printf.fprintf oc "  sw %s, 4(%s)\n" fp sp;
      
      (* 计算参数并压栈 *)
      List.iter (fun arg ->
        gen_expr env oc arg;
        Printf.fprintf oc "  addi %s, %s, -4\n" sp sp;
        Printf.fprintf oc "  sw %s, 0(%s)\n" t0 sp;
      ) args;
      
      (* 调用函数 *)
      Printf.fprintf oc "  jal %s\n" func_name;
      
      (* 恢复栈指针 *)
      let args_size = List.length args * 4 in
      Printf.fprintf oc "  addi %s, %s, %d\n" sp sp args_size;
      
      (* 恢复寄存器 *)
      Printf.fprintf oc "  mv %s, %s\n" t0 a0;
      Printf.fprintf oc "  lw %s, 0(%s)\n" ra sp;
      Printf.fprintf oc "  lw %s, 4(%s)\n" fp sp;
      Printf.fprintf oc "  addi %s, %s, 8\n" sp sp

(* 生成语句代码 *)
let rec gen_stmt env oc break_label continue_label stmt =
  match stmt with
  | Block stmts ->
      List.fold_left 
        (fun env stmt -> gen_stmt env oc break_label continue_label stmt) 
        env stmts
  | Expr expr -> 
      gen_expr env oc expr; 
      env
  | VarDecl (_, name, expr) ->
      gen_expr env oc expr;
      let new_env = add_local_var env name in
      let offset = find_var new_env name in
      Printf.fprintf oc "  sw %s, %d(%s)\n" t0 offset fp;
      new_env
  | Assign (name, expr) ->
      gen_expr env oc expr;
      let offset = find_var env name in
      Printf.fprintf oc "  sw %s, %d(%s)\n" t0 offset fp;
      env
  | If (cond, then_stmt, else_opt) ->
      let else_label = new_label () in
      let end_label = new_label () in
      
      gen_expr env oc cond;
      Printf.fprintf oc "  beqz %s, %s\n" t0 else_label;
      
      let env_then = gen_stmt env oc break_label continue_label then_stmt in
      Printf.fprintf oc "  j %s\n" end_label;
      Printf.fprintf oc "%s:\n" else_label;
      
      let env_else = match else_opt with
        | Some else_stmt -> gen_stmt env oc break_label continue_label else_stmt
        | None -> env in
      
      Printf.fprintf oc "%s:\n" end_label;
      { env_then with var_offset = env_else.var_offset } (* 合并作用域 *)
  | While (cond, body) ->
      let loop_label = new_label () in
      let break_label' = new_label () in
      let continue_label' = loop_label in
      
      Printf.fprintf oc "%s:\n" loop_label;
      gen_expr env oc cond;
      Printf.fprintf oc "  beqz %s, %s\n" t0 break_label';
      
      let env' = gen_stmt env oc break_label' continue_label' body in
      Printf.fprintf oc "  j %s\n" loop_label;
      Printf.fprintf oc "%s:\n" break_label';
      env'
  | Break -> 
      Printf.fprintf oc "  j %s\n" break_label; 
      env
  | Continue -> 
      Printf.fprintf oc "  j %s\n" continue_label; 
      env
  | Return None -> 
      Printf.fprintf oc "  li %s, 0\n" a0;  (* void 函数默认返回0 *)
      Printf.fprintf oc "  j %s\n" break_label;
      env
  | Return (Some expr) -> 
      gen_expr env oc expr;
      Printf.fprintf oc "  mv %s, %s\n" a0 t0;
      Printf.fprintf oc "  j %s\n" break_label;
      env

(* 生成函数代码 *)
let gen_function oc func =
  (* 初始化环境 *)
  let env = List.fold_left 
      (fun env param -> add_param env param.pname) 
      (new_env ()) 
      func.params in
  
  let return_label = func.name ^ ".return" in

  (* 生成函数体，提前计算局部变量空间 *)
  let env_body = gen_stmt env oc return_label "" (Block func.body) in
  let stack_size = -env_body.current_offset in  (* 计算局部变量空间 *)
  let total_stack = 16 + stack_size in

  Printf.fprintf oc "\n%s:\n" func.name;
  
  (* 函数序言：分配total_stack空间，保存ra/fp到高地址，fp=sp+total_stack=old_sp *)
  Printf.fprintf oc "  addi %s, %s, -%d\n" sp sp total_stack;
  Printf.fprintf oc "  sw %s, %d(%s)\n" ra (total_stack - 4) sp;
  Printf.fprintf oc "  sw %s, %d(%s)\n" fp (total_stack - 8) sp;
  Printf.fprintf oc "  addi %s, %s, %d\n" fp sp total_stack;
  
  (* 保存前8个参数到栈（如有）*)
  List.iteri (fun i _ ->
    if i < 8 then
      Printf.fprintf oc "  sw a%d, %d(%s)\n" i (8 + i * 4) fp
  ) func.params;
  
  (* 生成函数体 *)
  ignore (gen_stmt env oc return_label "" (Block func.body));

  (* 函数返回标签 *)
  Printf.fprintf oc "%s:\n" return_label;
  
  (* 函数尾声：恢复ra/fp，sp加回total_stack *)
  Printf.fprintf oc "  lw %s, %d(%s)\n" ra (total_stack - 4) sp;
  Printf.fprintf oc "  lw %s, %d(%s)\n" fp (total_stack - 8) sp;
  Printf.fprintf oc "  addi %s, %s, %d\n" sp sp total_stack;
  Printf.fprintf oc "  ret\n"

(* 生成整个程序 *)
let gen_program oc program =
  (* 全局初始化 *)
  Printf.fprintf oc "  .text\n";
  Printf.fprintf oc "  .globl main\n";
  
  (* 生成所有函数 *)
  List.iter (gen_function oc) program