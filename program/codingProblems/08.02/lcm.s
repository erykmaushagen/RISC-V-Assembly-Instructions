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
a: .word 7 
b: .word 5

.text 
.globl main
main: 
    la t0, a    
    lw a0, 0x0(t0)          # a0 -> a
    la t0, b
    lw a1, 0x0(t0)          # a1 -> b

    li a2, 0                # a2 -> max
    ble a0, a1, jump
    mv a2, a0 
    j loop

jump:    
    mv a2, a1 
    j loop

loop: 
    rem t0, a2, a0
    beqz t0, and 
    addi a2, a2, 1
    j loop

and: 
    rem t1, a2, a1 
    beqz t1, exit 
    addi a2, a2, 1
    j loop

exit: 
    mv a1, a2
    li a0, 1
    ecall 
    li a0,10 
    ecall


