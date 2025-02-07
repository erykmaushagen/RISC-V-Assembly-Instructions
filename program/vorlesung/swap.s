
.data
v: .word 1, 2, 3, 4, 5, 6 , 7

.text
.globl main 

main:
    #funktionsargumente (müssen nicht gesaved werden): 
    la a0, v        # lade Addresse von swap
    li a1, 2        # k = 2

    #caller save
    addi sp, sp, -16
    sw t0, 0(sp)
    sw a2, 4(sp)
    sw a3, 8(sp)
    sw ra, 12(sp) 

    #funktionsaufruf
    jal swap

    lw t0, 0(sp)
    lw a2, 4(sp)
    lw a3, 8(sp)
    lw ra, 12(sp) 
    addi sp, sp, 16


    li a0, 10
    ecall 

swap: 
    li t0, 4
    mul t0,  t0, a1     # Reg[5]:=4*k
    add t0,  a0, t0     # Adresse v[k]
    lw a2, 0(t0)      # v[k]
    lw a3, 4(t0)      # v[k+1]
    sw a3, 0(t0)      # v[k]:=v[k+1]
    sw a2, 4(t0)      # v[k+1]:=temp

    #jalr x0, ra, 0
    jr ra
    



