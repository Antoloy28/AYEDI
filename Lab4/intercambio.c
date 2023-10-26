#include <stdio.h>

int main (void){
    int x,y,z;

    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);
    printf("Ingrese un valor para y:\n");
    scanf("%d", &y);
    printf("Ingrese un valor para z:\n");
    scanf("%d", &z);

    z = x;
    x = y;
    y = z; 

    printf("El nuevo valor de x es: %d\n", x);
    printf("El nuevo valor de y es: %d\n", y);
    printf("El nuevo valor de z es: %d\n", z);

    return 0; 

}