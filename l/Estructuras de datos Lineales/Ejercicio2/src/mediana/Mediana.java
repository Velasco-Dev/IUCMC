package mediana;

import java.util.*;

public class Mediana {
    public static double mediana(int[] numeros) {
        // Ordenar el array
        Arrays.sort(numeros);

        // Obtener la longitud
        int n = numeros.length;

        // Si la longitud es par
        if (n % 2 == 0) {
            return (numeros[(n / 2) - 1] + numeros[n / 2]) / 2.0;
        }
        // Si la longitud es impar
        else {
            return numeros[n / 2];
        }
    }
}
