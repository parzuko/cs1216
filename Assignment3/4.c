#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int naive_square (int n) {
    int i, sum = 0;
    for (i = 1; i <= n; i++) {
        sum = sum +  (int) pow(i, 2);
    }
    return sum;
}

int interesting_square (int n) {
    int sum = 0;
    sum = (n * (n + 1) * (2 * n + 1)) / 6;
    return sum;
}

int main (void) {
    int n;
    scanf("%d", &n);

    if (n <= 0) {
        printf("Invalid Input Bro\n");
        return 0;
    }

    int naive = naive_square(n);
    int interesting = interesting_square(n);

    printf("Naive: %d\n", naive);
    printf("Interesting: %d\n", interesting);
    return 0;

}
