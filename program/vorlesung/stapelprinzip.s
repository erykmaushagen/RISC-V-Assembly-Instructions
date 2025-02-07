.data
x: .word 10
space: .asciiz ","

.text
.globl main

main:
    la t0, func1
    jalr ra, t0, 0

    #exit program
    li a0, 10
    ecall

func1:
    addi sp, sp, -4
    sw ra, 0(sp)          # Rücksprungadresse auf dem Stack speichern
    #output
    li a1, 111
    li a0, 1
    ecall 
    #springe in func2:
    la t0, func2
    jalr ra, t0, 0
    #springe in main
    lw ra, 0(sp)         # Rücksprungadresse vom Stack laden 
    addi sp, sp, 4
    jalr x0, ra, 0 #springe zurück

func2:
    addi sp, sp, -4
    sw ra, 0(sp)         # Rücksprungadresse auf dem Stack speichern
    #output
    li a1, 222
    li a0, 1
    ecall 
    #springe in func2:
    la t0, func3
    jalr ra, t0, 0
    #springe in func1
    lw ra, 0(sp)        # Rücksprungadresse vom Stack laden 
    addi sp, sp, 4
    jalr x0, ra, 0 #springe zurück

func3:
    addi sp, sp, -4
    sw ra, 0(sp)         # Rücksprungadresse auf dem Stack speichern
    #output
    li a1, 333
    li a0, 1
    ecall 
    #springe in func2
    lw ra, 0(sp)        # Rücksprungadresse vom Stack laden 
    addi sp, sp, 4
    jalr x0, ra, 0 #springe zurück
