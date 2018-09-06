
#include "../GPU/matrixMultiplication.h"
#include <stdio.h>

void printArray(int n,int skip,int * c){

    for(int i=0;i<n;i++){
        if(i % skip ==0) printf("\n");
        printf("%d ",c[i]); 
    }
    printf("\n");

}

int main(int argc, char ** argv){

    int * a = new int[4];
    int * b = new int[4];
    int * c = new int[4];

    int i;
    for(i=0;i<4;i++){
        a[i]=i;
    }

    for(i=4;i<8;i++){
        b[i-4]=i;
    }
   
    int * run = new int[6];
    for(int i=0;i<6;i++)
        run[i]=1;
    run[3]=32;

    GPUMatrixMultiplication(2,a,b,c,run);

    int * correct = new int[4];

    correct[0]=6;
    correct[1]=7;
    correct[2]=26;
    correct[3]=31;

    bool test = true;

    for(i=0;i<4;i++){
        if(c[i] != correct[i]){
            test = false;
        }
    }

    if (test) printf("Test from gpu: passed.\n");
    else{
        printf("Test from gpu: failed.\n");
        printf("Expected:\n");
        printArray(4,2,correct);
        printf("Received:\n");
        printArray(4,2,c);
    }

    delete [] a;
    delete [] b;
    delete [] c;
    delete [] correct;

}
