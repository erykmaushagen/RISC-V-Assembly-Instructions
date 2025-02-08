# int lcm(int a, int b) {
#     int max = (a > b) ? a : b;
#     while (true) {
#         if (max % a == 0 && max % b == 0) {
#             return max;
#         }
#         ++max;
#     }
# }

.data 
a: .word 7 
b: .word 5

.text 
.globl main
main: 
