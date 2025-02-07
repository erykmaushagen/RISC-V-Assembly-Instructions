
.data
val: .word 7
.text
.globl main
main:
    la t0, val 
    lw a0, 0x0(t0) 

    li a1, 0        # (n - 1) 
    li a2, 1        # (n - 2) 
    li t0, 0        # iterrator

loop: 
    beq t0, a0, exit
    add a3, a2, a1
    mv a1, a2
    mv a2, a3 
    addi t0, t0, 1
    j loop

exit:
    mv a1, a3
    li a0, 1
    ecall
    li a0, 10
    ecall