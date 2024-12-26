
#include <iostream>

void swap(int array[], int a, int b);
void printer(int array[], int n);

void insertionSort(int array[], int n){
    for(int i = 0; i < n; i++){
        for(int j = i - 1; j >= 0 && array[j] > array[j + 1]; j--){
            swap(array, i, j);        
        }
    }

}

void swap(int array[], int a, int b){
    int temp = array[a];
    array[a] = array[b];
    array[b] = temp;
    return; 
}

void printer(int array[], int n){
    for(int i = 0; i < n; i++){
        std::cout << array[i] << std::endl; 
    }
}


int main(){

    int array[] = {1,41,5,35,3,5,423,34,243,4,5,6,2,235};
    int n = sizeof(array)/sizeof(array[1]);
    insertionSort(array, n);
    printer(array, n);

    

    return 0;
}