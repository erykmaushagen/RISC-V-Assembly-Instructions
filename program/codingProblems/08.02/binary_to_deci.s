

# binary to dezi converter 

.data
val: .word 0b110101

.text 
.globl main
main: 
    la t0, val 
    lw a0, 0x0(t0) 

    li a1, 0        # counter
    li a2, 31       # limit
    li a3, 2        # base 
    li a4, 0        # result 

loop: 
    beq a1, a2, exit
    andi t0, a0, 1
    srli a0, a0, 1
    beqz t0, extra
    mv t0, a1 
    li t1, 1

exponent:  
    beqz t0, product 
    mul t1, t1, a3
    addi t0, t0, -1 
    j exponent

product: 
    add a4, a4, t1
    addi a1, a1, 1
    j loop

extra: 
    addi a1, a1, 1
    j loop

exit:
    mv a1, a4
    li a0, 1
    ecall 
    li a0, 10
    ecall 