package ejercicios;

import java.util.Scanner;

public class PuntoTres {

    public static void tres() {

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("3. Leer un valor entero y calcular la sumatoria 1 + ½ +1/3+ … 1/n.");
            System.out.print("Ingrese un numero entero positivo: ");
            int numero = scanner.nextInt();

            if (numero > 0) {
                double resultado = calcularSumatoria(numero);
                System.out.print("La sumatoria es: " + resultado);
            } else {
                System.out.println("Por favor, ingrese un número entero positivo.");
            }
        }
    }

    // Método recursivo para calcular la sumatoria
    public static double calcularSumatoria(int n) {
        if (n == 1) {
            // Caso base: la sumatoria de 1 es 1
            return 1.0; 
        } else {
            // Llamada recursiva
            return 1.0 / n + calcularSumatoria(n - 1); 
        }
    }
    
}
