#basic mechanismn of jump and links 

.globl main
main:   
    jal ra, function 
    addi a1, x0, 2
    li a0, 1
    ecall
    li a0, 10
    ecall
    


function: 
    addi sp, sp, -8        # Speicherplatz auf dem Stack reservieren    
    sw ra, 4(sp)           # Sichere Rücksprungadresse
    sw a1, 0(sp)           # Sichere a1
    addi a1, x0, 1
    li a0, 1
    ecall
    lw ra, 4(sp)           # Wiederherstellen der Rücksprungadresse
    lw a1, 0(sp)           # Wiederherstellen von a1
    addi sp, sp, 8         # Speicherplatz auf dem Stack freigeben
    jalr x0, ra, 0          # wieso funtkioniert hier die funktion mit ret, allerdings nicht wie mit dem gegebenen code
    #ret := jal x0, ra, 0
