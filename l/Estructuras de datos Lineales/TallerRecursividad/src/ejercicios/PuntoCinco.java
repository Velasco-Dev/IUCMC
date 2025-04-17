package ejercicios;

import java.util.Scanner;

public class PuntoCinco {

    public static void cinco() {
        int numero;

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("5. Leer un numero entero y calcular la sumatoria hasta el numero leído.");
            System.out.print("Ingrese un numero: ");
            numero = scanner.nextInt();
            // Llamada al método calcularFactorial
            int resultado = calcularSuma(numero);
            // Mostrar el resultado
            System.out.println("La sumatoria de " + numero + " es: " + resultado);
        }
    }

    // Método para calcular la sumatoria de un número de forma recursiva
    private static int calcularSuma(int n) {
        if (n == 0 || n == 1) {
            return 1; // Caso base: el factorial de 0 o 1 es 1
        } else {
            return n + calcularSuma(n - 1); // Llamada recursiva
        }
    }

}
