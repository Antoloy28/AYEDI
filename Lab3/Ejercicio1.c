#include <stdio.h>

int main (void){
    int x,y,z;

    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);
    printf("Ingrese un valor para y: \n");
    scanf("%d", &y);
    printf("Ingrese un valor para z: \n");
    scanf("%d", &z);

    printf("x + y + 1 = %d\n", x + y + 1);
    printf("z * z + y  * 45 - 15  * x = %d\n", z * z + y  * 45 - 15  * x);
    printf("y - 2 == (x * 3 + 1) %% 5 = %s\n", (y - 2 == (x * 3 + 1) % 5) ? "True" : "False");
    printf ("y / 2 * x = %d\n", y / 2 * x);
    printf("y < x * z = %s\n", y < x * z ? "True" : "False"); 

    return 0;
}
/* x = 7, y = 3, z = 5

x + y + 1 = 11
z * z + y  * 45 - 15  * x = 55
y - 2 == (x * 3 + 1) % 5 = False
y / 2 * x = 7
y < x * z = True

x = 1, y = 10, z = 8

x + y + 1 = 12
z * z + y  * 45 - 15  * x = 499
y - 2 == (x * 3 + 1) % 5 = False
y / 2 * x = 5
y < x * z = False
*/

/* en la ultima expresion, que tipo tiene en lenguaje C ?
daria true o false, porque es como si estuviera preguntando si tal cosa es menor a tal cosa xd, osea en un booleano. 
*/