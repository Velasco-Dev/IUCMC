package ejercicios;

import java.util.Scanner;

public class PuntoDiez {

    public static void diez() {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("10. Leer 2 números enteros y realizar la multiplicación de los 2 números mediante sumas sucesivas.");
            System.out.print("Ingrese el primer número: ");
            int n = scanner.nextInt();
            System.out.print("Ingrese el segundo número: ");
            int m = scanner.nextInt();
            // Llamada al método multiplicar
            int cociente = multiplicar(n, m); 
            // Mostrar el resultado
            System.out.println("El resultado de la multiplicacion entre "+n+" y "+m+" es: " + cociente);
        }
    }

    private static int multiplicar(int n, int m) {
        // Caso base: si m es 0, el resultado es 0
        if (m == 0) {
            return 0;
        } else if (m < 0) {
            // Si m es negativo, se llama recursivamente con el valor absoluto de m
            return -multiplicar(n, -m);
        } else {
            // Llamada recursiva: suma n al resultado y llama a la función con m - 1
            return n + multiplicar(n, m - 1);
        }
        
    }
    
}
