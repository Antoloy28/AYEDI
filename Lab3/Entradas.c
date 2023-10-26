#include <stdio.h>

int pedir_entero (void){
    int x;

    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);

    return x;
}

void imprimir_entero (int x){
    printf("El valor que usted ingreso es: %d\n",x);
}

int main (void){
    imprimir_entero (pedir_entero ());

    return 0;

}