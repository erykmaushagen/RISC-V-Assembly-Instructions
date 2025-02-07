# 011 -> 0 
# 1011010 -> 0
# 1101 -> 1


.data
val: .word 0b1011010

.text
.globl main

main: 
    la t0, val
    lw a2, 0(t0) 

    li t1, 1        # for comparing with 1's
    li a1, 0        # counter for one    
    li a3, 32       # for iterating through register

loop:               #for counting 1's
    beq a3, x0, final
    and t0, a2, t1
    beq t0, t1, increase
    srli a2, a2, 1
    addi a3, a3, -1
    j loop

increase: 
    addi a1, a1, 1
    srli a2, a2, 1
    addi a3, a3, -1
    j loop


final:
    and a1, a1, t1  # 1 wenn ungerade und 0 wenn gerade

    li a0, 1
    ecall 

    li a0, 10
    ecall 