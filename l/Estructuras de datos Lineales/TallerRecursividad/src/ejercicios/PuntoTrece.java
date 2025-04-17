package ejercicios;

import java.util.Scanner;

public class PuntoTrece {

    public static void trece() {
        try (Scanner scanner = new Scanner(System.in)) {
            /*
             * 13. La serie de Fibonacci puede definirse en términos recursivos así:
             * (1) Fib(1) = 1 ; Fib(0) = 0
             * (2) Fib(n) = Fib(n-1) + Fib(n-2) si n >= 2.
             */
            System.out.println(
                    "13. Lea un valor entero que representa el límite de la serie de Fibonacci e imprima hasta el valor limite.");
            System.out.print("Ingrese el limite de la serie: ");
            int limite = scanner.nextInt();
            // Llamada al método Fibonacci
            int fib = fibonacci(0, 1, limite);
            // Mostrar el resultado
            System.out.println("El último número de la serie que no supera el límite (" + limite + ") es: " + fib);
        }
    }

    private static int fibonacci(int i, int j, int limite) {
        // i es el número actual
        // j es el siguiente número
        // limite es hasta donde queremos calcular la serie
        if (i + j > limite) {// Si el siguiente número excede el límite
            return i;// Retornamos el último número válido
        }
        // Si el número actual es igual al límite
        if (i == limite) {
            return i;
        }
        // Imprime el valor actual
        System.out.print(i + "\n");
        // La llamada recursiva avanza la serie:
        // - j se convierte en el número actual
        // - (i + j) se convierte en el siguiente número
        return fibonacci(j, i + j, limite);
    }

}
