# 0...01011101 -> 7
# zähle führende Nullen bis man auf 1 trifft
.data 
u: .word 18

.text 
.globl main
main:
    la t0, u 
    lw a1, 0x0(t0) 

    not a1, a1

    li a0, 1
    ecall 
    li a0, 10
    ecall 
    
    
