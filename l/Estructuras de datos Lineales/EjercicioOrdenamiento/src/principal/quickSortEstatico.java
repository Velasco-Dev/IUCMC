package principal;

import java.util.Arrays;

public class quickSortEstatico {

    public static void noveno() {
        // Arreglo de elementos a ordenar
        int[] elementos = { 8, 5, -2, 24, 77, 100, 88, 0 };

        // Imprimir arreglo original
        System.out.println("El arreglo original es: " + Arrays.toString(elementos));

        // Ordenar el arreglo utilizando Merge Sort
        ordenamiento.Quick.quickSort(elementos, 0, elementos.length - 1);

        // Imprimir arreglo ordenado
        System.out.println("El arreglo ordenado es: " + Arrays.toString(elementos));
    }
    
}
