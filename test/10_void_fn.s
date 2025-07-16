  .text
  .globl main

print:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  li t0, 1
  sw t0, -4(s0)
  lw t0, -4(s0)
  mv t1, t0
  li t0, 1
  add t0, t1, t0
  sw t0, -4(s0)
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 4
  ret

main:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  jal print
  addi sp, sp, 0
  mv t0, a0
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  li t0, 0
  mv a0, t0
  j .return
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 0
  ret
