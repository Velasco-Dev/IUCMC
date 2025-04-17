package ejercicios;

import java.util.Scanner;

public class PuntoCatorce {

    public static void catorce() {

        String separadores = "\t==========================================";

        try (Scanner scanner = new Scanner(System.in)) {
            /*
             * 14.La función de Ackerman se define como:
             * Ackerman (m, n) = n + 1 si m = 0
             * Ackerman (m, n) = Ackerman (m - 1, 1) si m > 0 y n = 0
             * Ackerman (m, n) = Ackerman (m - 1, Ackerman (m, n - 1)) si m > 0 y n > 0
             * Ej. Si se tiene Ackermann (1, 2) = 4; Ackermann (3, 2) = 29
             */
            System.out.println(
                    "14. Realice un programa para encontrar el valor de la función de Ackerman, para dos valores enteros m, n.");
            System.out.println("Ejemplo: Ackermann (1, 2) = 4; Ackermann (3, 2) = 29");
            System.out.print("Ingrese el primer numero (m): ");
            int m = scanner.nextInt();
            System.out.print("Ingrese el segundo numero (n): ");
            int n = scanner.nextInt();
            int resultado = 0; // Inicializar resultado

            // Validación de entrada
            while (m > 3) {
                System.out.println(separadores+"\n¡ADVERTENCIA! Valores de m > 3 pueden causar desbordamiento.\n"+separadores);
                System.out.print("Ingrese otro valor < 3 para m: ");
                m = scanner.nextInt();
                // Llamada al método ackermann
                resultado = ackermann(m, n);
            }

            // Mostrar el resultado
            System.out.println("El resultado de la función de Ackermann (" + m + ", " + n + ") es: " + resultado);
        }
    }

    private static int ackermann(int m, int n) {
        // Caso base: m = 0
        if (m == 0) {
            return n + 1;
        // Caso: m > 0 y n = 0
        } else if (m > 0 && n == 0) {
            return ackermann(m - 1, 1);
        // Caso: m > 0 y n > 0
        } else if (m > 0 && n > 0) {
            return ackermann(m - 1, ackermann(m, n - 1));
        } else {
            return 0; // Valor por defecto (no debería llegar aquí)
        }
    }

}
