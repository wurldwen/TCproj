  .text
  .globl main

main:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  li t0, 5
  sw t0, -4(s0)
  li t0, 3
  sw t0, -8(s0)
  lw t0, -4(s0)
  mv t1, t0
  lw t0, -8(s0)
  add t0, t1, t0
  sw t0, -4(s0)
  lw t0, -4(s0)
  mv a0, t0
  j .return
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 8
  ret
