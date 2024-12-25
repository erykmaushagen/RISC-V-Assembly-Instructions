#include <iostream>

long long tudo(int n){
    if(n <= 2) return n; 
    
    long long prev3 = 0;
    long long prev2 = 1; 
    long long prev1 = 2; 
        
    long long solution = 0;
    int index = 3; 
    while( index <= n){
        solution = prev1 + prev3; 
        prev3 = prev2; 
        prev2 = prev1; 
        prev1 = solution; 

        index++; 
    }
    return solution; 
    
}


int main(){

    int n = 59; 
    std::cout << tudo(n) << std::endl; 
    return 0; 

}