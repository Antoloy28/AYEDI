#include <stdio.h>
#include <assert.h> 

int main (void){
    int i;

    printf("Ingrese un valor para i : \n");
    scanf("%d", &i);
    printf("El estado 0 es = %d\n",i);

    while (i != 0){
        printf("Estado 1 = %d\n",i);
        i = i - 1;
        printf("Estado 2 = %d\n",i);
    }

    printf("Estado 3 = %d\n",i);

    return 0;
}