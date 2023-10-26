#include <stdio.h>
#include <assert.h>

struct div_t{
    int cociente;
    int resto;
}; 

struct div_t division (int x, int y){
    struct  div_t resultado;
    resultado.cociente = x / y;
    resultado.resto = x - resultado.cociente * y; 
    return resultado;
}

int main (void){
    int x,y;
    printf("Ingrese un valor para el dividendo : ");
    scanf("%d",&x);
    printf("Ingrese un valor para el divisor :");
    scanf("%d", &y); 

    if (y == 0){
        printf("ERROR: no puede ser nulo");
    }else {
        struct div_t resultado = division (x,y);
        printf("Cociente %d\n",resultado.cociente);
        printf("Resto %d\n", resultado.resto);
    }

    return 0;
}