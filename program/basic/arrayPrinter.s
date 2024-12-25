

.data 
array: .word 1,2,3,4,5
umbruch: .asciiz "\n"

.text 
.globl main 

main: 
    la t0, array       #lade adrrese von array-label 
    addi a2, t0, -4     #-4 vor printer aufruf
    addi a3, t0, 20     #bestimme ende des arrays
    j printer

printer: 
    addi a2, a2, 4      #lade array ein
    bge a2, a3, exit
    lw a1, 0(a2) 
    addi a0, x0, 1
    ecall      
    la a1, umbruch      #Zeilenumbruch      
    li a0, 4            #!!!!! strings direkt in ausgabe register laden !!!!!
    ecall
    j printer
    
exit: 
    addi, a0, x0, 10    #Programm-ende
    ecall


#RARS-Simulator: 
# .data 
# array: .word 1,2,3,4,5
# umbruch: .asciz "\n"

# .text 
# .globl main 

# main: 
#     la t0, array       #lade adrrese von array-label 
#     addi a2, t0, -4     #-4 vor printer aufruf
#     addi a3, t0, 20     #bestimme ende des arrays
#     j printer

# printer: 
#     addi a2, a2, 4      #lade array ein
#     bge a2, a3, exit
#     lw a0, 0(a2) 
#     li a7, 1
#     ecall      
#     la a0, umbruch      #Zeilenumbruch      
#     li a7, 4            #!!!!! strings direkt in ausgabe register laden !!!!!
#     ecall
#     j printer
    
# exit: 
#     addi, a7, x0, 10    #Programm-ende
#     ecall


