.text
.globl _start
_start:
  call main
  li a7, 93
  mv a0, a0
  ecall

.globl main

sum8:
  addi sp, sp, -64
  sw ra, 60(sp)
  sw s0, 56(sp)
  addi s0, sp, 64
  sw a0, -20(s0)
  sw a1, -24(s0)
  sw a2, -28(s0)
  sw a3, -32(s0)
  sw a4, -36(s0)
  sw a5, -40(s0)
  sw a6, -44(s0)
  sw a7, -48(s0)
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j sum8_ret
sum8_ret:
  lw ra, 60(sp)
  lw s0, 56(sp)
  addi sp, sp, 64
  ret

sum16:
  addi sp, sp, -64
  sw ra, 60(sp)
  sw s0, 56(sp)
  addi s0, sp, 64
  sw a0, -20(s0)
  sw a1, -24(s0)
  sw a2, -28(s0)
  sw a3, -32(s0)
  sw a4, -36(s0)
  sw a5, -40(s0)
  sw a6, -44(s0)
  sw a7, -48(s0)
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 0(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 4(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j sum16_ret
sum16_ret:
  lw ra, 60(sp)
  lw s0, 56(sp)
  addi sp, sp, 64
  ret

sum32:
  addi sp, sp, -80
  sw ra, 76(sp)
  sw s0, 72(sp)
  addi s0, sp, 80
  sw a0, -20(s0)
  sw a1, -24(s0)
  sw a2, -28(s0)
  sw a3, -32(s0)
  sw a4, -36(s0)
  sw a5, -40(s0)
  sw a6, -44(s0)
  sw a7, -48(s0)
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, 0(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 4(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -24(s0)
  lw t0, 32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 40(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 60(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -28(s0)
  lw t0, 64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 84(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j sum32_ret
sum32_ret:
  lw ra, 76(sp)
  lw s0, 72(sp)
  addi sp, sp, 80
  ret

sum64:
  addi sp, sp, -96
  sw ra, 92(sp)
  sw s0, 88(sp)
  addi s0, sp, 96
  sw a0, -20(s0)
  sw a1, -24(s0)
  sw a2, -28(s0)
  sw a3, -32(s0)
  sw a4, -36(s0)
  sw a5, -40(s0)
  sw a6, -44(s0)
  sw a7, -48(s0)
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, 0(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 4(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 8(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -24(s0)
  lw t0, 32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 40(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 60(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -28(s0)
  lw t0, 64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 84(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -32(s0)
  lw t0, 96(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 100(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 104(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 108(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 112(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 116(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 120(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 124(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -36(s0)
  lw t0, 128(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 132(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 136(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 140(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 144(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 148(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 152(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -40(s0)
  lw t0, 160(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 164(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 168(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 172(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 176(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 180(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 184(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 188(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -44(s0)
  lw t0, 192(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 196(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 200(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 204(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 208(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 212(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 216(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 220(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -48(s0)
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j sum64_ret
sum64_ret:
  lw ra, 92(sp)
  lw s0, 88(sp)
  addi sp, sp, 96
  ret

main:
  addi sp, sp, -184
  sw ra, 180(sp)
  sw s0, 176(sp)
  addi s0, sp, 184
  li t0, 1
  sw t0, -20(s0)
  li t0, 2
  sw t0, -24(s0)
  li t0, 3
  sw t0, -28(s0)
  li t0, 4
  sw t0, -32(s0)
  li t0, 5
  sw t0, -36(s0)
  li t0, 6
  sw t0, -40(s0)
  li t0, 7
  sw t0, -44(s0)
  li t0, 8
  sw t0, -48(s0)
  li t0, 9
  sw t0, -52(s0)
  li t0, 10
  sw t0, -56(s0)
  li t0, 11
  sw t0, -60(s0)
  li t0, 12
  sw t0, -64(s0)
  li t0, 13
  sw t0, -68(s0)
  li t0, 14
  sw t0, -72(s0)
  li t0, 15
  sw t0, -76(s0)
  li t0, 16
  sw t0, -80(s0)
  li t0, 4
  mv a7, t0
  lw t0, -44(s0)
  mv a6, t0
  li t0, 3
  mv a5, t0
  lw t0, -36(s0)
  mv a4, t0
  li t0, 2
  mv a3, t0
  lw t0, -28(s0)
  mv a2, t0
  li t0, 1
  mv a1, t0
  lw t0, -20(s0)
  mv a0, t0
  call sum8
  mv t0, a0
  sw t0, -84(s0)
  addi sp, sp, -32
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 28(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 24(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 20(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 16(sp)
  li t0, 4
  sw t0, 12(sp)
  li t0, 3
  sw t0, 8(sp)
  li t0, 2
  sw t0, 4(sp)
  li t0, 1
  sw t0, 0(sp)
  lw t0, -48(s0)
  mv a7, t0
  lw t0, -44(s0)
  mv a6, t0
  lw t0, -40(s0)
  mv a5, t0
  lw t0, -36(s0)
  mv a4, t0
  lw t0, -32(s0)
  mv a3, t0
  lw t0, -28(s0)
  mv a2, t0
  lw t0, -24(s0)
  mv a1, t0
  lw t0, -20(s0)
  mv a0, t0
  call sum16
  addi sp, sp, 32
  mv t0, a0
  sw t0, -88(s0)
  li t0, 17
  sw t0, -92(s0)
  li t0, 18
  sw t0, -96(s0)
  li t0, 19
  sw t0, -100(s0)
  li t0, 20
  sw t0, -104(s0)
  li t0, 21
  sw t0, -108(s0)
  li t0, 22
  sw t0, -112(s0)
  li t0, 23
  sw t0, -116(s0)
  li t0, 24
  sw t0, -120(s0)
  li t0, 25
  sw t0, -124(s0)
  li t0, 26
  sw t0, -128(s0)
  li t0, 27
  sw t0, -132(s0)
  li t0, 28
  sw t0, -136(s0)
  li t0, 29
  sw t0, -140(s0)
  li t0, 30
  sw t0, -144(s0)
  li t0, 31
  sw t0, -148(s0)
  li t0, 32
  sw t0, -152(s0)
  addi sp, sp, -96
  lw t0, -152(s0)
  sw t0, 92(sp)
  lw t0, -148(s0)
  sw t0, 88(sp)
  lw t0, -144(s0)
  sw t0, 84(sp)
  lw t0, -140(s0)
  sw t0, 80(sp)
  lw t0, -136(s0)
  sw t0, 76(sp)
  lw t0, -132(s0)
  sw t0, 72(sp)
  lw t0, -128(s0)
  sw t0, 68(sp)
  lw t0, -124(s0)
  sw t0, 64(sp)
  lw t0, -120(s0)
  sw t0, 60(sp)
  lw t0, -116(s0)
  sw t0, 56(sp)
  lw t0, -112(s0)
  sw t0, 52(sp)
  lw t0, -108(s0)
  sw t0, 48(sp)
  lw t0, -104(s0)
  sw t0, 44(sp)
  lw t0, -100(s0)
  sw t0, 40(sp)
  lw t0, -96(s0)
  sw t0, 36(sp)
  lw t0, -92(s0)
  sw t0, 32(sp)
  lw t0, -80(s0)
  sw t0, 28(sp)
  lw t0, -76(s0)
  sw t0, 24(sp)
  lw t0, -72(s0)
  sw t0, 20(sp)
  lw t0, -68(s0)
  sw t0, 16(sp)
  lw t0, -64(s0)
  sw t0, 12(sp)
  lw t0, -60(s0)
  sw t0, 8(sp)
  lw t0, -56(s0)
  sw t0, 4(sp)
  lw t0, -52(s0)
  sw t0, 0(sp)
  lw t0, -48(s0)
  mv a7, t0
  lw t0, -44(s0)
  mv a6, t0
  lw t0, -40(s0)
  mv a5, t0
  lw t0, -36(s0)
  mv a4, t0
  lw t0, -32(s0)
  mv a3, t0
  lw t0, -28(s0)
  mv a2, t0
  lw t0, -24(s0)
  mv a1, t0
  lw t0, -20(s0)
  mv a0, t0
  call sum32
  addi sp, sp, 96
  mv t0, a0
  sw t0, -156(s0)
  addi sp, sp, -224
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 220(sp)
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 216(sp)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 212(sp)
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 208(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 204(sp)
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -60(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 200(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 196(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 192(sp)
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -120(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 188(sp)
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -116(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 184(sp)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -112(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 180(sp)
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -108(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 176(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -104(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 172(sp)
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -100(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 168(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -96(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 164(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 160(sp)
  lw t0, -80(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 16
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 156(sp)
  lw t0, -76(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 15
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 152(sp)
  lw t0, -72(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 14
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 148(sp)
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 13
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 144(sp)
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 12
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 140(sp)
  lw t0, -60(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 11
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 136(sp)
  lw t0, -56(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 10
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 132(sp)
  lw t0, -52(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 9
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  sw t0, 128(sp)
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 8
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 124(sp)
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 7
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 120(sp)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 6
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 116(sp)
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 5
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 112(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 4
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 108(sp)
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 3
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 104(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 2
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 100(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, 96(sp)
  li t0, 32
  sw t0, 92(sp)
  li t0, 31
  sw t0, 88(sp)
  li t0, 30
  sw t0, 84(sp)
  li t0, 29
  sw t0, 80(sp)
  li t0, 28
  sw t0, 76(sp)
  li t0, 27
  sw t0, 72(sp)
  li t0, 26
  sw t0, 68(sp)
  li t0, 25
  sw t0, 64(sp)
  lw t0, -120(s0)
  sw t0, 60(sp)
  lw t0, -116(s0)
  sw t0, 56(sp)
  lw t0, -112(s0)
  sw t0, 52(sp)
  lw t0, -108(s0)
  sw t0, 48(sp)
  lw t0, -104(s0)
  sw t0, 44(sp)
  lw t0, -100(s0)
  sw t0, 40(sp)
  lw t0, -96(s0)
  sw t0, 36(sp)
  lw t0, -92(s0)
  sw t0, 32(sp)
  li t0, 16
  sw t0, 28(sp)
  li t0, 15
  sw t0, 24(sp)
  li t0, 14
  sw t0, 20(sp)
  li t0, 13
  sw t0, 16(sp)
  li t0, 12
  sw t0, 12(sp)
  li t0, 11
  sw t0, 8(sp)
  li t0, 10
  sw t0, 4(sp)
  li t0, 9
  sw t0, 0(sp)
  lw t0, -48(s0)
  mv a7, t0
  lw t0, -44(s0)
  mv a6, t0
  lw t0, -40(s0)
  mv a5, t0
  lw t0, -36(s0)
  mv a4, t0
  lw t0, -32(s0)
  mv a3, t0
  lw t0, -28(s0)
  mv a2, t0
  lw t0, -24(s0)
  mv a1, t0
  lw t0, -20(s0)
  mv a0, t0
  call sum64
  addi sp, sp, 224
  mv t0, a0
  sw t0, -160(s0)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -160(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -164(s0)
  li t0, 0
  sw t0, -168(s0)
  lw t0, -164(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 256
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  sw t0, -168(s0)
  lw t0, -168(s0)
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 180(sp)
  lw s0, 176(sp)
  addi sp, sp, 184
  ret
