.text
.globl main

main:
    li a0, 5          # a0 = 5
    li a1, 10         # a1 = 10

    jal ra, add_numbers

    # Ausgabe des Ergebnisses
    li a0, 1           # Systemaufruf für Ausgabe
    ecall              # Ausgabe des Ergebnisses (die Summe von 5 und 10)

    li a0, 10          # Systemaufruf für Programmende
    ecall

# Funktion add_numbers: Addiert zwei Zahlen
add_numbers:
    # Die Parameter sind Kopien (Call by Value)
    # a0 und a1 enthalten die Werte 5 und 10
    add a0, a0, a1     # a0 = a0 + a1 (Ergebnis = 15)

    jr ra              # Rückkehr zur aufrufenden Funktion