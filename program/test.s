.data
n: .word 13

.text
.globl solution

solution:
    lw a1, n
    addi sp, sp, -4
    sw ra, 0(sp)

    jal tudo

    lw ra, 0(sp)
    addi sp, sp, 4

    # Ausgabe des Ergebnisses
    li a0, 1
    ecall

    li a0, 10
    ecall
    ret

tudo:
    addi sp, sp, -12
    sw a1, 0(sp)
    sw ra, 4(sp) 
    sw t1, 8(sp)

    li t0, 2
    ble a1, t0, base_case

    # Rekursiver Aufruf tudo(n - 1)
    addi a1, a1, -1
    jal tudo
    mv t1, a1  # Ergebnis von tudo(n - 1) in t1 speichern

    # Rekursiver Aufruf tudo(n - 3)
    lw a1, 0(sp)  # Ursprünglichen Wert von n wiederherstellen
    addi a1, a1, -3
    jal tudo
    add a1, a1, t1  # Ergebnis von tudo(n - 1) + tudo(n - 3) in a0

    
    lw ra, 4(sp)
    lw t1, 8(sp)
    addi sp, sp, 12
    ret

base_case: 
    lw ra, 4(sp)
    addi sp, sp, 12
    ret