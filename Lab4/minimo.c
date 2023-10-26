#include <stdio.h>
#include <assert.h>
 
int main (void){
    int x, y;
    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);
    printf("Ingrese un valor para y: \n");
    scanf("%d", &y);

    if (x < y){
        printf ("El minimo es: %d\n",x);
    }else {
        printf("El minimo es: %d\n",y);
    }
    return 0;
}