
# input: 5
# output: 120 


.data
val: .word 4

.text 
.globl main 
main:   
    la t0, val 
    lw a0, 0x0(t0) 

    li a1, 1        # mul. result 

loop: 
    beqz a0, exit 
    mul a1, a1, a0
    addi a0, a0, -1
    j loop

exit: 
    li a0, 1
    ecall
    li a0, 10
    ecall 