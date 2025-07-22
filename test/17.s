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
  j L2
L1:
L2:
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
  beqz t0, L3
  li t0, 0
  mv a0, t0
  j fibonacci_ret
  j L4
L3:
L4:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  xor t0, t1, t0
  seqz t0, t0
  beqz t0, L5
  li t0, 1
  mv a0, t0
  j fibonacci_ret
  j L6
L5:
L6:
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
  beqz t0, L7
  lw t0, 8(s0)
  mv a0, t0
  j gcd_ret
  j L8
L7:
L8:
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
  beqz t0, L9
  li t0, 0
  mv a0, t0
  j is_prime_ret
  j L10
L9:
L10:
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L11
  li t0, 1
  mv a0, t0
  j is_prime_ret
  j L12
L11:
L12:
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
  bnez t0, L15
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
  j L16
L15:
  li t0, 1
L16:
  beqz t0, L13
  li t0, 0
  mv a0, t0
  j is_prime_ret
  j L14
L13:
L14:
  li t0, 5
  sw t0, -20(s0)
L17:
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
  beqz t0, L18
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
  bnez t0, L21
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
  j L22
L21:
  li t0, 1
L22:
  beqz t0, L19
  li t0, 0
  mv a0, t0
  j is_prime_ret
  j L20
L19:
L20:
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 6
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  j L17
L18:
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
  sub t0, zero, t0
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
  beqz t0, L25
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
  j L26
L25:
  li t0, 0
L26:
  beqz t0, L23
  li t0, 1
  sw t0, -52(s0)
  j L24
L23:
L24:
  li t0, 0
  sw t0, -56(s0)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  bnez t0, L29
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
  j L30
L29:
  li t0, 1
L30:
  beqz t0, L27
  li t0, 1
  sw t0, -56(s0)
  j L28
L27:
L28:
  li t0, 0
  sw t0, -60(s0)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L37
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L38
L37:
  li t0, 0
L38:
  bnez t0, L35
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L39
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L40
L39:
  li t0, 0
L40:
  mv t0, t0
  j L36
L35:
  li t0, 1
L36:
  seqz t0, t0
  beqz t0, L33
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  bnez t0, L41
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  slt t0, t1, t0
  mv t0, t0
  j L42
L41:
  li t0, 1
L42:
  mv t0, t0
  j L34
L33:
  li t0, 0
L34:
  beqz t0, L31
  li t0, 1
  sw t0, -60(s0)
  j L32
L31:
L32:
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
  beqz t0, L45
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  mv t0, t0
  j L46
L45:
  li t0, 0
L46:
  beqz t0, L43
  lw t0, -64(s0)
  sw t0, -80(s0)
  j L44
L43:
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L49
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  mv t0, t0
  j L50
L49:
  li t0, 0
L50:
  beqz t0, L47
  lw t0, -68(s0)
  sw t0, -80(s0)
  j L48
L47:
  lw t0, -72(s0)
  sw t0, -80(s0)
L48:
L44:
  li t0, 0
  sw t0, -84(s0)
  li t0, 1
  sw t0, -88(s0)
L51:
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 10
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L52
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
  beqz t0, L53
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
  j L54
L53:
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
  beqz t0, L55
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
  j L56
L55:
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -84(s0)
L56:
L54:
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -88(s0)
  j L51
L52:
  li t0, 0
  sw t0, -92(s0)
  li t0, 1
  sw t0, -88(s0)
L57:
  lw t0, -88(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 5
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L58
  li t0, 1
  sw t0, -96(s0)
  li t0, 1
  sw t0, -100(s0)
L59:
  lw t0, -96(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  xori t0, t0, 1
  beqz t0, L60
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
  j L59
L60:
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
  j L57
L58:
  li t0, 0
  sw t0, -96(s0)
  lw t0, -64(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L61
  lw t0, -68(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L63
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -96(s0)
  j L64
L63:
  lw t0, -72(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L65
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -96(s0)
  j L66
L65:
  lw t0, -64(s0)
  sw t0, -96(s0)
L66:
L64:
  j L62
L61:
  lw t0, -68(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L67
  lw t0, -72(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L69
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, -96(s0)
  j L70
L69:
  lw t0, -68(s0)
  sw t0, -96(s0)
L70:
  j L68
L67:
  lw t0, -72(s0)
  mv a0, t0
  call is_prime
  mv t0, a0
  beqz t0, L71
  lw t0, -72(s0)
  sw t0, -96(s0)
  j L72
L71:
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
  sw t0, -96(s0)
L72:
L68:
L62:
  li t0, 0
  sw t0, -100(s0)
  li t0, 2345
  sw t0, -104(s0)
  li t0, 0
  sw t0, -108(s0)
L73:
  lw t0, -104(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 0
  lw t1, 0(sp)
  addi sp, sp, 4
  sgt t0, t1, t0
  beqz t0, L74
  lw t0, -104(s0)
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
  beqz t0, L75
  lw t0, -108(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -108(s0)
  j L76
L75:
L76:
  lw t0, -104(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  div t0, t1, t0
  sw t0, -104(s0)
  j L73
L74:
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
  lw t0, -96(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -108(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -112(s0)
  li t0, 0
  sw t0, -116(s0)
  lw t0, -112(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 256
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  sw t0, -116(s0)
  lw t0, -116(s0)
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 136(sp)
  lw s0, 132(sp)
  addi sp, sp, 140
  ret
