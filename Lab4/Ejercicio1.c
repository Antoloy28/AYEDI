#include <stdio.h>
#include <assert.h>

void hola_hasta (int n) {
    int i = 0;
    while (i < n){
        i = i + 1;
        printf("Hola\n");
    }
}

int main (void){
    int n;
    printf("Ingrese un valor: \n");
    scanf("%d", &n);
    assert(n > 0);
    hola_hasta(n);

    return 0;
}