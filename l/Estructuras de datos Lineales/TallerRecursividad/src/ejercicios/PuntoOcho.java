package ejercicios;

import java.util.Scanner;

public class PuntoOcho {

    public static void ocho() {

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("8. Realizar un programa que permita copiar una cadena en otra.");
            System.out.print("Ingrese la cadena de texto: ");
            String cadena = scanner.nextLine();
            // Llamada al método copiarCadena
            String copia = copiarCadena(cadena);
            // Mostrar el resultado
            System.out.println("La cadena copiada es: " + copia);
        }

    }

    private static String copiarCadena(String cadena) {
        // Caso base: si la cadena está vacía, devuelve una cadena vacía
        if (cadena.isEmpty()) {
            return "";
        }
        // Llamada recursiva: copia el primer carácter y llama a la función con el resto de la cadena
        return cadena.charAt(0) + copiarCadena(cadena.substring(1));
    }
    
}
