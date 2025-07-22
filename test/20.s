.text
.globl _start
_start:
  call main
  li a7, 93
  mv a0, a0
  ecall

.globl main

fibonacci:
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
  beqz t0, L1
  lw t0, 8(s0)
  mv a0, t0
  j fibonacci_ret
  j L2
L1:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  call fibonacci
  mv t0, a0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  call fibonacci
  mv t0, a0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j fibonacci_ret
L2:
fibonacci_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

gcd:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L3
  lw t0, 8(s0)
  mv a0, t0
  j gcd_ret
L3:
  lw t0, 12(s0)
  mv a0, t0
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  mv a1, t0
  call gcd
  mv t0, a0
  mv a0, t0
  j gcd_ret
gcd_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

isPrime:
  addi sp, sp, -36
  sw ra, 32(sp)
  sw s0, 28(sp)
  addi s0, sp, 36
  sw a0, 8(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L4
  li t0, 0
  mv a0, t0
  j isPrime_ret
L4:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L5
  li t0, 1
  mv a0, t0
  j isPrime_ret
L5:
  lw t0, 8(s0)
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
  bnez t0, L7
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
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
  mv t0, t0
  j L8
L7:
  li t0, 1
L8:
  beqz t0, L6
  li t0, 0
  mv a0, t0
  j isPrime_ret
L6:
  li t0, 5
  sw t0, -20(s0)
L9:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L10
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
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
  bnez t0, L12
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
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
  mv t0, t0
  j L13
L12:
  li t0, 1
L13:
  beqz t0, L11
  li t0, 0
  mv a0, t0
  j isPrime_ret
L11:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 6
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  j L9
L10:
  li t0, 1
  mv a0, t0
  j isPrime_ret
isPrime_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret

factorial:
  addi sp, sp, -36
  sw ra, 32(sp)
  sw s0, 28(sp)
  addi s0, sp, 36
  sw a0, 8(s0)
  li t0, 1
  sw t0, -20(s0)
L14:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L15
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -20(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, 8(s0)
  j L14
L15:
  lw t0, -20(s0)
  mv a0, t0
  j factorial_ret
factorial_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret

combination:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L16
  li t0, 0
  mv a0, t0
  j combination_ret
L16:
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  bnez t0, L18
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  mv t0, t0
  j L19
L18:
  li t0, 1
L19:
  beqz t0, L17
  li t0, 1
  mv a0, t0
  j combination_ret
L17:
  lw t0, 8(s0)
  mv a0, t0
  call factorial
  mv t0, a0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  mv a0, t0
  call factorial
  mv t0, a0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  call factorial
  mv t0, a0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  mv a0, t0
  j combination_ret
combination_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

power:
  addi sp, sp, -36
  sw ra, 32(sp)
  sw s0, 28(sp)
  addi s0, sp, 36
  sw a0, 8(s0)
  sw a1, 12(s0)
  li t0, 1
  sw t0, -20(s0)
L20:
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L21
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L22
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -20(s0)
L22:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 8(s0)
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  sw t0, 12(s0)
  j L20
L21:
  lw t0, -20(s0)
  mv a0, t0
  j power_ret
power_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret

complexFunction:
  addi sp, sp, -40
  sw ra, 36(sp)
  sw s0, 32(sp)
  addi s0, sp, 40
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  li t0, 0
  sw t0, -20(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L25
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  mv t0, t0
  j L26
L25:
  li t0, 0
L26:
  seqz t0, t0
  beqz t0, L23
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, -1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -20(s0)
  j L24
L23:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  seqz t0, t0
  bnez t0, L29
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L30
L29:
  li t0, 1
L30:
  beqz t0, L27
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, -2
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -20(s0)
  j L28
L27:
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L35
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  xori t0, t0, 1
  mv t0, t0
  j L36
L35:
  li t0, 0
L36:
  bnez t0, L33
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  mv t0, t0
  j L34
L33:
  li t0, 1
L34:
  beqz t0, L31
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, -3
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -20(s0)
  j L32
L31:
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  bnez t0, L39
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L41
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  mv t0, t0
  j L42
L41:
  li t0, 0
L42:
  mv t0, t0
  j L40
L39:
  li t0, 1
L40:
  beqz t0, L37
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, -4
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -20(s0)
  j L38
L37:
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  bnez t0, L47
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  snez t0, t0
  mv t0, t0
  j L48
L47:
  li t0, 1
L48:
  seqz t0, t0
  beqz t0, L45
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  mv t0, t0
  j L46
L45:
  li t0, 0
L46:
  beqz t0, L43
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, -5
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -20(s0)
  j L44
L43:
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, -6
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -20(s0)
L44:
L38:
L32:
L28:
L24:
  li t0, 0
  sw t0, -24(s0)
L49:
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 10
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  beqz t0, L50
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -24(s0)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
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
  beqz t0, L51
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  j L52
L51:
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L53
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -20(s0)
  j L54
L53:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -20(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 50
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  beqz t0, L55
  j L49
L55:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 100
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L56
  j L50
L56:
L54:
L52:
  j L49
L50:
  lw t0, -20(s0)
  mv a0, t0
  j complexFunction_ret
complexFunction_ret:
  lw ra, 36(sp)
  lw s0, 32(sp)
  addi sp, sp, 40
  ret

shortCircuit:
  addi sp, sp, -36
  sw ra, 32(sp)
  sw s0, 28(sp)
  addi s0, sp, 36
  sw a0, 8(s0)
  sw a1, 12(s0)
  li t0, 0
  sw t0, -20(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L58
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  mv t0, t0
  j L59
L58:
  li t0, 0
L59:
  beqz t0, L57
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 12
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
L57:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  bnez t0, L61
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L62
L61:
  li t0, 1
L62:
  beqz t0, L60
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 30
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
L60:
  lw t0, -20(s0)
  mv a0, t0
  j shortCircuit_ret
shortCircuit_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret

nestedLoopsAndConditions:
  addi sp, sp, -44
  sw ra, 40(sp)
  sw s0, 36(sp)
  addi s0, sp, 44
  sw a0, 8(s0)
  li t0, 0
  sw t0, -20(s0)
  li t0, 0
  sw t0, -24(s0)
L63:
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  beqz t0, L64
  li t0, 0
  sw t0, -28(s0)
L65:
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  beqz t0, L66
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
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
  beqz t0, L67
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -20(s0)
  j L68
L67:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  beqz t0, L69
  li t0, 0
  sw t0, -20(s0)
  j L65
L69:
L68:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1053
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L70
  j L66
L70:
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -28(s0)
  j L65
L66:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 913
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L71
  j L64
L71:
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -24(s0)
  j L63
L64:
  lw t0, -20(s0)
  mv a0, t0
  j nestedLoopsAndConditions_ret
nestedLoopsAndConditions_ret:
  lw ra, 40(sp)
  lw s0, 36(sp)
  addi sp, sp, 44
  ret

func1:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  lw t0, 16(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L72
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  mv a0, t0
  j func1_ret
  j L73
L72:
  lw t0, 8(s0)
  mv a0, t0
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a1, t0
  li t0, 0
  mv a2, t0
  call func1
  mv t0, a0
  mv a0, t0
  j func1_ret
L73:
func1_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

func2:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  lw t0, 12(s0)
  beqz t0, L74
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  mv a0, t0
  li t0, 0
  mv a1, t0
  call func2
  mv t0, a0
  mv a0, t0
  j func2_ret
  j L75
L74:
  lw t0, 8(s0)
  mv a0, t0
  j func2_ret
L75:
func2_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

func3:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  lw t0, 12(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L76
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j func3_ret
  j L77
L76:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  li t0, 0
  mv a1, t0
  call func3
  mv t0, a0
  mv a0, t0
  j func3_ret
L77:
func3_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

func4:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  lw t0, 8(s0)
  beqz t0, L78
  lw t0, 12(s0)
  mv a0, t0
  j func4_ret
  j L79
L78:
  lw t0, 16(s0)
  mv a0, t0
  j func4_ret
L79:
func4_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

func5:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  lw t0, 8(s0)
  mv a0, t0
  j func5_ret
func5_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

func6:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  lw t0, 8(s0)
  beqz t0, L82
  lw t0, 12(s0)
  mv t0, t0
  j L83
L82:
  li t0, 0
L83:
  beqz t0, L80
  li t0, 1
  mv a0, t0
  j func6_ret
  j L81
L80:
  li t0, 0
  mv a0, t0
  j func6_ret
L81:
func6_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

func7:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  lw t0, 8(s0)
  seqz t0, t0
  beqz t0, L84
  li t0, 1
  mv a0, t0
  j func7_ret
  j L85
L84:
  li t0, 0
  mv a0, t0
  j func7_ret
L85:
func7_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

nestedCalls:
  addi sp, sp, -52
  sw ra, 48(sp)
  sw s0, 44(sp)
  addi s0, sp, 52
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  sw a3, 20(s0)
  sw a4, 24(s0)
  sw a5, 28(s0)
  sw a6, 32(s0)
  sw a7, 36(s0)
  li t0, 2
  sw t0, -20(s0)
  li t0, 8
  sw t0, -24(s0)
  li t0, 8
  sw t0, -28(s0)
  li t0, 9
  sw t0, -32(s0)
  lw t0, -20(s0)
  mv a0, t0
  call func7
  mv t0, a0
  mv a0, t0
  lw t0, -24(s0)
  mv a0, t0
  call func5
  mv t0, a0
  mv a1, t0
  call func6
  mv t0, a0
  mv a0, t0
  lw t0, -28(s0)
  mv a1, t0
  call func2
  mv t0, a0
  mv a0, t0
  lw t0, -32(s0)
  mv a1, t0
  call func3
  mv t0, a0
  mv a0, t0
  call func5
  mv t0, a0
  mv a0, t0
  lw t0, 8(s0)
  mv a1, t0
  lw t0, 12(s0)
  mv a0, t0
  call func5
  mv t0, a0
  mv a0, t0
  lw t0, 16(s0)
  mv a0, t0
  lw t0, 20(s0)
  mv a0, t0
  call func7
  mv t0, a0
  mv a1, t0
  call func6
  mv t0, a0
  mv a1, t0
  lw t0, 24(s0)
  mv a0, t0
  lw t0, 28(s0)
  mv a0, t0
  call func7
  mv t0, a0
  mv a1, t0
  call func2
  mv t0, a0
  mv a2, t0
  call func4
  mv t0, a0
  mv a0, t0
  lw t0, 32(s0)
  mv a1, t0
  call func3
  mv t0, a0
  mv a0, t0
  lw t0, 36(s0)
  mv a1, t0
  call func2
  mv t0, a0
  mv a0, t0
  lw t0, 40(s0)
  mv a0, t0
  lw t0, 44(s0)
  mv a0, t0
  call func7
  mv t0, a0
  mv a1, t0
  call func3
  mv t0, a0
  mv a1, t0
  lw t0, -20(s0)
  mv a2, t0
  call func1
  mv t0, a0
  mv a2, t0
  call func4
  mv t0, a0
  mv a0, t0
  lw t0, -24(s0)
  mv a0, t0
  lw t0, -28(s0)
  mv a0, t0
  call func7
  mv t0, a0
  mv a0, t0
  lw t0, -32(s0)
  mv a1, t0
  call func3
  mv t0, a0
  mv a1, t0
  call func2
  mv t0, a0
  mv a1, t0
  call func3
  mv t0, a0
  mv a0, t0
  lw t0, 8(s0)
  mv a1, t0
  lw t0, 12(s0)
  mv a2, t0
  call func1
  mv t0, a0
  mv a0, t0
  lw t0, 16(s0)
  mv a1, t0
  call func2
  mv t0, a0
  mv a0, t0
  lw t0, 20(s0)
  mv a1, t0
  lw t0, 24(s0)
  mv a0, t0
  lw t0, 28(s0)
  mv a0, t0
  call func5
  mv t0, a0
  mv a1, t0
  call func3
  mv t0, a0
  mv a0, t0
  lw t0, 32(s0)
  mv a0, t0
  call func5
  mv t0, a0
  mv a1, t0
  call func2
  mv t0, a0
  mv a0, t0
  lw t0, 36(s0)
  mv a1, t0
  lw t0, 40(s0)
  mv a0, t0
  call func7
  mv t0, a0
  mv a2, t0
  call func1
  mv t0, a0
  mv a0, t0
  lw t0, 44(s0)
  mv a0, t0
  call func5
  mv t0, a0
  mv a1, t0
  call func2
  mv t0, a0
  mv a0, t0
  lw t0, -20(s0)
  mv a1, t0
  call func3
  mv t0, a0
  mv a2, t0
  call func1
  mv t0, a0
  sw t0, -36(s0)
  lw t0, -36(s0)
  mv a0, t0
  j nestedCalls_ret
nestedCalls_ret:
  lw ra, 48(sp)
  lw s0, 44(sp)
  addi sp, sp, 52
  ret

main:
  addi sp, sp, -76
  sw ra, 72(sp)
  sw s0, 68(sp)
  addi s0, sp, 76
  li t0, 0
  sw t0, -20(s0)
  li t0, 12
  mv a0, t0
  call fibonacci
  mv t0, a0
  sw t0, -24(s0)
  li t0, 22
  mv a0, t0
  li t0, 15
  mv a1, t0
  call gcd
  mv t0, a0
  sw t0, -28(s0)
  li t0, 17
  mv a0, t0
  call isPrime
  mv t0, a0
  sw t0, -32(s0)
  li t0, 8
  mv a0, t0
  call factorial
  mv t0, a0
  sw t0, -36(s0)
  li t0, 7
  mv a0, t0
  li t0, 3
  mv a1, t0
  call combination
  mv t0, a0
  sw t0, -40(s0)
  li t0, 3
  mv a0, t0
  li t0, 11
  mv a1, t0
  call power
  mv t0, a0
  sw t0, -44(s0)
  li t0, 3
  mv a0, t0
  li t0, 5
  mv a1, t0
  li t0, 1
  mv a2, t0
  call complexFunction
  mv t0, a0
  sw t0, -48(s0)
  li t0, -5
  mv a0, t0
  li t0, 10
  mv a1, t0
  call shortCircuit
  mv t0, a0
  sw t0, -52(s0)
  li t0, 10
  mv a0, t0
  call nestedLoopsAndConditions
  mv t0, a0
  sw t0, -56(s0)
  li t0, 1
  mv a0, t0
  li t0, 2
  mv a1, t0
  li t0, 3
  mv a2, t0
  li t0, 4
  mv a3, t0
  li t0, 5
  mv a4, t0
  li t0, 6
  mv a5, t0
  li t0, 7
  mv a6, t0
  li t0, 8
  mv a7, t0
  li t0, 9
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 10
  addi sp, sp, -4
  sw t0, 0(sp)
  call nestedCalls
  addi sp, sp, 8
  mv t0, a0
  sw t0, -60(s0)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -40(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 256
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  sw t0, -20(s0)
  lw t0, -20(s0)
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 72(sp)
  lw s0, 68(sp)
  addi sp, sp, 76
  ret
