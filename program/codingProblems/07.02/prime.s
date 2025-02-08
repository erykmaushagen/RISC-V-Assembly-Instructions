# bool is_prime(int value){
#     if(value%2 == 0) return false;
#     if(value < 2) return false; 
#     for(int index = 3; index * index < value; index +=2){
#         if(value%index == 0) return false; 
#     }
#     return true; 
# } 
.data 
val: .word 96

.text 
.globl main
main: 
    la t0, val
    lw a0, 0x0(t0) 

    li t1, 2
    rem t0, a0, t1
    beqz t0, not_prime
    blt a0, t1, not_prime

    li a1, 3
loop:
    mul t0, a1, a1
    bge t0, a0, is_prime    # index * index < value
    rem t0, a0, a1 
    beqz t0, not_prime      # if index%value 
    add a1, a1, t1          # index +=2
    j loop

is_prime: 
    li a1, 1
    li a0, 1
    ecall 
    li a0, 10
    ecall 

not_prime: 
    li a1, 0 
    li a0, 1
    ecall 
    li a0, 10
    ecall 