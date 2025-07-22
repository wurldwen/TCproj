  .text
  .globl main
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L1
  li t0, 1
  mv a0, t0
  j fact_ret
  j L2
L1:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  call fact
  mv t0, a0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  mv a0, t0
  j fact_ret
L2:

fact:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L3
  li t0, 1
  mv a0, t0
  j fact_ret
  j L4
L3:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  call fact
  mv t0, a0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  mv a0, t0
  j fact_ret
L4:
fact_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret
  li t0, 5
  mv a0, t0
  call fact
  mv t0, a0
  mv a0, t0
  j main_ret

main:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  li t0, 5
  mv a0, t0
  call fact
  mv t0, a0
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret
