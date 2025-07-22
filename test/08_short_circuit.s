  .text
  .globl main
  li t0, 0
  sw t0, -20(s0)
  li t0, 1
  sw t0, -24(s0)
  lw t0, -20(s0)
  beqz t0, L3
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  mv t0, t0
  j L4
L3:
  li t0, 0
L4:
  beqz t0, L1
  li t0, 1
  mv a0, t0
  j main_ret
  j L2
L1:
  li t0, 0
  mv a0, t0
  j main_ret
L2:

main:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  li t0, 0
  sw t0, -20(s0)
  li t0, 1
  sw t0, -24(s0)
  lw t0, -20(s0)
  beqz t0, L7
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  mv t0, t0
  j L8
L7:
  li t0, 0
L8:
  beqz t0, L5
  li t0, 1
  mv a0, t0
  j main_ret
  j L6
L5:
  li t0, 0
  mv a0, t0
  j main_ret
L6:
main_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret
