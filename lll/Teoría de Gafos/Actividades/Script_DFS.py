import os
from collections import deque

## Función para cargar la matriz de adyacencia desde un archivo ##
def cargar_matriz(file_path):
    """
    Carga la matriz de adyacencia desde un archivo de texto.
    
    Args:
        file_path: Ruta del archivo de texto con la matriz de adyacencia
        
    Returns:
        List[List[int]]: Matriz de adyacencia como lista de listas
    """
    # Resolver ruta: si se pasa una ruta relativa, buscarla respecto al directorio del script
    if not os.path.isabs(file_path):
        base_dir = os.path.dirname(os.path.abspath(__file__))
        file_path = os.path.join(base_dir, file_path)

    MatrizDeAdyacencia = []
    try:
        with open(file_path, 'r') as file:
            lineas = file.readlines()
            for linea in lineas:
                MatrizDeAdyacencia.append([int(x) for x in linea.strip().split(',')])
    except FileNotFoundError:
        print(f"Error: El archivo '{file_path}' no fue encontrado.")
        return None
    except ValueError:
        print(f"Error: El archivo contiene valores que no son números.")
        return None
    
    return MatrizDeAdyacencia

def dfs_forest(adj):
    n = len(adj)
    visitado = [False] * n
    arbol = []  # lista de aristas (u, v)

    def dfs(u, padre):
        visitado[u] = True
        for v in range(n):
            if adj[u][v] == 1 and not visitado[v]:
                arbol.append((u, v))
                dfs(v, u)

    for i in range(n):
        if not visitado[i]:
            dfs(i, -1)
    return arbol

# Ejemplo de uso:
matriz = cargar_matriz('MatrizAdyacencia2.txt')
if matriz:
    aristas = dfs_forest(matriz)
    print("Aristas del bosque generador:", aristas)