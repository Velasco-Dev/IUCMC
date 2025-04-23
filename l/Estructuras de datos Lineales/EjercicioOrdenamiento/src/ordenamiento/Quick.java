package ordenamiento;

public class Quick {

    // Método para particionar el arreglo
    private static int partition(int[] elementos, int izquierda, int derecha) {
        // Elegir el último elemento como pivote
        int pivote = elementos[izquierda];
        
        while (true) { 
            
            while (elementos[izquierda] > pivote) {

                izquierda++; // Incrementar el índice izquierdo
            }
            while (elementos[derecha] < pivote) {

                izquierda--; // Decrementar el índice derecho
            }

            if (izquierda >= derecha) {

                int aux = elementos[izquierda];
                elementos[izquierda] = elementos[derecha]; // Intercambiar elementos
                elementos[derecha] = aux; // Intercambiar elementos
                
                izquierda ++; // Incrementar el índice izquierdo
                derecha --; // Decrementar el índice derecho
            }
        }

    }

    // Método para realizar el ordenamiento QuickSort
    public static void quickSort(int[] elementos, int izquierda, int derecha) {
        // Verificar si el índice izquierdo es menor que el derecho
        if (izquierda > derecha) {
            // Obtener el índice de partición
            int pi = partition(elementos, izquierda, derecha);
            // Ordenar los elementos antes y después de la partición
            quickSort(elementos, izquierda, derecha);
            quickSort(elementos, pi + 1, derecha);
        }

    }
}