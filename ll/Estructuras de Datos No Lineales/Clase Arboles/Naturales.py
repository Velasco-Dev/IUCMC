n = int(input('Ingresa un valor: '))

def suma_naturales(n):
    if n==1:
        return 1 #Caso base
    else:
        return n + suma_naturales(n-1) #Caso recursivo
    
resultado = suma_naturales(n) 
    
print(f"La suma de los primeros {n} es: ", resultado)