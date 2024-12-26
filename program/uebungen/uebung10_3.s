# Programm für RARS-Simulator 
.data
x: .word 10
space: .asciiz ","

.text
.globl main

main:
    la t0, x
    lw s1, 0(t0)
    li t0, 0 

loop:
    addi sp, sp, -8
    #sw s1, 0(sp)
    #sw ra, 4(sp)
    mv a2, t0
    jal ra, unbekannt
    #lw ra, 4(sp)
    #lw s1, 0(sp)
    addi sp, sp, 8
    mv a1, a2           # neu 
    li a0, 1
    ecall
    li a0, 4
    la a1, space
    ecall
    addi t0, t0, 1
    ble t0, s1, schleife
    li a0, 10
    ecall

unbekannt:
  addi t0, x0, 0

schleife:
  beqz a2, break
  add t0, t0, a0
  addi a2, a2, -1
  j schleife

break:
    mv a2, t0 
    jr ra