# set a1 to 1 if bit-pattern is found
# set a1 to 0 if bit-pattern was not found

.data
x: .word 0b000010010011101101100
y: .word 0b100111

.text 
.globl main
main:
    la t0, x
    la t1, y 
    lw a2, 0(t0)    # object-register
    lw a3, 0(t1)    # pattern 

    li a1, 0        # default-output
    li t4, 32       # size-register
    
loop: 
    beq t4, zero, exit
    andi t1, a2, 0b111111
    beq t1, a3, found
    srli a2, a2, 1
    addi, t4, t4, -1
    j loop

found: 
    li a1, 1

exit: 
    li a0, 1
    ecall 
    li a0, 10 
    ecall 
