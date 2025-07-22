  .text
  .globl main
  li t0, 5
  sw t0, -20(s0)
  li t0, 3
  sw t0, -24(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, -20(s0)
  mv a0, t0
  j main_ret

main:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  li t0, 5
  sw t0, -20(s0)
  li t0, 3
  sw t0, -24(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, -20(s0)
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret
