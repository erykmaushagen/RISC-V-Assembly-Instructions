
.data
n: .word 58
umbruch: .asciiz "\n"

.text
.globl main 
#2035586497
main: 
    la t0, n    
    lw a7, 0(t0)            #speichere n 
    addi a1, x0, 0          #sol = -1
    li t0, 3
    blt a7, t0, sonderfall #wenn n <= 2 gebe nur n zurück
                            #funktionausaufruf vorbereiten mit initalisierungsgrößen
    addi a1, x0, 0
    jal printer
    addi a1, x0, 1
    jal printer
    addi a6, x0, 3         # da index = 3 startet
    addi a2, x0, 2          # f(n - 1) = 2
    addi a3, x0, 1          # f(n - 2) = 1 
    addi a4, x0, 0          # f(n - 3) = 0
    j loop

loop: 
    blt a7, a6,  exit       # wenn  index > n 
    add a1, a2, a4          # sol = f(n - 1) + f(n - 3) 
    jal printer
    addi a4, a3, 0          # f(n - 3) = f(n - 2)
    addi a3, a2, 0          # f(n - 2) = f(n - 1) 
    addi a2, a1, 0          # f(n - 1) = sol
    addi a6, a6, 1
    j loop

printer: 
    addi a0, x0, 1
    ecall
    addi t1, a1, 0
    la t2, umbruch 
    addi a1, t2, 0
    addi a0, x0, 1
    li a0, 4
    ecall
    addi a1, t1, 0
    jr ra

sonderfall: 
    addi a1, a7, 0
    addi a0, x0, 1
    ecall
    ret

exit: 
    addi a0, x0, 10
    ecall 