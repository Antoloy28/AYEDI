#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int main (void){
    int x,i;
    bool res;
    i = 2;
    res = true;

    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);
    printf("Ingrese un valor para i: \n");
    scanf("%d", &i);
    printf("Ingrese 1 para True o 0 para False \n");
    scanf("%d", &res);

    while(i < x && res){
        res = res && ((x % i) != 0);
        i = i + 1;

        printf("El valor de x es %d, el valor de i es %d y el valor de res es %d\n",x,i,res);
    }

    printf("Tu valor ingresa es un primo si ves un 1 y no lo es si ves un 0\n");
    printf("Valor = %d\n",res);

    return 0;

}