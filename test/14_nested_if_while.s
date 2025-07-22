.text
.globl _start
_start:
  call main
  li a7, 93
  mv a0, a0
  ecall

.globl main

main:
  addi sp, sp, -36
  sw ra, 32(sp)
  sw s0, 28(sp)
  addi s0, sp, 36
  li t0, 0
  sw t0, -20(s0)
L1:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 5
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  beqz t0, L2
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L3
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  j L4
L3:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
L4:
  j L1
L2:
  lw t0, -20(s0)
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret
