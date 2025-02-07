# bool is_prime(int value){
#     if(value%2 == 0) return false;
#     if(value < 2) return false; 
#     for(int index = 3; index * index < value; index +=2){
#         if(value%index == 0) return false; 
#     }
#     return true; 
# } 