
.data
target: .word 218     # invertiere deisen wert

.text 
.globl main

main: 
    la t0, target      # Reg[5] := 0x10000000
    lw a0, 0(t0)       # Reg[10] := Speicher[Reg[5]]
    not a0, a0         # Reg[10] := not Reg[10] 

    sw a0, 0(t0)       # Speicher[0x10000000] := Reg[10] 

    li a1, 10          # Reg[11] := 0xA
    ecall              # systemcall 

