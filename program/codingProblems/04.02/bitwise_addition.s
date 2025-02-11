
.data
val1: .word 4245
val2: .word 765

.text
.globl main
main: 
    la t0, val1     # Reg[5] := adresse(val1)
                    # Reg[5] := 0x100000000
    la t1, val2     # Reg[6] := 0x100000004
    lw a2, 0(t0)    # Reg[12]:= Speicher[Reg[5]] 
    lw a3, 0(t1)    # Reg[13]:= Speicher[Reg[6]] 
    li a1, 0        # Reg[11]:= 0x0 

addition:           # tag
    and t0, a2, a3  # Reg[5] := Reg[12] AND Reg[13]
    xor a1, a2, a3  # Reg[11]:= Reg[12] XOR Reg[13]
    slli t0, t0, 1  # Reg[5] := Reg[5] << 1 
    
    add a2, a1, x0  # Reg[12]:= Reg[11] 
    add a3, t0, x0  # Reg[3] := Reg[5] 
    
    bne a3, x0, addition  # zu addition, falls Reg[13] != Reg[0] 

exit:               # tag 
    li a0, 1        # Reg[10] := 0x1
    ecall           # Systemaufruf

    li a0, 10       # Reg[10] := 0xA 
    ecall           # Systemaufruf 