  .text
  .globl main
  li t0, 5
  sw t0, -20(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L1
  li t0, 1
  mv a0, t0
  j main_ret
  j L2
L1:
L2:
  li t0, 0
  mv a0, t0
  j main_ret

main:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  li t0, 5
  sw t0, -20(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L3
  li t0, 1
  mv a0, t0
  j main_ret
  j L4
L3:
L4:
  li t0, 0
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret
