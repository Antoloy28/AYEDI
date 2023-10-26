#include <stdio.h>
#include <assert.h>

int main (void){
    int x, y;
    
    printf("Ingrese un valor para x: \n");
    scanf("%d", &x); 
    printf("Ingrese un valor para y: \n");
    scanf("%d", &y); 

    assert(x == 3 && y == 1);

    if (x >= y)
        (x = 0);
    else (x = 2);

    printf("El valor de x es : %d\n",x);

    return 0;
}