package ejercicios;

import java.util.Scanner;

public class PuntoNueve {

    public static void nueve() {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("9. Leer 2 números enteros y calcular el cociente de la división entera. (sugerencia: use restas sucesivas)");
            System.out.print("Ingrese el primer número (dividendo): ");
            int dividendo = scanner.nextInt();
            System.out.print("Ingrese el segundo número (divisor): ");
            int divisor = scanner.nextInt();
            // Llamada al método dividir
            int cociente = dividir(dividendo, divisor);
            // Mostrar el resultado
            System.out.println("El cociente entero de la división entre "+dividendo+" y "+divisor+" es: " + cociente);
        }
    }

    private static int dividir(int dividendo, int divisor) {
        // Caso base: si el dividendo es menor que el divisor, el cociente es 0
        if (dividendo < divisor) {
            return 0;
        }
        // Llamada recursiva: resta el divisor del dividendo y suma 1 al cociente
        return 1 + dividir(dividendo - divisor, divisor);
    }
    
}
