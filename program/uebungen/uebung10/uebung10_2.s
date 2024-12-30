.data
n: .word 13

.text
.globl solution

solution:
    # Call function with argument n
    lw a0, n
    addi sp,sp,-4
    sw ra, 0(sp)

    jal ra, tudo

    lw ra, 0(sp)
    addi sp,sp,4
    # Output restult
    li a7, 4
    ecall

    li a7, 10
    ecall
    ret

tudo: 
    addi sp, sp, -8
    sw a0, 0(sp)
    sw ra, 4(sp) 

    li t0, 2
    ble a0, t0, base_case

    addi a0, a0, -1
    jal tudo
    mv t0, a0

    lw a0, 0(sp)
    addi a0, a0, -3
    jal tudo

    add a0, a0, t0
    lw a0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    ret

base_case: 
    lw ra, 4(sp)
    lw a0, 0(sp)
    addi sp, sp, 8
    jr ra