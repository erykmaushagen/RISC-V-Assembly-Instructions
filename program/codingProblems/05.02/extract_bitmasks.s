# Angenommen, du hast ein 8-Bit-Register R mit dem Wert 
# 10101100 und du möchtest die Bits an den Positionen 2 is 3
# extrahieren.
# 00001100 -> 00000011

.data
val: .word 0b001100  
.text
.globl main 
 
main:
    la t0, val 
    lw a0, 0(t0) 
    
    li a1, 0            # ziel-reg. 
    li a2, 1            # pos. 1
    li a3, 3            # pos. 2
    li a4, 0            # submask
    sub t1, a3, a2      # differece 

submask_fast: 
    not a4, a4 
    li t0, 31
    sub t0, t0, t1
    srl a4, a4, t0

extract: 
    srl a0, a0, a2
    and a1, a4, a0

exit: 
    li a0, 1
    ecall 
    li a0, 10 
    ecall 
