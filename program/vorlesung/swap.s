# temp = v[k]
# v[k] = v[k + 1]
# v[k + 1] = temp
.data
v: .word 1, 2, 3, 4, 5, 6 , 7

.text
.globl main 

main:
    la t0, v
    #vertausch die werte v[2] und v[3]
    li t1, 4            # für speicher-itteration 
    li t2, 2            # k := 2
    mul t1, t1, t2
    add t0, t1, t0      # adresse v[k]
    lw a2, 0(t0)        # lade v[k]
    lw a3, 4(t0)        # lade v[k + 1]
    jal swap

    li a0, 10
    ecall 

swap: 
    addi sp, sp, -16
    sw t0, 0(sp)
    sw a2, 4(sp)
    sw a3, 8(sp)
    sw ra, 12(sp) 

    sw a3, 0(t0)        # v[k + 1] = v[k]
    sw a2, 4(t0)        # v[k] = v[k + 1]

    lw t0, 0(sp)
    lw a2, 4(sp)
    lw a3, 8(sp)
    lw ra, 12(sp) 
    addi sp, sp, 16

    #jalr x0, ra, 0
    jr ra
    



