#swap funktion 
.data
array: .word 1,2,3,4,5,6,7,8,9,10
space: .asciiz ","

.text 
.globl main

main:
    la a3, array    # adresse array
    li t1, 4        # k = 4
    li t2, 4        # sprung im Speicher
    mul t1, t1, t2  # pos in array
    add t1, a3, t1  # erhalte add in array
    lw t2, 0(t1)    # temp1 = array[k] 
    lw t3, 4(t1)    # temp2 = array[k+1] 
    sw t3, 0(t1)    # array[k] = temp2
    sw t2, 4(t1)    # array[k + 1] = temp1

    la a4, space

    li a2, 9       # i = size_arr
    j printer

    li a0, 1        # beende program
    ecall 

printer:
    bltz a2, exit   # i <= 0
    lw a1, 0(a3)    # lade ausgabe
    addi a3, a3, 4  # erhöhe addresse um 4 
    addi a2, a2, -1 # i--

    li a0, 1        # ausgabe int
    ecall

    mv a1, a4       # ausgabe space
    li a0, 4        # ausgabe asciiz
    ecall

    j printer       # tag loop

exit:
    li a0, 10 
    ecall

