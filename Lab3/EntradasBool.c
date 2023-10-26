#include <stdio.h>
#include <stdbool.h>

bool pedir_booleano(void){
    bool x;
    char res;

    printf("Por favor, ingrese V para 'Verdadero' y F para 'False: \n");
    scanf("%c", &res);

    if(res == 'V'){
        x = true;
    } else if (res == 'F'){
        x = false;
    } else {
        printf("Entrada no valida, se asumira Falso\n");
        x = false;
    }
    return x;
}

void imprime_booleano (bool x){
    if(x){
        printf("Verdadero\n");
    }else {
        printf("Falso\n");
    }
}

int main (void){
    bool miBooleano = pedir_booleano();
    imprime_booleano (miBooleano);

    return 0;
}