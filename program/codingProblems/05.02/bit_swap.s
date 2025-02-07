# Bit-Positionstausch: Entwickle ein Programm, das zwei 
# spezifische Bitpositionen in einem Register tauscht.

.data
arr: .word 0b100

.text
.globl main
main:
    la t0, arr
    lw a1, 0(t0) 

    li t1, 0               # pos. 1
    li t2, 2               # pos. 2 

    srl t3, a1, t1
    addi t3, t3, 1         # bit pos. 1

    srl t4, a1, t2
    addi t4, t4, 1         # bit pos. 2

    beq t3, t4, end
    
    # bilde submaske: 
    li t5, 1
    sll t5, t5, t1
    li t6, 1 
    sll t6, t5, t2
    or t5, t5, t6

    xor a1, a1, t5         #  bilde submask auf arr. ab

end:    
    li a0, 1
    ecall 
    li a0, 10
    ecall 