
.data
val1: .word 35
val2: .word 5


.text 
.globl main
main: 
    la t0, val1 
    lw a1, 0x0(t0) 
    la t0, val2
    lw a2, 0x0(t0) 

loop:
    beqz a2, exit 
    mv t0, a1
    xor a1, a1, a2
    and a2, t0, a2 
    slli a2, a2, 1
    j loop 

exit:   
    li a0, 1
    ecall 
    li a0, 10
    ecall 


    