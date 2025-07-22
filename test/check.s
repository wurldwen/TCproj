.text
.globl _start
_start:
  call main
  li a7, 93
  mv a0, a0
  ecall

.globl main

main:
  addi sp, sp, -44
  sw ra, 40(sp)
  sw s0, 36(sp)
  addi s0, sp, 44
  li t0, 1
  sw t0, -20(s0)
  li t0, 0
  sw t0, -24(s0)
  li t0, 1
  sw t0, -28(s0)
