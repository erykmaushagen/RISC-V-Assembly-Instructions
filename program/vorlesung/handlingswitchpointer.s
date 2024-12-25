

.text
.globl main
main:
    li a1, 555
    # Vor dem Funktionsaufruf Stack vorbereiten
    addi sp, sp, -8        # Platz für ra und a0 auf dem Stack reservieren
    sw   ra, 4(sp)         # speichere Rücksprungadresse
    sw   a1, 0(sp)         # speichere a0

    jal  ra, function     

    lw   a1, 0(sp)        
    lw   ra, 4(sp)        
    addi sp, sp, 8         
    #ausgabe:
    li a0, 1
    ecall
    li a0, 10 
    ecall

function:
    addi sp, sp, -8        # Platz für ra und a0 auf dem Stack reservieren
    sw   ra, 4(sp)         # speichere Rücksprungadresse
    sw   a1, 0(sp)         # speichere a0

    #wert in a1 nur lokal existend
    li a1, 444
    # Hier kann die Funktion ihren Code ausführen

    lw   a1, 0(sp)         # lade a0 zurück
    lw   ra, 4(sp)         # lade Rücksprungadresse zurück
    addi sp, sp, 8         # gebe Stackplatz frei
    jr   ra                
