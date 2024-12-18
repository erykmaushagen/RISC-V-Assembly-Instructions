
    .data
array:    .word   1  #Speicherbereich in word, wo 
myresult: .word   0  #hier soll ergebnis abgespeichert werden
    
    .text
    .globl start       #markier
    
start: 
    la t1, array       # lade adresse von array in t1
    lw t0, 0(t1) 
    la t1, myresult    #erhalte adresse des eregebnisspeichers
    sw t0, 0(t1)       #lade array[0] in  myresult
    lw a0, 0(t1)       #rufe array[0] wieder ab 
    li a7, 1           #vorbereiten für ausgabe
    ecall
    li a7, 10          #vorbereiten für beenden
    ecall
    
    