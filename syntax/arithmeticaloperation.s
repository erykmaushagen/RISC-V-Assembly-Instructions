.data 
value1: .word 0xffffffff
value2: .word 0x00000010

.text
.globl main
main: 
    la t0, value1
    lw t1, 0(t0)
    lw t2, 4(t0)
    mul a1, t1, t2  	#ausgabe mul für die unteren 32 Bit 0xfffffffe
    sw a1, 8(t0) 
    jal ra, printer
    mulhsu a1, t1, t2     #ausgabe mul für die oberen 32 Bit 0x00000001
    sw a1, 12(t0) 
    jal ra, printer
    
    addi a0, x0, 10
    ecall

printer: 
    addi a0, x0, 1	
    ecall
    addi a1, x0, 0x0A
    addi a0, x0, 1
    ecall
    jalr x0, ra, 0
