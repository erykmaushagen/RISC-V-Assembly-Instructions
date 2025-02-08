
# example: 
# 00101010
# 00111000
# output: -> 2

.data
val1: .word 0b0010000
val2: .word 0b0011111

.text
.globl main
main:
    la t0, val1
    lw a0, 0x0(t0) 
    la t0, val2 
    lw a1, 0x0(t0)

    li a2, 32           # counter
    li a3, 0            # dif. counter 

loop: 
    beqz a2, exit 
    andi t0, a0, 1
    andi t1, a1, 1
    addi a2, a2, -1 
    srli a0, a0, 1
    srli a1, a1, 1
    beq t0, t1, loop   
    addi a3, a3, 1
    j loop 

exit: 
    mv a1, a3
    li a0, 1
    ecall 
    li a0, 10
    ecall 