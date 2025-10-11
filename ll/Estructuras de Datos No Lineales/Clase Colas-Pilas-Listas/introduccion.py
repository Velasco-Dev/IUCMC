# En range hay tres elementos. Cuando se pone uno sólo es la cantidad de ciclos
# Si ponemos (1,6), va desde 1 hasta 6
# Si (1,6,2), va desde 1 hasta 6 pero de 2 en dos. [inicio parada e incremento]

# 5 = 5x4x3x2x1 (120)

fibonacciPrimosFact = []
def factorial(num):
    
    fact = 1 

    for x in range (2, num+1):
        fact = fact * x
    
    return fact

def primo(num):

    for x in range (2, num // 2 + 1):
        if num % x == 0:
            return False
    return True

def fibonacci(num):
    a = b = 1
    print(a)
    print(b)

    for x in range(num):
       
        c = a + b
        a = b
        b = c
        
        if primo(c):
            print( f"{c} No es primo" if primo(c) == False else f"{c} Es primo")    
            fibonacciPrimosFact.append(factorial(c))

            print("Array Aqui ",fibonacciPrimosFact)
            print(f"{c} No es primo ", factorial(c))
    
    return fibonacciPrimosFact
# print(factorial(5))
# mera tu sabe, eto' son lo' primo' que exiten' entre lo' primero' die' digito de la serie fibonazi cabron, KAROL G, BRRR
# Bebesiiiitaaa ua ua 
fibonacci(5)