.text
.globl main

main:
    li a0, 5          # a0 = 5
    li a1, 10         # a1 = 10

    # Adresse der Variablen auf den Stack legen
    addi sp, sp, -8    # Platz für 2 Adressen (je 4 Bytes) auf dem Stack reservieren
    sw a0, 4(sp)       # Adresse von a0 auf den Stack legen
    sw a1, 0(sp)       # Adresse von a1 auf den Stack legen

    jal ra, add_numbers

    li a0, 1           # Systemaufruf für Ausgabe
    ecall              # Ausgabe des Ergebnisses (die geänderten Werte)

    li a0, 10          # Systemaufruf für Programmende
    ecall

# Funktion add_numbers: Addiert zwei Zahlen (Call by Reference)
add_numbers:
    # Lade die Adressen von a0 und a1
    lw t0, 4(sp)       # t0 = Adresse von a,,60
    lw t1, 0(sp)       # t1 = Adresse von a1

    # Lade die Werte der Adressen
    lw t2, 0(t0)       # t2 = Wert von a0 (5)
    lw t3, 0(t1)       # t3 = Wert von a1 (10)

    # Führe die Addition durch und speichere das Ergebnis zurück an die Adressen
    add t2, t2, t3     # t2 = t2 + t3 (Ergebnis = 15)
    sw t2, 0(t0)       # speichere das Ergebnis zurück in a0
    sw t2, 0(t1)       # speichere das Ergebnis zurück in a1 (obwohl hier beide gleich sein werden)

    jr ra              # Rückkehr zur aufrufenden Funktion
