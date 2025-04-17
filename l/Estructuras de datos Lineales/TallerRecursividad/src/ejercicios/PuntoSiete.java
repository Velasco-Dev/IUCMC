package ejercicios;

import java.util.Scanner;

public class PuntoSiete {

    public static void siete() {

        try (Scanner scanner = new Scanner(System.in)) {
            /*
             * Si M >= N una función recursiva para MCD es
             * MCD = M si N =0
             * MCD = MCD (N, M % N) si N <> 0
             */
            System.out.println(
                    "7.Leer dos números enteros y calcular el máximo común divisor (M.C.D.), de dos números enteros (M, N) usando el algoritmo de Euclides.");
            System.out.print("Ingrese el primer número: ");
            int m = scanner.nextInt();
            System.out.print("Ingrese el segundo número: ");
            int n = scanner.nextInt();
            int mcd = mcd(m, n);
            // Mostrar el resultado
            System.out.println("El máximo común divisor de " + m + " y " + n + " es: " + mcd);
        }
    }

    private static int mcd(int m, int n) {
        // Si n es 0, el MCD es m
        // Si n no es 0, se llama recursivamente a la función con n y el resto de m
        // dividido por n
        if (n == 0) {
            return m;
        } else {
            return mcd(n, m % n);
        }
    }

}
