  .text
  .globl main

add:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  sw a0, 8(s0)
  sw a1, 12(s0)
  lw t0, 8(s0)
  mv t1, t0
  lw t0, 12(s0)
  add t0, t1, t0
  mv a0, t0
  j .return
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 0
  ret

main:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  li t0, 3
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 4
  addi sp, sp, -4
  sw t0, 0(sp)
  jal add
  addi sp, sp, 8
  mv t0, a0
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  sw t0, -4(s0)
  lw t0, -4(s0)
  mv a0, t0
  j .return
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 4
  ret
