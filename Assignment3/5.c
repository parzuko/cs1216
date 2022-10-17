#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int get_string_length(char *string) {
    int length = 0;
    while (string[length] != 0) {
        length++;
    }
    return length;
}

int main (void) {
    // take string input should be less than 50 chars
    char str[51];
    printf("Enter a string: ");
    
    // 51 char long input into str
    fgets(str, 51, stdin);


    int start = 0;
    int end = get_string_length(str) - 2;

    while (start <= end) {
        if (str[start] != str[end]) {
            printf("No, the string is not a palindrome.\n");
            return 0;
        }
        start++;
        end--;
    }

    printf("Yes, the string is a palindrome.\n");
    return 0;
}