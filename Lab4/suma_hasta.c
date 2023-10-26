#include <stdio.h>
#include <assert.h> 

int suma_hasta (int N){
    int suma;
    suma = (N * (N+1))/2;
    return suma;
}

int main (void){
    int N;
    printf("Ingrese un valor para N:  \n");
    scanf("%d", &N);

    assert(N > 0);
    if (N > 0){
        suma_hasta(N);
    }else {;}
    printf("El resultado es: %d\n",(N * (N+1))/2);

    return 0;
}