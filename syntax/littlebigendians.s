# Little endians: der am wenigsten signifikate Teil eines Wortes erhält die niedrigste Byteadresse
# Big endians: der signifikanteste Teil eines Wortes erhält die niedrigste Byteadresse


.data  
value1: .word 0x00010203 # speicherung in .data nach little endian -> 03 an 00 
value2: .word 0x03020100 
srtring: .asciiz "Esel" #in asci-hexa 45 = E ; 73 = s ; 65 = e ; 6C = l


.text
.globl _start
_start:
    la t0, value1      # Lade Basisadresse von 'value' in t0
    addi t1, zero, 3
    addi t2, zero, 2
    addi t3, zero, 1
    addi t4, zero, 0

    sb t1, 0(t0)       # Lade Byte bei Adresse t0 (Little Endian: 0x44, Big Endian: 0x11)
    sb t2, 1(t0)       # Lade Byte bei Adresse t0+1 (Little Endian: 0x33, Big Endian: 0x22)
    sb t3, 2(t0)       # Lade Byte bei Adresse t0+2 (Little Endian: 0x22, Big Endian: 0x33)
    sb t4, 3(t0)       # Lade Byte bei Adresse t0+3 (Little Endian: 0x11, Big Endian: 0x44)
    
    #lb t1, 0(t0)
    #lb t2, 1(t0)
    #lb t3, 2(t0)
    #lb t4, 3(t0) 

    li a7, 10
    ecall
