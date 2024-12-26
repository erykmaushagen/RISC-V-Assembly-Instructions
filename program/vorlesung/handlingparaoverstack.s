.text
.globl main

main:
    li a0, 5          
    li a1, 10  

    # Parameter über den Stack übergeben
    addi sp, sp, -8    # Platz für 2 Parameter (je 4 Bytes) auf dem Stack reservieren
    sw a0, 4(sp)       # speichere a0 (5) auf dem Stack
    sw a1, 0(sp)       # speichere a1 (10) auf dem Stack

    jal ra, add_numbers

    li a0, 1           
    ecall              

    li a0, 10          
    ecall
    
add_numbers:
    # Die Parameter werden vom Stack geladen
    lw a0, 4(sp)       # lade den ersten Parameter (a0) von 4(sp)
    lw a1, 0(sp)       # lade den zweiten Parameter (a1) von 0(sp)

    add a1, a0, a1     # a1 = a0 + a1 (Summe)

    # Platz auf dem Stack freigeben
    addi sp, sp, 8     # gebe 8 Bytes (Platz für 2 Parameter) frei

    jr ra            
