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
    mv a1, t0           # Setze t0 in a1 für die Ausgabe.
    li a0, 1
    ecall                # Ausgabe der Zahl.
    li a0, 4
    la a1, space
    ecall                # Ausgabe des Kommas.
    addi t0, t0, 1       # Inkrementiere t0.
    ble t0, s1, loop     # Wiederhole, solange t0 <= s1.
    li a0, 10
    ecall                # Neue Zeile.