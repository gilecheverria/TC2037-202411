/*
 * Program to compute the factorial of a number
 * using multiple functions
 *
 * Gilberto Echeverria
 * 2024-05-28
 */

// Include libraries
#include<stdio.h>
#include<stdlib.h>

// Function declarations
unsigned long fact_recursive(int n);

// Entry function
int main(int argc, char* argv[])
{
    int n;
    unsigned long result;

    printf("Hello, I am %s\n", argv[0]);

    if (argc == 2) {
        n = atoi(argv[1]);
    } else {
        printf("Enter the number to compute: ");
        scanf("%d", &n);
    }

    result = fact_recursive(n);
    printf("The factorial of %d is %lu\n", n, result);

    return 0;
}

unsigned long fact_recursive(int n)
{
    if (n == 1) {
        return 1;
    } else {
        return n * fact_recursive(n - 1);
    }
}


