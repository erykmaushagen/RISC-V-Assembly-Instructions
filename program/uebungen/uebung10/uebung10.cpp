#include <iostream>

int tudo(int n){
    if(n <= 2) return n;
    else{
        return tudo(n - 1) + tudo(n - 3);
    }
}



int main(){

    int n = 13; 
    std::cout << tudo(13) << std::endl; 

    return 0; 
}