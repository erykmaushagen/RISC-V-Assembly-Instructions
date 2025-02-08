# int gcd2(int a, int b){
#     if(a == 0) return b; 
#     if(b == 0) return a;
#     while( a != b){
#         if(a > b) a = a - b; 
#         else b = b - a; 
#     }
#     return a;
# }

.data
a: .word 180 
b: .word 48

.text
.globl main
main: 
    la t0, a
    lw a0, 0x0(t0) 
    la t0, b
    lw a1, 0x0(t0)

    beqz a0, exit      # if a == 0 -> return b
    beqz a1, exit1     # if b == 0 -> return a

loop:   
    beq a0, a1, exit1 
    bgt a0, a1, jump
    sub a1, a1, a0
    j loop
jump:   
    sub a0, a0, a1
    j loop

exit1:
    mv a1, a0 
exit: 
    li a0, 1
    ecall
    li a0, 10 
    ecall