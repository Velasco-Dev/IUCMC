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

class ColaEnlazada:
    def __init__(self):
        self.frente = None
        self.ultimo = None
        self.tamanio = 0

    def insertar(self, dato):
        nuevo = Nodo(dato)
        nuevo.siguiente = self.ultimo
        self.ultimo = nuevo
        self.tamanio +=1

    def __str__(self):
        elementos = []
        actual = self.ultimo
        while actual:
            elementos.append(str(actual.dato))
            actual = actual.siguiente
        return " --> ".join(elementos)

    
cola = ColaEnlazada()

for i in fibonacciPrimosFact:
    cola.insertar(i)
# cola.insertar(10)
# cola.insertar(20)
# cola.insertar(30)

print("Cola: ", cola)