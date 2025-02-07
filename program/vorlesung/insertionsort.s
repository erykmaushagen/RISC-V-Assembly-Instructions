
.data
array: .word 54, 2, 53, 2, 52, 6, 16, 13, 33, 31, 34, 3

.text
.globl swap 

insertionsort:
    li a4, 0        # i := 0
    li a3, 12       # n := 12

    la a2, array

for1: 
    bge a4, a3, exit1
    addi a1, a4, -1     # j := i - 1

for2: 
    bltz a1, exit2 
    li t0, 4
    mul t0, t0, a1      # t0 := 4*j
    add t0, a2, t0
    lw t1, 0(t0)        # t1 := v[k] 
    lw t2, 4(t0)        # t2 := v[k + 1]
    blt t2, t1, exit2
    j swap
    addi a1, a1, -1 

exit2: 
    addi a4, a4, -1 
    j for1

exit1: 
    li a0, 10       # beende Programm 
    ecall 


#t2 für index der beiden tauschenden werte 
swap:
    la t0, array
    #vertausch die werte v[2] und v[3]
    li t1, 4            # für speicher-itteration 
    mv t2, a1            # k := 2 t2 
    mul t1, t1, t2
    add t0, t1, t0      # adresse v[k]
    lw a2, 0(t0)        # lade v[k]
    lw a3, 4(t0)        # lade v[k + 1]
    jal apply

    ret 

apply: 
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
    



