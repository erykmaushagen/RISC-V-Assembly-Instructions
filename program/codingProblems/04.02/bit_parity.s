# 0...01011101 -> 7
# zähle führende Nullen bis man auf 1 trifft
.data 
u: .word 0b1001
# bit parity: 01101 -> 1 
# bit parity: 110101100 
.text 
.globl main
main:
    la t0, u 
    lw a1, 0x0(t0) 

    li a3, 0        # one counter
    li a2, 32       # for iterration through register

loop:   
    beqz a2, exit   
    andi t0, a1, 1      # extract smallest bit 
    addi a2, a2 -1      # counter-- 
    srli a1, a1, 1
    bgt t0, x0, loop 
    addi a3, a3, 1
    j loop 

exit:   
    li t2, 2
    rem a1, a3, t2 
    li a0, 1
    ecall 
    li a0, 10 
    ecall 

    

    
