
.data
target: .word 218     # invertiere deisen wert

.text 
.globl main

main: 
    la t0, target
    lw a0, 0(t0)
    not a0, a0     # invertiere 

    sw a0, 0(t0)

    li a1, 10
    ecall 

