.data
n: .word 0xfffffffe
m: .word 0x7fffffff

.text
.globl main

main: 
    lui t0, 0x43111
    ori t1, t0, 0x765
    la t2, n
    sw t1, 0(t2)
    mv a1, t1
    li a0, 1
    ecall
    ret