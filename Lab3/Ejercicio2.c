#include <stdio.h> 

int main (void) {

    int x = 4, y =-4, z=8, b=1, w=1;

    printf("x %% 4 == 0 = %d\n", x % 4 == 0);
    printf("x + y == 0 && y - x == (-1) * z = %d\n", x + y == 0 && y - x == (-1) * z);
    printf("not b && w = %d\n", !(b && w));

    return 0;
}

/*
x= 4, y=-4, z=8, b=1, w=1
x % 4 == 0 = 1
x + y == 0 && y - x == (-1) * z = 1
not b && w = 0 

donde 1 es TRUE y 0 es FALSE 
*/