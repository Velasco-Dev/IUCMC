package ejercicios;

import java.util.Scanner;

public class PuntoDos {

    public static void dos() {

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("2.Leer un numero entero e invertirlo. Ejemplo: Entrada: 123 Salida: 321");
            System.out.print("Ingrese un numero entero: ");

            int numero = scanner.nextInt();
            int resultado = invertirNumero(numero);

            System.out.println("El numero invertido es: " + resultado);
        }
    }

    // Método para invertir un número entero
    public static int invertirNumero(int numero) {
        int invertido = 0;
        while (numero != 0) {
            // Obtener el último dígito
            int digito = numero % 10; 
            // Agregarlo al número invertido
            invertido = invertido * 10 + digito; 
            // Eliminar el último dígito del número original
            numero /= 10; 
        }
        return invertido;
    }
    
}
