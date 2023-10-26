#include <stdio.h>
#include <assert.h>

int main (void){
    int x, y;
    x = 0;
    y = 0;

    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);
    printf("Ingrese un valor para y: \n");
    scanf("%d", &y);

    assert(x == 2 && y == 5); 

    x = x + y;
    y = y + y; 

    printf("El resultado es x = %d y = %d\n", x ,y);

    return 0;    
}