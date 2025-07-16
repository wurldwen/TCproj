  .text
  .globl main

main:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  li t0, 5
  sw t0, -4(s0)
  lw t0, -4(s0)
  mv t1, t0
  li t0, 0
  sgt t0, t1, t0
  beqz t0, L1
  li t0, 1
  mv a0, t0
  j .return
  j L2
L1:
L2:
  li t0, 0
  mv a0, t0
  j .return
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 4
  ret
