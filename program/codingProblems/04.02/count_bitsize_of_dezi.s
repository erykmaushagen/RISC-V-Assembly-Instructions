.data
x: .word 0xFFF
# count bits till last 1  
# 0x00000FFF -> 12
# 0xF -> 4
.text 
.globl main
main: 
    la t0, x 
    lw a0, 0(t0) 

    li t0, 32 # total bit-siz
    li a3, 1  # for comparing
    li a1, 0  # total bit counter
    li t2, 0  # internal counter


loop: 
    beq t0, zero, exit
    and t1, a0, a3
    srli a0, a0, 1
    addi t0, t0, -1         # position --
    beq t1, zero, counter   

    add a1, a1, t2          # when bit is 1
    addi a1, a1, 1
    j loop


counter:    
    addi t2, t2, 1          # count 0 in between 
    j loop

exit: 
    li a0, 1
    ecall
    li a0, 10 
    ecall