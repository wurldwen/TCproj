(* 编译器主程序 *)
open Toyc
open Printf

(* 读取文件内容的函数 *)
let read_file filename =
  let ch = open_in filename in
  let len = in_channel_length ch in
  let content = really_input_string ch len in
  close_in ch;
  content

(* 主函数 *)
let () =
  if Array.length Sys.argv != 2 then begin
    prerr_endline "用法: toycproj <输入文件.tc>";
    exit 1
  end;

  let input_file = Sys.argv.(1) in

  if not (Filename.check_suffix input_file ".tc") then begin
    prerr_endline "错误: 输入文件必须是 .tc 扩展名";
    exit 1
  end;

  try
    let source = read_file input_file in
    printf "[INFO] 成功读取文件: %s\n" input_file;

    let lexbuf = Lexing.from_string source in
    lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = input_file };

    let ast = 
      try Parser.program Lexer.token lexbuf 
      with Parsing.Parse_error ->
        let pos = lexbuf.lex_curr_p in
        let msg = sprintf "语法错误在 %s:%d:%d" 
            pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol) in
        failwith msg
    in
    printf "[INFO] 语法分析完成，生成AST\n";

    (* 语义分析 *)
    Semantic.check_program ast;
    printf "[INFO] 语义分析完成，无错误\n";

    (* 代码生成 *)
    let output_file = (Filename.chop_suffix input_file ".tc") ^ ".s" in
    let oc = open_out output_file in
    Codegen.gen_program oc ast;
    close_out oc;
    printf "[SUCCESS] 编译成功! 输出文件: %s\n" output_file;

  with
  | Lexer.LexicalError msg -> 
    prerr_endline ("词法错误: " ^ msg); exit 1
  | Semantic.Semantic_error msg ->
    prerr_endline ("语义错误: " ^ msg); exit 1
  | Failure msg -> 
    prerr_endline ("错误: " ^ msg); exit 1
  | Sys_error msg -> 
    prerr_endline ("系统错误: " ^ msg); exit 1
  | e -> 
    prerr_endline ("未处理的异常: " ^ Printexc.to_string e); exit 1