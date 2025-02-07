# Für die Zahl 5 und Bitlänge l = 3 ergibt sich: 
# x = (0 ... 0101), x3 = (101) ist ein Palindrom.
# Für die Zahl 51 und Bitlänge l = 6 ergibt sich: 
# x = (0 ... 0110011), x6 = (110011) ist ein Palindrom. 
# Für die Zahl 51 und Bitlänge l = 5 ergibt sich: 
# x = (0 ... 0110011), x5 = (10011) ist kein Palindrom.

.data
size: .word 3
data: .word 0b101

.text
.globl solution

solution:
    la t0, size
    lw a0, 0(t0) 
    la t0, data
    lw a1, 0(t0) 
    
    li t2, 2
    rem a3, a0, t2
    div a0, a0, t2  # set size for shifting
    li a2, 0        # register for comparing

loop:   
    beqz a0, exit1
    slli a2, a2, 1       # 
    andi t2, a1, 1       # extract lowest bit 
    srli a1, a1, 1       # main register >>1
    or a2, a2 , t2       # fill register with new bit
    addi a0, a0, -1
    j loop

exit1: 
    beqz a3, jump
    srli a1, a1, 1
jump:
    bne a2, a1, exit2
    li a1, 1
    li a0, 1
    ecall
    li a0, 10
    ecall 

exit2: 
    li a1, 0
    li a0, 1
    ecall
    li a0, 10
    ecall 


