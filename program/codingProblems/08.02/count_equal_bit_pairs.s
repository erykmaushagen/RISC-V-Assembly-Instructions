# count number of equal bit-pairs 

.data
a:  .word 0b01110101     # Bitstring A (0x4B = 01001011)
b:  .word 0b01101011      # Bitstring B (0x6A = 01101010)

.text
.globl main

main:   
    la t0, a
    lw a0, 0x0(t0) 
    la t0, b 
    lw a1, 0x0(t0) 
    
    li a2, 8              # max_size
    li t0, 0              # inner_index
    li t1, 0              # outter_index
    li a3, 0              # max_same
    li a4, 0              # inner counter for equal
    li a5, 0              # copy a 
    li a6, 0              # copy b 

outter_loop:
    beq t1, a2, exit
    mv t0, t1     
    mv a5, a0 
    mv a6, a1      
    j inner_loop
back: 
    ble a4, a3, jump
    mv a3, a4
jump:   
    srli a0, a0, 1
    srli a1, a1, 1
    addi t1, t1, 1
    li a4, 0 
    li t4, 0 
    j outter_loop
    
inner_loop: 
    beq t0, a2, back 
    andi t2, a5, 1
    andi t3, a6, 1
    beq t2, t3, increase
    ble a4, t4, jump2
    mv t4, a4
jump2: 
    j step_ahead

increase: 
    addi a4, a4, 1
    j step_ahead

step_ahead:
    srli a5, a5, 1
    srli a6, a6, 1
    addi t0, t0, 1
    j inner_loop

exit: 
    mv a1, a3 
    li a0, 1
    ecall 
    li a0, 10
    ecall 


