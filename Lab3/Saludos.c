#include <stdio.h>

void imprimir_hola (void){
    printf("Holaaa\n");
}

void imprime_chau (void){
    printf("Chauuu\n");
}

int main (void){
    imprimir_hola();
    imprimir_hola();
    imprime_chau();
    imprime_chau();

    return 0;
}