"""
Recursive functions in Python

Gilberto Echeverria
2024-02-23
"""

def fib(n):
    if n == 0 or n ==1:
        return n
    return fib(n - 1) + fib(n - 2)

def fact(n):
    if n == 0:
        return 1
    return n * fact(n - 1)
