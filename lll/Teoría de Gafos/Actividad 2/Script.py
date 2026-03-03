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


## Función para determinar si un grafo es conexo usando BFS ##
def es_conexo_bfs(matriz_adyacencia):
    """
    Determina si un grafo es conexo usando BFS (Búsqueda en Amplitud).
    
    Un grafo es conexo si desde cualquier nodo se pueden alcanzar todos 
    los demás nodos. Se implementa BFS comenzando desde el nodo 0.
    
    Args:
        matriz_adyacencia: Matriz de adyacencia del grafo (List[List[int]])
        
    Returns:
        bool: True si el grafo es conexo, False si es disconexo
    """
    if not matriz_adyacencia or len(matriz_adyacencia) == 0:
        return False
    
    n = len(matriz_adyacencia)  # Número de nodos
    visitados = set()
    cola = deque([0])  # Comenzamos desde el nodo 0
    visitados.add(0)
    
    # BFS para recorrer todos los nodos alcanzables desde el nodo 0
    while cola:
        nodo_actual = cola.popleft()
        
        # Revisar todos los vecinos del nodo actual
        for vecino in range(n):
            if matriz_adyacencia[nodo_actual][vecino] == 1 and vecino not in visitados:
                visitados.add(vecino)
                cola.append(vecino)
    
    # El grafo es conexo si se visitaron todos los nodos
    return len(visitados) == n


## Análisis de los grafos ##
print("=" * 60)
print("ANÁLISIS DE CONECTIVIDAD DE GRAFOS USANDO BFS")
print("=" * 60)

# Cargar y analizar MatrizAdyacencia1.txt
print("\nArchivo: MatrizAdyacencia1.txt")
matriz1 = cargar_matriz('MatrizAdyacencia1.txt')
if matriz1:
    print(f"Dimensiones: {len(matriz1)} x {len(matriz1[0])}")
    conexo1 = es_conexo_bfs(matriz1)
    if conexo1:
        print("Resultado: CONEXO ✓")
    else:
        print("Resultado: DISCONEXO ✗")

# Cargar y analizar MatrizAdyacencia2.txt
print("\nArchivo: MatrizAdyacencia2.txt")
matriz2 = cargar_matriz('MatrizAdyacencia2.txt')
if matriz2:
    print(f"Dimensiones: {len(matriz2)} x {len(matriz2[0])}")
    conexo2 = es_conexo_bfs(matriz2)
    if conexo2:
        print("Resultado: CONEXO ✓")
    else:
        print("Resultado: DISCONEXO ✗")

print("\n" + "=" * 60)