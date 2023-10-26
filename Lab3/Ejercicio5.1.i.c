#include <stdio.h>

int main (void){
    int i = 0;

    printf("Ingrese un valor para i:\n");
    scanf("%d", &i);
    printf("Estado 0 = %d\n",i);

    while (i != 0){
        printf("Estado 1 = %d\n",i);
        i = 0;
        printf("Estado 2 = %d\n",i);
    }
    printf("Estado 3 = %d\n",i);

    return 0; 
}