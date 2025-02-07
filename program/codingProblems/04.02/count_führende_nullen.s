# 0...01011101 -> 7
# zähle führende Nullen bis man auf 1 trifft
.data 
val: .word 0x00000FFF

.text 
.globl main
main:
    la t0, val
    lw a0, 0(t0) 
    
    li a2, 32       # vector-size
    li a1, 0        # zero-counter
    li a3, 1        # for comparing
    
loop:
    beq a2, zero, exit 
    and t0, a0, a3  # extract bit 
    srli a0, a0, 1
    addi a2, a2, -1 
    beq t0, a3, 1detected 
    addi a1, a1, 1
    j loop

1detected: 
    li a1, 0        # reset
    j loop 

exit:   
    li a0, 1
    ecall 
    li a0, 10
    ecall