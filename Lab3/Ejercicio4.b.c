#include <stdio.h>
#include <stdbool.h>
#include <assert.h> 

int main (void){
    int x, y, z ,m;
    
    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);
    printf("Ingrese un valor para y: \n");
    scanf("%d", &y);
    printf("Ingrese un valor para z: \n");
    scanf("%d", &z);
    printf("Ingrese un valor para m: \n");
    scanf("%d", &m); 

    printf("El estado 0: x=%d, y=%d, z=%d, m=%d\n",x,y,z,m);
        if (x < y)
        {
            m=x;
        }
        else {
            m=y;
        }

    printf ("El estado 1: x=%d y=%d z=%d m=%d,\n",x,y,z,m);
        if (m < z)
        {
            m=m;   
        }
        else {
            m=z;
        }

    printf ("El estado 2: (x=%d y=%d z=%d m=%d)\n",x,y,z,m);

    return 0; 
}