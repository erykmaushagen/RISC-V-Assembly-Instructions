# Bit-Block-Umkehrung: Schreibe ein Programm, 
# das einen bestimmten Block von Bits innerhalb eines Registers 
# umkehrt
# 0000011000 -> 0 bis 4 invertieren-> 0000000111
# Ergebnis: 

.data
val: .word 0b0000011000  # -> 00111 für 0 bis 4

.text
.globl main
main: 
    la t0, val 
    lw a0, 0(t0)

    li a2, 4            # first pos. 
    li a3, 6            # sec. pos. 
    li a4, 0            # submask 
    sub t0, a3, a2      # diff. 

sumask: 
    not a4, a4
    li t1, 31
    sub t1, t1, t0
    srl a4, a4, t1 

extract_bits:
    srl a0, a0, a2
    xor a1, a0, a4

exit: 
    li a0, 1
    ecall 
    li a0, 10
    ecall 
