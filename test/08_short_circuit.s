  .text
  .globl main

main:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  li t0, 0
  sw t0, -4(s0)
  li t0, 1
  sw t0, -8(s0)
  lw t0, -4(s0)
  mv t1, t0
  lw t0, -8(s0)
  mv t1, t0
  lw t0, -4(s0)
  div t0, t1, t0
  beqz t1, L3
  snez t0, t0
  j L4
L3:
  li t0, 0
L4:
  beqz t0, L1
  li t0, 1
  mv a0, t0
  j .return
  j L2
L1:
  li t0, 0
  mv a0, t0
  j .return
L2:
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 8
  ret
