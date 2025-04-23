package principal;

import java.util.Arrays;

public class mergeSortEstatico {
    
    public static void octavo() {
        // Arreglo de elementos a ordenar
        int[] elementos = { 8, 5, 2, 3, 1, 15, -2, 24, 77, 100, 88, 0 };

        // Imprimir arreglo original
        System.out.println("El arreglo original es: " + Arrays.toString(elementos));

        // Ordenar el arreglo utilizando Merge Sort
        ordenamiento.Merge.mergeSort(elementos, 0, elementos.length - 1);

        // Imprimir arreglo ordenado
        System.out.println("El arreglo ordenado es: " + Arrays.toString(elementos));
    }
    
}
