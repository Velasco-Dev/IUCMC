# Lista doblemente encadenada circular
import sys
import os

# Añadir la carpeta padre (Estructuras-de datos-no-lineales) al path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from introduccion import fibonacciPrimosFact

class Nodo:
    def __init__(self, dato):
        self.dato = dato
        self.siguiente = None
        self.anterior = None

class ListaDoblementeEnlazadaCircular:
    def __init__(self):
        self.cabeza = None
        # self.cola = None
        self.tamanio = 0

    def insertar_inicio(self, dato):
        nuevo = Nodo(dato)
        if self.cabeza is None:  # lista vacía
            self.cabeza = nuevo

            nuevo.siguiente = nuevo
            nuevo.anterior = nuevo
            
            # self.cola = nuevo
        else:
            # cola = self.cabeza.anterior
            nuevo.siguiente = self.cabeza
            nuevo.anterior = self.cabeza
            # cola.siguiente = nuevo

            self.cabeza.anterior = nuevo
            self.cabeza.siguiente = nuevo
            self.cabeza = nuevo
            
        self.tamanio += 1

    def insertar_final(self, dato):
        nuevo = Nodo(dato)
        if self.cola is None:  # lista vacía
            self.cola = nuevo
            self.cabeza = nuevo
        else:
            nuevo.anterior = self.cola
            self.cola.siguiente = nuevo
            self.cola = nuevo
            
        self.tamanio += 1

    def recorrerAdelante(self):
        # Recorrer de cabeza a cola
        elementos = []
        actual = self.cabeza
        while actual:
            elementos.append(str(actual.dato))
            actual = actual.siguiente
        return " <--> ".join(elementos)
    
    
    def recorrerAtras(self):
        # Recorrer de cola a cabeza
        elementos = []
        actual = self.cola
        while actual:
            elementos.append(str(actual.dato))
            actual = actual.anterior
        return " <--> ".join(elementos)    

lista = ListaDoblementeEnlazadaCircular()
# lista.insertar(10)
# lista.insertar(20)
# lista.insertar(30)
for i in fibonacciPrimosFact:
    lista.insertar_inicio(i)
# cola.insertar(10)
# cola.insertar(20)
# cola.insertar(30)

# print("Lista Doblemente Enlazada Atrás: ", lista.recorrerAtras())
print("Lista Doblemente Enlazada Adelante: ", lista.recorrerAdelante())

