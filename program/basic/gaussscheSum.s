# int n = 10;
# int sum = 0
# for(int i = 0; i <= n; i++){
#     sum += i;
# }
# //ausgabe sum

.data
n: .word 0xA            #n = 10 
sum: .word 0x0          #summe im speicher
printertext: .asciiz "aktuelle Sum ist:\n"
umbruch: .asciiz "\n"

.text
.globl main

main: 
    la t0, n
    lw a2, 0(t0)        # n = 14 addiert mit 1 für loop vergleich 
    addi a2, a2, 1      # n= 15 für loop bedingung 
    addi a3, zero, 0    # sum = 0
    addi a4, zero, 0      # i = 0
    j for 

for:
    bge a4, a2, exit    # i >= n
    add, a3, a3, a4     # sum+= i
    addi a4, a4, 1      #i++
    j printer           #print function
    j for

printer: 
    la t2, printertext  #lade Adresse von string
    addi a1, t2, 0      #lade das auszugebende wort in Reg[a0]
    li a0, 4            #4 für string-ecall Ausgabe
    ecall
    addi a1, a3, 0
    li a0, 1
    ecall
    la t2, umbruch
    addi a1, t2, 0
    li a0, 4
    ecall
    j for
exit: 
    la t0, sum
    sw a3, 0(t0)        #Speicher = Reg[3] bzw. sum 
    addi a0, x0, 10     #10: abbruch ecall
    ecall