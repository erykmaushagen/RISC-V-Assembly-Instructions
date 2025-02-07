.data
x: .word 5123


.text 
.globl main
main: 
    la t0, x
    lw a0, 0(t0)
    li a1, 10 
    li a2, 0

schleife: 
    beq a0, zero, ende  # exit if a0 == 0 
    rem t0, a0, a1      # temp := a0 % 10 
    div a0, a0, a1      # x := x / 10 
    add a2, a2, t0      # a2 := a2 + temp
    j schleife          # PC := PC + offset of label

ende: 
    add, a1, zero, a2   # a0 := a2 
    li a0, 1    # Reg[10] := 0
    ecall       # system-call to print int 
    li a0, 10   # reg[10] := 10
    ecall       # system-call to exit 
# 5123 -> 11 