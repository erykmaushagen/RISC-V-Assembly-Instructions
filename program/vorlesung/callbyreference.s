
.data
var_a: .word 5
var_b: .word 6

.text
.globl main

main:    

    # lade Adresse für call-by-reference
    la a0, var_a
    la a1, var_b

    jal ra, add_numbers

    li a0, 1         
    ecall            

    li a0, 10         
    ecall

add_numbers:
    # übernimmt adressen aus main
    lw t0, 0(a0)      
    lw t1, 0(a1)       

    add t0, t0, t1    
    sw t0, 0(a0)           

    jr ra             