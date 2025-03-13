import java.util.*;

import moda.*;
import promedio.*;
import desviacion.*;
import ejercicios.*;

public class App {
    public static void main(String[] args) throws Exception {

        Scanner scanner = new Scanner(System.in);
        int opcion = 0;
        boolean entradaValida = false;
        // System.out.println("Bienvenido:\n¿Que ejercicio deseas ejecutar?\n1.
        // Ejercicio 1\n2. Ejercicio 2");
        // opcion = scanner.nextInt();

        while (!entradaValida) {

            System.out.print("Bienvenido:\n¿Que ejercicio deseas ejecutar?" +
                    "\n1. Ejercicio 1\n2. Ejercicio 2\nOpcion: ");
            entradaValida = false;

            if (scanner.hasNextInt()) {

                opcion = scanner.nextInt();
                entradaValida = true;

                switch (opcion) {
                    case 1:
                        // Ejercicio 1
                        System.out.println("==============================================\n"
                                + "= Calduladora de promedio, moda y desviacion =\n"
                                + "==============================================");
                        System.out.print("Ingrese el numero de alumnos: ");
                        int n = scanner.nextInt();
                        int[] edades = new int[n];

                        for (int i = 0; i < n; i++) {
                            System.out.print("Ingrese la edad del estudiante " + (i + 1) + ": ");
                            int edad = scanner.nextInt();
                            edades[i] = edad;
                        }

                        int prom = Promedio.promedio(edades);
                        System.out.println("============================================\n" +
                                "El promedio de edades de los estudiantes es: " + prom);
                        int mod = Moda.moda(edades);
                        System.out.println("============================================\n" +
                                "La moda de edades de los estudiantes es: " + mod);
                        double desv = Desviacion.desviacion(edades);
                        System.out.println("============================================\n" +
                                "La desviacion de edades de los estudiantes es: " + desv +
                                "\n============================================");

                        break;
                    case 2:
                        // Ejercicio 2
                        Ejercicios.Ejercicio2();
                        break;
                    default:
                        System.out.println("Opcion no valida");
                        entradaValida = false;
                        break;
                }

            } else {
                System.out.println("============================================\n" +
                        "Entrada no valida, solo se aceptan numeros enteros.\n" +
                        "============================================");
                scanner.next();
            }
        }
        scanner.close();
    }
}
