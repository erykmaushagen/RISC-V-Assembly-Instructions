

.text
.globl main
main:
    li a1, 555
    # caller save: Aufrufende Prozedur (main) rettet vor Unterprogrammaufruf 
    # Registerinhalte und kopiert sie danach zurück
    addi sp, sp, -8        # Platz für ra und a0 auf dem Stack reservieren
    sw   ra, 4(sp)         
    sw   a1, 0(sp)         

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
    # callee save: Gerufene Prozedur rettet nach dem Unterprogramm-Aufruf diese Registerinhalte 
    # und kopiert sie vor dem Rücksprung zurück.
    addi sp, sp, -8        # Platz für ra und a0 auf dem Stack reservieren
    sw   ra, 4(sp)         
    sw   a1, 0(sp)         

    #wert in a1 nur lokal existend
    li a1, 444

    lw   a1, 0(sp)         # lade a0 zurück
    lw   ra, 4(sp)         # lade Rücksprungadresse zurück
    addi sp, sp, 8         # gebe Stackplatz frei
    jr   ra                
