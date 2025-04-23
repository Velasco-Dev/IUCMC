package ordenamiento;

public class Merge {

    //necesito organizar con un merge sort lo elementos de un arreglo
    public static void mergeSort(int[] elementos, int inicio, int fin) {
        if (inicio < fin) {
            int medio = (inicio + fin) / 2;
            mergeSort(elementos, inicio, medio);
            mergeSort(elementos, medio + 1, fin);
            merge(elementos, inicio, medio, fin);
        }
    }  
    
    private static void merge(int[] elementos, int inicio, int medio, int fin) {
        int n1 = medio - inicio + 1;
        int n2 = fin - medio;

        // Crear arreglos temporales
        int[] izquierda = new int[n1];
        int[] derecha = new int[n2];

        // Copiar datos a los arreglos temporales
        for (int i = 0; i < n1; i++) {
            izquierda[i] = elementos[inicio + i];
        }
        for (int j = 0; j < n2; j++) {
            derecha[j] = elementos[medio + 1 + j];
        }

        // Mezclar los arreglos temporales
        int i = 0, j = 0;
        int k = inicio;
        while (i < n1 && j < n2) {
            if (izquierda[i] <= derecha[j]) {
                elementos[k] = izquierda[i];
                i++;
            } else {
                elementos[k] = derecha[j];
                j++;
            }
            k++;
        }

        // Copiar los elementos restantes de izquierda[], si hay alguno
        while (i < n1) {
            elementos[k] = izquierda[i];
            i++;
            k++;
        }

        // Copiar los elementos restantes de derecha[], si hay alguno
        while (j < n2) {
            elementos[k] = derecha[j];
            j++;
            k++;
        }
    }
}
