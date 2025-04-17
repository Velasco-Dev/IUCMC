package ejercicios;

import java.util.Arrays;
import java.util.Scanner;

public class PuntoOnce {

    public static void once() {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println(
                    "11. Leer n valores enteros, almacenarlos en un arreglo y realizar la suma de los elementos del vector.");
            System.out.print("Ingrese la cantidad de elementos: ");
            int n = scanner.nextInt();
            int[] arreglo = new int[n];
            // Llenar el arreglo con los valores ingresados por el usuario
            llenarArreglo(arreglo, n - 1);
            // Llamada al método sumarElementos
            int suma = sumarElementos(arreglo, n);
            // Mostrar el resultado
            System.out.println("La suma de los elementos del arreglo " + Arrays.toString(arreglo) + " es: " + suma);
        }
    }

    private static void llenarArreglo(int[] arreglo, int n) {
        int indice = n + 1;
        // Caso base: cuando el índice es negativo, termina la recursión
        if (n < 0) {
            return;
        }

        // Llenar el arreglo con los valores ingresados por el usuario
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Ingrese el elemento en la posicion " + indice + ": ");
            arreglo[n] = scanner.nextInt();

            // Llamada recursiva para llenar la siguiente posición
            llenarArreglo(arreglo, n - 1);
        }

    }

    private static int sumarElementos(int[] arreglo, int n) {
        // Caso base: si n es 0, la suma es 0
        if (n == 0) {
            return 0;
        } else {
            // Llamada recursiva: suma el último elemento y llama a la función con n - 1
            return arreglo[n - 1] + sumarElementos(arreglo, n - 1);
        }
    }

}
