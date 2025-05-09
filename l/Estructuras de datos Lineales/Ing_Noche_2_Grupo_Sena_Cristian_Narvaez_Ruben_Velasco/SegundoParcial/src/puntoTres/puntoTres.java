package puntoTres;

import java.util.Arrays;
import java.util.Random;
import utils.Input;

public class puntoTres {

    public static void tres() {

        int n = Input.getInt("\nTamaño del arreglo: ");

        int[] arreglo = random(n, 100);

        System.out.println("\nArreglo desordenado:");
        System.out.println(Arrays.toString(arreglo));

        mergeSort(arreglo);

        System.out.println("\nArreglo ordenado con Mergesort:");
        System.out.println(Arrays.toString(arreglo));

        int objetivo = Input.getInt("\nIngrese numero a buscar: ");

        int posicion = busquedaSecuencial(arreglo, objetivo);

        if (posicion != -1) {
            System.out.println("\nPosicion: " + posicion + "\n");
        } else {
            System.out.println("\nNo encontrado\n");
        }
    }

     // metodo para generar el arreglo con numeros random
    public static int[] random(int n, int limite) {

        Random r = new Random();
        int[] arreglo = new int[n];

        for (int i = 0; i < n; i++) {
            arreglo[i] = r.nextInt(limite); 
        }
        return arreglo;
    }

    // metodo de Mergesort
    public static void mergeSort(int[] arreglo) {
        if (arreglo.length > 1) {
            int mitad = arreglo.length / 2;

            int[] izquierda = Arrays.copyOfRange(arreglo, 0, mitad);
            int[] derecha = Arrays.copyOfRange(arreglo, mitad, arreglo.length);

            mergeSort(izquierda);
            mergeSort(derecha);

            merge(arreglo, izquierda, derecha);
        }
    }

    private static void merge(int[] arreglo, int[] izquierda, int[] derecha) {
        int i = 0, j = 0, k = 0;
        while (i < izquierda.length && j < derecha.length) {
            if (izquierda[i] <= derecha[j]) {
                arreglo[k++] = izquierda[i++];
            } else {
                arreglo[k++] = derecha[j++];
            }
        }
        while (i < izquierda.length) {
            arreglo[k++] = izquierda[i++];
        }
        while (j < derecha.length) {
            arreglo[k++] = derecha[j++];
        }
    }

    // busqueda secuencial
    public static int busquedaSecuencial(int[] arreglo, int objetivo) {
        for (int i = 0; i < arreglo.length; i++) {
            if (arreglo[i] == objetivo) {
                return i; 
            }
        }
        return -1;
    }
}
