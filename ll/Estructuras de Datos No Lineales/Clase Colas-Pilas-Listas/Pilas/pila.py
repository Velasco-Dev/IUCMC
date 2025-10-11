import sys
import os

# Añadir la carpeta padre (Estructuras-de datos-no-lineales) al path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from introduccion import fibonacciPrimosFact

# Definición de la clase Nodo
class Nodo:

    # Definición del constructor
    def __init__(self, dato):
        # Atributo de la clase (self.dato) y variable o valor de entrada (dato)
        self.dato = dato
        # Referencia al siguiente nodo
        self.siguiente = None 

class PilaEnlazada:
    def __init__(self):
        # Indicamos el elemento tope de la pila
        self.tope = None
        # Indica el tamaño de la pila 
        self.tamanio = 0

    # Ponemos un nodo encima de la pila
    def push (self, dato):
        # Esto es un objeto con la propiedad de nodo y le pasamos dato
        nuevo = Nodo(dato)
        # Para la primera vez no apunta a ningun espacio en específico
        nuevo.siguiente = self.tope
        # Actualizamos el tope que en esta caso sería nuevo
        self.tope = nuevo
        # Es igual a lo que tiene tamaño + 1
        self.tamanio +=1

    def __str__(self):
        # Arreglo de elementos
        elementos = []
        # Objeto para recorrer el arrglo
        actual = self.tope
        # Comienza desde ahí hasta que sea nulo y ya no imprima más elementos
        while actual:
            elementos.append(str(actual.dato))
            actual = actual.siguiente
        return " --> ".join(elementos)      

# Creamos la extructura de Pila enlazada
pila = PilaEnlazada()

# Vamos poniendo encima datos
# pila.push(fibonacci)
# pila.push(20)
# pila.push(30)
# pila.push(40)
for i in fibonacciPrimosFact:
    pila.push(i)

# Se imprime la pila
print ("Pila: ",pila)