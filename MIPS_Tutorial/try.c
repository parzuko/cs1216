#include <stdio.h>

int main()
{

    int a, b, x, y, p, q;
    printf("Enter any two numbers: ");
    scanf("%d %d", &a, &b);

    x = b / a;

    y = x || x;

    p = a - y * (a - b);

    q = b + y * (a - b);

    printf("%d > %d", p, q);

    return 0;
}


int isitGreater(int x, int y) {
    return (((y+((~x)+1)) >> 31) & 1);
}