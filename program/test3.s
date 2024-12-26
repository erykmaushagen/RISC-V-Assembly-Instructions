.data
x: .word 10
space: .asciiz ","

.text
.globl main
main:
    lw s1, x
    li t0, 0 
    
loop:
    #addi sp, sp, -8
    #sw s1, 0(sp)
    #sw ra, 4(sp)
    mv a0, t0
    jal unbekannt
    #lw ra, 4(sp)
    #lw s1, 0(sp)
    #addi sp, sp, 8
    li a7, 1
    ecall
    li a7, 4
    la a0, space
    ecall
    addi t0, t0, 1
    mv a0, t0 
    ble t0, s1, unbekannt
    li a7, 10
    ecall

unbekannt:
    addi t1, x0, 0

schleife:
    beqz a0, break
    add t1, t1, a0
    addi a0, a0, -1
    j schleife

break:
    mv a0, t1
    jr ra