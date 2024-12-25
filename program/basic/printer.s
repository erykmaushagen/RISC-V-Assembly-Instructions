    .text           # Hier definieren wir den Textbereich (Codebereich)
    .globl _start    # Das globale Label '_start' für den Einstiegspunkt

_start:
    li      t0, 10      # t0 = 10
    li      t1, 20      # t1 = 20

    # Funktionsaufruf: addiere t0 und t1
    jal     ra, add_numbers   

    # Ausgabe des Ergebnisses
    mv      a7, a0      # Übertrage das Ergebnis (a0) in a7 (Systemaufruf für Ausgabe)
    li      a7, 1       # Service-ID 1: Ausgabe einer Zahl (auf der Konsole)
    ecall              # Systemaufruf für Ausgabe

    # Programm beenden
    li      a7, 10      # Service-ID 10: Programm beenden
    ecall              # Systemaufruf

add_numbers:
    add     a0, t0, t1  # a0 = t0 + t1 (Ergebnis wird in a0 gespeichert)
    jr      ra           # Rückkehr zum Aufrufer (Springe zu Adresse in ra)