# Bit-Reversal: Schreibe ein Programm, das die Reihenfolge der Bits in 
# einem Register umkehrt. Zum Beispiel, 1101 wird zu 1011.


.data
val: .word 0x0000FFFF

.text 
.globl main
main: 
    la t0, val 
    lw a0, 0(t0) 

    li a1, 0            # init. result-reg.
    li a2, 31           # reg. size

loop: 
    beqz a2, exit
    andi t0, a0, 1
    or a1, a1, t0 
    slli a1, a1, 1
    srli a0, a0, 1
    addi a2, a2, -1
    j loop 

exit: 
    li a0, 1
    ecall 

    li a0, 10
    ecall 