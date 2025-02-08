# int gcd1(int a, int b){
#     if(a == 0) return b; 
#     if(b == 0) return a; 
#     while(b != 0){
#         int temp = b; 
#         b = a % b; 
#         a = temp; 
#     }
#     return a;
# }

.data
a: .word 24
b: .word 18

.text 
.globl main
main: 
    la t0, a
    lw a0, 0x0(t0)      # a0 -> a
    la t0, b
    lw a1, 0x0(t0)      # a1 -> b

    beqz a1, exit1      # b == 0 return a
    beqz a0, exit      # a == 0 return b

loop: 
    beqz a1, exit1
    mv t0, a1
    rem a1, a0, a1
    mv a0, t0 
    j loop

exit1: 
    mv a1, a0
exit: 
    li a0, 1
    ecall 
    li a0, 10 
    ecall 