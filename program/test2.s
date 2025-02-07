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

    li t0, 2
    div a3, a0, t0
    li a2, 0         # tempreg
    rem a5, a0, t0 
    li a4, 0        # ziel-wert 


loop: 
    beqz a3, exit
    andi t1, a1, 1
    slli a2, a2, 1
    or a2, a2, t1
    srli a1, a1, 1
    addi a3, a3, -1
    j loop

exit: 
    bgtz a5, exit_ungerade
    j compare

exit_ungerade: 
    srli a1, a1, 1

compare: 
    bne a1, a2, end
    li a4, 1

end: 
    mv a1, a4
    li a0, 1
    ecall 
    li a0, 10
    ecall 
    