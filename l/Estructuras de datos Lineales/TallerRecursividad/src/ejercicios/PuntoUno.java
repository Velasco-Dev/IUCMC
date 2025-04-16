package ejercicios;

import java.util.Scanner;

public class PuntoUno {

    public static void uno() {
        int numero;
        
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("1. Leer un numero entero y n calcular la factorial de dicho número.");
            System.out.print("Ingrese un numero: ");
            numero = scanner.nextInt();
            // Llamada al método calcularFactorial
            int resultado = calcularFactorial(numero);
            System.out.println("El factorial de " + numero + " es: " + resultado);
        } 
    }

    // Método para calcular el factorial de un número de forma recursiva
    public static int calcularFactorial(int n) {
        if (n == 0 || n == 1) {
            return 1; // Caso base: el factorial de 0 o 1 es 1
        } else {
            return n * calcularFactorial(n - 1); // Llamada recursiva
        }
    }
    
}
