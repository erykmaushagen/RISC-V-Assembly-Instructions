# Bit-Interleaving: Implementiere eine Funktion, 
# die zwei Bitvektoren miteinander verwebt. 
# Zum Beispiel, 1010 und 1100 wird zu 11100010.

.data
x: .word 0b111
y: .word 0b0101 
# output: x & y -> 1110101

.text
.globl main
main: 
    la t0, x
    lw a0, 0x0(t0) 
    lw a1, 0x4(t0)

    li a2, 3        # bit-size x
    li a3, 4        # bit-size y

    sll a0, a0, a3
    or a0, a0, a1
    
    sw a0, 0x0(t0)
    
    li a0, 10
    ecall 