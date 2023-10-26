#include <stdio.h>
#include <assert.h>

int main(void){
    int x;
    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);

    if(x >= 0){
        x = x;
    } else {
        x = x * (-1);
    }
    printf("El valor absoluto de x es: %d\n",x);

    return 0;
}