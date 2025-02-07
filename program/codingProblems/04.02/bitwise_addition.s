
.data
val1: .word 4245
val2: .word 765

.text
.globl main
main: 
    la t0, val1
    la t1, val2
    lw a2, 0(t0)    # für Übertrag
    lw a3, 0(t1)    # für vorläufige sum
    li a1, 0        # init Ziel-Register

addition:
    and t0, a2, a3  # temp0 := a2 AND a3
    xor a1, a2, a3  # Reg[ziel] := a2 XOR a3
    slli t0, t0, 1  # temp << 1
    
    add a2, a1, x0  # Reg[2] := Reg[ziel]
    add a3, t0, x0  # Reg[3] := temp1 
    
    bne a3, x0, addition

exit: 
    li a0, 1
    ecall

    li a0, 10 
    ecall