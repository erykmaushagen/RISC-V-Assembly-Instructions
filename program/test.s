    .text
    .globl main

main:
    li x11, 0xDE
    li x10, 0xAD
    slli x13, x11, 8	
    or x12, x13, x10	
    li x10, 0xCFBC
    xor x10, x10, x12	
    slli x12, x12, 0x010	
    li x11, 0x0007
    mul x11, x10, x11	
    li x10, 0x5FFF		
    and x11, x11, x10
    slli x10, x11, 1	
    li x11, 0x9001	
    or x13, x10, x11	
    add x13, x13, x12	
    li x11, 0x9342
    sub x12, x13, x11
    li a7, 1
    ecall