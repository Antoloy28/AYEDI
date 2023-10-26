#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

bool es_vocal (char letra){
    letra = tolower(letra);
    return (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u'); 
}

char pedir_char (){
    char caracter;
    printf("Ingrese un caracter: ");
    scanf("%c", &caracter);

    return caracter;
}

int main (void){
    char letra = pedir_char();

    if (es_vocal(letra)){
        printf("El caracter %c es una vocal\n",letra);
    }else {
        printf("El caracter %c no es una vocal \n",letra);
    }

    return 0;
}