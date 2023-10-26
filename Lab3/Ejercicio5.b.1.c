#include <stdio.h>
#include <assert.h>

int main (void){
    int x,y,i;
    i = 0;

    printf("Ingrese un valor para la variable x: \n");
    scanf("%d", &x);
    printf("Ingrese un valor para la variable y: \n");
    scanf("%d", &y);
    printf("Ingrese un valor para la variable i: \n");
    scanf("%d", &i);
    printf("El estado 0 es: %d\n",i);

    while(x >= y){
        x = x - y;
        i = i + 1;
    }

    printf("El estado %d tiene x = %d, y = %d, i = %d\n",i,x,y,i);

    return 0;
}