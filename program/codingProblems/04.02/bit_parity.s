# 0...01011101 -> 7
# zähle führende Nullen bis man auf 1 trifft
.data 
u: .word 0b10011
# bit parity: 01101 -> 1 
# bit parity: 110101100 
.text 
.globl main
main:
    la t0, u        # Reg[5] := address(u)
                    # Reg[5] := 0x10000000
    lw a1, 0x0(t0)  # Reg[11]:= Speicher[Reg[5]]

    li a3, 0        # Reg[13]:= 0x0 
    li a2, 32       # Reg[12]:= 0x20 

loop:   
    beqz a2, exit       # nach exit, falls Reg[12] == 0x0 
    andi t0, a1, 1      # Reg[5] := Reg[11] AND 0x1
    addi a2, a2 -1      # Reg[12]:= Reg[12] - 0x1
    srli a1, a1, 1      # Reg[11]:= Reg[11] >> 1 
    bgt t0, x0, loop    # nach loop, falls Reg[5] > Reg[0]
    addi a3, a3, 1      # Reg[13]:= Reg[13] + 0x1
    j loop              # springe nach loop

exit:                   # tag
    li t2, 2            # Reg[7]:= 0x2
    rem a1, a3, t2      # Reg[11]:= Reg[13] % Reg[7]
    li a0, 1            # Reg[10]:= 0x1
    ecall               # Systemaufruf
    li a0, 10           # Reg[10]:= 0xA 
    ecall               # Sytemaufruf

    

    
