  .text
  .globl main

fact:
  addi sp, sp, -16
  sw ra, 12(sp)
  sw s0, 8(sp)
  addi s0, sp, 16
  sw a0, 8(s0)
  lw t0, 8(s0)
  mv t1, t0
  li t0, 1
  slt t0, t0, t1
  xori t0, t0, 1
  beqz t0, L1
  li t0, 1
  mv a0, t0
  j .return
  j L2
L1:
  lw t0, 8(s0)
  mv t1, t0
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  lw t0, 8(s0)
  mv t1, t0
  li t0, 1
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  jal fact
  addi sp, sp, 4
  mv t0, a0
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  mul t0, t1, t0
  mv a0, t0
  j .return
L2:
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
  li t0, 5
  addi sp, sp, -4
  sw t0, 0(sp)
  jal fact
  addi sp, sp, 4
  mv t0, a0
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  mv a0, t0
  j .return
.return:
  lw ra, 12(sp)
  lw s0, 8(sp)
  addi sp, sp, 16
  addi sp, sp, 0
  ret
