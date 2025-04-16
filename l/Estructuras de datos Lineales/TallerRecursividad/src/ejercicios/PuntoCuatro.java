package ejercicios;

import java.util.Scanner;

public class PuntoCuatro {

    public static void cuatro() {
        
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("4. Leer un número y sumar los dígitos de un número. Ejemplo: Entrada: 123 Resultado:6");
            // Solicitar al usuario un número entero
            System.out.print("Ingrese un número entero: ");
            int numero = scanner.nextInt();
            // Llamar al método recursivo para sumar los dígitos
            int suma = sumarDigitos(numero);
            // Mostrar el resultado
            System.out.println("La suma de los dígitos de " + numero + " es: " + suma);
        }
    }

    // Método recursivo para sumar los dígitos de un número
    public static int sumarDigitos(int numero) {
        // Caso base: si el número es 0, la suma es 0
        if (numero == 0) {
            return 0;
        } else {
            // Sumar el último dígito y llamar recursivamente al método con el número sin el último dígito
            return (numero % 10) + sumarDigitos(numero / 10);
        }
    }
    
}
