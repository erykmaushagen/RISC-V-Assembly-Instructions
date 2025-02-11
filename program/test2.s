# int lcm(int a, int b) {
#     int max = (a > b) ? a : b;
#     while (true) {
##         if (max % a == 0 && max % b == 0) {
#             return max;
#         }
#         ++max;
#     }
# }

.data
val1: .word 7
val2: .word 5 
.text
.globl main
main: 
    la t0, val1
    lw a0, 0x0(t0)          # a
    la t0, val2
    lw a1, 0x0(t0)          # b 

    li a2, 0       # max

    bge a0, a1 jump
    mv a2, a0
    j loop
jump: 
    mv a2, a1
loop: 
    rem t0, a2, a0 
    bnez t0, increase 
    rem t0,  a2, a1 
    bnez t0, increase
    j exit 
increase:   
    addi a2, a2, 1
    j loop 

exit: 
    mv a1, a2
    li a0, 1
    ecall
    li a0, 10 
    ecall 

