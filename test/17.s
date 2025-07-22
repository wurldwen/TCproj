.text
.globl _start
_start:
  call main
  li a7, 93
  mv a0, a0
  ecall

.globl main

factorial:
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
  li t0, 1
  mv a0, t0
  j factorial_ret
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
  call factorial
  mv t0, a0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  mv a0, t0
  j factorial_ret
factorial_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

fibonacci:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L2
  li t0, 0
  mv a0, t0
  j fibonacci_ret
L2:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L3
  li t0, 1
  mv a0, t0
  j fibonacci_ret
L3:
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
  beqz t0, L4
  lw t0, 8(s0)
  mv a0, t0
  j gcd_ret
L4:
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

is_prime:
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
  beqz t0, L5
  li t0, 0
  mv a0, t0
  j is_prime_ret
L5:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L6
  li t0, 1
  mv a0, t0
  j is_prime_ret
L6:
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
  bnez t0, L8
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
  j L9
L8:
  li t0, 1
L9:
  beqz t0, L7
  li t0, 0
  mv a0, t0
  j is_prime_ret
L7:
  li t0, 5
  sw t0, -20(s0)
L10:
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
  beqz t0, L11
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
  bnez t0, L13
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
  j L14
L13:
  li t0, 1
L14:
  beqz t0, L12
  li t0, 0
  mv a0, t0
  j is_prime_ret
L12:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 6
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  j L10
L11:
  li t0, 1
  mv a0, t0
  j is_prime_ret
is_prime_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret

main:
  addi sp, sp, -140
  sw ra, 136(sp)
  sw s0, 132(sp)
  addi s0, sp, 140
  li t0, 1
  sw t0, -20(s0)
  li t0, 2
  sw t0, -24(s0)
  li t0, 3
  sw t0, -28(s0)
  li t0, 4
  sw t0, -32(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2048
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
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
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -36(s0)
  li t0, 0
  sw t0, -40(s0)
  li t0, 1
  sw t0, -44(s0)
  li t0, 2
  sw t0, -48(s0)
  li t0, 0
  sw t0, -52(s0)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L16
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  mv t0, t0
  j L17
L16:
  li t0, 0
L17:
  beqz t0, L15
  li t0, 1
  sw t0, -52(s0)
L15:
  li t0, 0
  sw t0, -56(s0)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  bnez t0, L19
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  mv t0, t0
  j L20
L19:
  li t0, 1
L20:
  beqz t0, L18
  li t0, 1
  sw t0, -56(s0)
L18:
  li t0, 0
  sw t0, -60(s0)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L26
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L27
L26:
  li t0, 0
L27:
  bnez t0, L24
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L28
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L29
L28:
  li t0, 0
L29:
  mv t0, t0
  j L25
L24:
  li t0, 1
L25:
  seqz t0, t0
  beqz t0, L22
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  bnez t0, L30
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L31
L30:
  li t0, 1
L31:
  mv t0, t0
  j L23
L22:
  li t0, 0
L23:
  beqz t0, L21
  li t0, 1
  sw t0, -60(s0)
L21:
  li t0, 42
  sw t0, -64(s0)
  li t0, 56
  sw t0, -68(s0)
  li t0, 87
  sw t0, -72(s0)
  lw t0, -68(s0)
  mv a0, t0
  lw t0, -72(s0)
  mv a1, t0
  call gcd
  mv t0, a0
  mv a0, t0
  call factorial
  mv t0, a0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 5
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  mv a0, t0
  call fibonacci
  mv t0, a0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -76(s0)
  li t0, 0
  sw t0, -80(s0)
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L34
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  mv t0, t0
  j L35
L34:
  li t0, 0
L35:
  beqz t0, L32
  lw t0, -64(s0)
  sw t0, -80(s0)
  j L33
L32:
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L38
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  mv t0, t0
  j L39
L38:
  li t0, 0
L39:
  beqz t0, L36
  lw t0, -68(s0)
  sw t0, -80(s0)
  j L37
L36:
  lw t0, -72(s0)
  sw t0, -80(s0)
L37:
L33:
  li t0, 0
  sw t0, -84(s0)
  li t0, 1
  sw t0, -88(s0)
L40:
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 10
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L41
  lw t0, -88(s0)
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
  beqz t0, L42
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -84(s0)
  j L43
L42:
  lw t0, -88(s0)
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
  beqz t0, L44
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -84(s0)
  j L45
L44:
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -84(s0)
L45:
L43:
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -88(s0)
  j L40
L41:
  li t0, 0
  sw t0, -92(s0)
  li t0, 1
  sw t0, -88(s0)
L46:
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 5
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L47
  li t0, 1
  sw t0, -96(s0)
  li t0, 1
  sw t0, -100(s0)
L48:
  lw t0, -96(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L49
  lw t0, -100(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -96(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -100(s0)
  lw t0, -96(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -96(s0)
  j L48
L49:
  lw t0, -92(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -100(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -92(s0)
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -88(s0)
  j L46
L47:
  li t0, 0
  sw t0, -104(s0)
  lw t0, -64(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L50
  lw t0, -68(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L52
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -104(s0)
  j L53
L52:
  lw t0, -72(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L54
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -104(s0)
  j L55
L54:
  lw t0, -64(s0)
  sw t0, -104(s0)
L55:
L53:
  j L51
L50:
  lw t0, -68(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L56
  lw t0, -72(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L58
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -104(s0)
  j L59
L58:
  lw t0, -68(s0)
  sw t0, -104(s0)
L59:
  j L57
L56:
  lw t0, -72(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L60
  lw t0, -72(s0)
  sw t0, -104(s0)
  j L61
L60:
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -104(s0)
L61:
L57:
L51:
  li t0, 0
  sw t0, -108(s0)
  li t0, 2345
  sw t0, -112(s0)
  li t0, 0
  sw t0, -116(s0)
L62:
  lw t0, -112(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L63
  lw t0, -112(s0)
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
  beqz t0, L64
  lw t0, -116(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -116(s0)
L64:
  lw t0, -112(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  sw t0, -112(s0)
  j L62
L63:
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -60(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -104(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -116(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -120(s0)
  li t0, 0
  sw t0, -124(s0)
  lw t0, -120(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 256
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  sw t0, -124(s0)
  lw t0, -124(s0)
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 136(sp)
  lw s0, 132(sp)
  addi sp, sp, 140
  ret
