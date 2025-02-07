.data
val: .word 0b110110  # 6-Bit Wert
# output: 011011
.text
.globl main
main: 
    li a0, 52
    la a4, val

    li a1, 2        # Anzahl der Rotationen
    li a2, 6        # Größe des Bit-Vektors

    # Erstelle eine Maske für die untersten 'a2' Bits
    li a5, 1
    sll a5, a5, a2
    addi a5, a5, -1  # Maske = (1 << a2) - 1

loop:
    beqz a1, exit
    srl t1, a0, a2            # extract overflow bit 
    andi t1, t1, 1              
    slli a0, a0, 1            # 1<< 
    or a0, a0, t1
    addi a1, a1, -1 
    j loop 

exit:   
    sw a0, 0(a4) 
    and a0, a0, a5
    sw a0, 0(a4) 
    li a7, 10
    ecall  
