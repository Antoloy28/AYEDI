#include <stdio.h>
#include <assert.h>

int main (void){
    int x;
    x = 0;

    printf("Ingrese un valor para x:\n");
    scanf("%d", &x);

    assert(x == 1);

    printf("El programa devuelve x = %d\n",x);
    x = 5;
    printf("El programa devuelve x = %d\n",x);

    return 0;
} 