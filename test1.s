

li x11,	
li x10,
slli x13, x11,
or x12, x13, x10	
li x10, 
xor x10, x10, x12	
slli x12, x12, 
li x11, 
mul x11, x10, x11	
li x10,
and x11, x11,x10	
slli x10, x11, 1	
li x11,
or x13, x10, x11	
add x13, x13, x12	
li x11, 
sub x12, x13, x11