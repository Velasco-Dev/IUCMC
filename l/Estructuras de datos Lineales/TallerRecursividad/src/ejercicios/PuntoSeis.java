package ejercicios;

import java.util.Scanner;

public class PuntoSeis {

    public static void seis() {
        
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("6. Leer un numero llamado base y otro exponente y calcular la potencia elevando la base al exponente.");
            System.out.print("Ingrese la base: ");
            int base = scanner.nextInt();
            System.out.print("Ingrese el exponente: ");
            int exponente = scanner.nextInt();
            // Llamada al método calcularPotencia
            int resultado = calcularPotencia(base, exponente);
            // Mostrar el resultado
            System.out.println("La potencia es: " + resultado);
        }
    }

    private static int calcularPotencia(int base, int exponente) {
        // Caso base: cualquier número elevado a la potencia 1 es el mismo número
        if (exponente == 1) {
            return base;
        }
        // Caso base: cualquier número elevado a la potencia 0 es 1
        // Llamada recursiva: base * potencia de la base elevada a (exponente - 1)
        return exponente == 0 ? 1 : base * calcularPotencia(base, exponente - 1);
        
    }
    
}
