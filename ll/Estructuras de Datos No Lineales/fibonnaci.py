#Primos
def esPrimo (n):
    c= 0
    for i in range(2,n,1):
        if n % i == 0:
            c = c + 1                                       
        if c > 0:
            return False
        else:
            return True

#Factorial
def factorial(c):
    fact = 1
    for i in range (2,c+1,1):
        fact *= i
        acortado = f"{fact:.4e}"
    print(f"Su factorial es: ",factorial)
    print(f"Su factorial acortado es: ",acortado)
  

#Serie de Fibbo
a=b=1
for i in range (1,10,1):
    c = a + b
    a = b
    b = c
    print("\nEl numero: ", c)
    if esPrimo(c):
        print("\tEs primo")
        factorial(c)
    else:
        print("\tNo es primo")


        

