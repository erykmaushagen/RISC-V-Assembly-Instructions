# switch(k) {
# case 0: f=i+j; break; /* k=0 */
# case 1: f=g+h; break; /* k=1 */
# case 2: f=g-h; break; /* k=2 */
# case 3: f=i-j; break; /* k=3 */
# } 

.data 
startaddress: .word switch   # speichert demanch 0x00000000 für PC-default adresse 
jumptable: .word L0, L1, L2, L3
#speichert  adressen der switch labels


.text 
.globl switch
switch: 
    li a1, 0            # a1 initialisiere das Ergebnis-register 
    li t0, 2            # k := 2 für L2
    li t1, 4            # 4 für sprung im Speicher
    mul t3, t1, t0      # cur := 4 * k
    
    la t4, jumptable
    add t3, t3, t4
    lw t2, 0(t3)        # t2 := address[speiche[L1]] 
    jr t2               # adresse von Lx ist in t2

L0:     
    addi a1, x0, 0
    li a0, 1
    ecall 
    li a0, 10 
    ecall

L1:
    addi a1, x0, 1
    li a0, 1
    ecall 
    li a0, 10 
    ecall

L2: 
    addi a1, x0, 2
    li a0, 1
    ecall 
    li a0, 10 
    ecall
L3:
    addi a1, x0, 3
    li a0, 1
    ecall 
    li a0, 10 
    ecall