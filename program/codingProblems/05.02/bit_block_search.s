# Bit-Block-Suche: Implementiere eine Funktion, 
# die die längste Sequenz von aufeinanderfolgenden 1-Bits
# in einem Register findet.

.data
val: .word 0b00000001111000000011001101001
# output -> 5

.text
.globl main
main: 
    la t0, val
    lw a0, 0(t0) 

    li a1, 32       # bit-size
    li a2, 0        # 1-counter
    li a3, 0        # temp 1-counter

loop: 
    beqz a1, exit
    andi t0, a0, 1
    beqz t0, reset
    addi a3, a3, 1
    bge a3, a2, set_max
    j shift_right 

reset: 
    li a3, 0
    j shift_right

set_max:
    mv a2, a3

shift_right: 
    addi a1, a1, -1 
    srli a0, a0, 1
    j loop
    
exit:
    mv a1, a2
    li a0, 1
    ecall 
    li a0, 10 
    ecall 