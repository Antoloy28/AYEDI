#include <stdio.h>

int pedir_entero (void){
    int x;

    printf("Ingrese un valor: \n");
    scanf("%d", &x);

    return x;
}

void imprimir_entero (int x){
    printf("El valor que usted ingreso es: %d\n",x);
}

void ejercicio4b (int x, int y, int z, int m){
    printf("s0:\n");
    imprimir_entero(x);
    imprimir_entero(y);
    imprimir_entero(z);
    imprimir_entero(m);

    if (x < y){
        m = x;
    }else if (x >= y){
        m = y;
    }

     printf("s1:\n");
    imprimir_entero(x);
    imprimir_entero(y);
    imprimir_entero(z);
    imprimir_entero(m);

    if (m < z){
        ;
    }else if (m >= z){
        m = z;
    }

     printf("s2:\n");
    imprimir_entero(x);
    imprimir_entero(y);
    imprimir_entero(z);
    imprimir_entero(m);
}

int main (void){
     int x, y, z ,m;
    
    x = pedir_entero();
   
    y = pedir_entero();
  
    z = pedir_entero();
   
    m = pedir_entero();

   ejercicio4b(x,y,z,m);

   return 0;

    
}