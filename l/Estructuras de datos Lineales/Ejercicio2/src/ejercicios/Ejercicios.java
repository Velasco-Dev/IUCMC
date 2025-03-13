package ejercicios;

import java.lang.reflect.Array;
import java.util.*;

import mediana.Mediana;
import promedio.Promedio;

public class Ejercicios {
    private static final Map<Integer, Command> menuOptions = new HashMap<>();
    static boolean entradaValida = false;

    static {
        menuOptions.put(1, () -> opcionUno());
        menuOptions.put(2, () -> opcionDos());
        menuOptions.put(3, () -> opcionTres());
        menuOptions.put(4, () -> opcionCuatro());
        menuOptions.put(5, () -> opcionCinco());
    }

    public static void Ejercicio2() {
        Scanner scanner = new Scanner(System.in);

        while (!entradaValida) {

            mostrarMenu();
            entradaValida = false;

            if (scanner.hasNextInt()) {

                int opcion = obtenerOpcion(scanner);
                entradaValida = true;
                ejecutarOpcion(opcion);

            } else {

                System.out.println("Entrada no valida, solo se aceptan numeros enteros.");
                scanner.next();

            }
        }
    }

    private static void mostrarMenu() {
        System.out.println("============================================");
        System.out.println("================ Ejercicio 2 ===============");
        System.out.println("============================================");
        System.out.println("1. Ejercicio 1");
        System.out.println("2. Ejercicio 2");
        System.out.println("3. Ejercicio 3");
        System.out.println("4. Ejercicio 4");
        System.out.print("5. Ejercicio 5\nOpcion: ");
    }

    private static int obtenerOpcion(Scanner scanner) {
        return scanner.hasNextInt() ? scanner.nextInt() : -1;
    }

    private static void ejecutarOpcion(int opcion) {
        Command command = menuOptions.getOrDefault(opcion,
                () -> {
                    System.out.println("Opción no válida.");
                    entradaValida = false;
                });
        command.execute();
    }

    private static void opcionUno() {

        int[] primos = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 };

        System.out.print("Los primeros 10 números primos son: ");

        for (int primo : primos) {
            if (primo != 29) {
                System.out.print(primo + ", ");
            } else {
                System.out.print(primo + ".");
            }
        }
    }

    private static void opcionDos() {

        int[] pares = new int[100];

        for (int i = 1; i < pares.length; i++) {
            pares[i] = i * 2;
        }

        System.out.print("============================================\n" +
                "a)Los primeros 100 números pares son: ");

        for (int par : pares) {

            if (par == 0) {
                System.out.print("");
            } else if (par != 198) {
                System.out.print(par + ", ");
            } else {
                System.out.print(par + ", 200.\n");
            }
        }

        System.out.println("============================================\n" +
                "b) En 10 líneas de 10 números pares:");

        for (int i = 1; i < pares.length; i++) {
            // Ternaria para imprimir los números
            System.out.print(pares[i] == 0 ? "" : pares[i] == 198 ? pares[i] + ", 200.\n" : pares[i] + ", ");

            // Ternaria para el salto de línea
            System.out.print(i % 10 == 0 ? "\n" : "");
        }

    }

    private static void opcionTres() {

        int[] numeros = new int[5];

        Scanner scanner = new Scanner(System.in);

        for (int i = 0; i < numeros.length; i++) {

            System.out.print("Ingrese el numero " + (i + 1) + ": ");
            numeros[i] = scanner.nextInt();
        }

        System.out.println("============================================");

        System.out.print("a) Los números ingresados son: ");

        for (int i = 0; i < numeros.length; i++) {
            System.out.print(i == numeros.length - 1 ? numeros[i] + ".\n" : numeros[i] + ", ");
        }

        int numb = Promedio.promedio(numeros);
        System.out.println("============================================");
        System.out.println("b) El promedio es: " + numb);
        System.out.println("============================================");
        System.out.println("c) La sumatoria es: " + (numb * numeros.length));
        System.out.println("============================================");

        scanner.close();

    }

    private static void opcionCuatro() {

        Scanner scanner = new Scanner(System.in);

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
                "a) El promedio de edades de los estudiantes es: " + prom);

        double med = Mediana.mediana(edades);
        System.out.println("============================================\n" +
                "b) La mediana de edades de los estudiantes es: " + med +
                "\n============================================");


        scanner.close();
    }

    private static void opcionCinco() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese la cantidad de numeros: ");
        int n = scanner.nextInt();
        int[] numeros = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Ingrese el valor " + (i + 1) + ": ");
            int numero = scanner.nextInt();
            numeros[i] = numero;
        }

        Arrays.sort(numeros);

        System.out.println("============================================\n" +
                "a) El número menor del arreglo es: " + numeros[0]);

        System.out.println("============================================\n" +
                "b) El numero mayor del arreglo es: " + numeros[numeros.length - 1] +
                "\n============================================");


        scanner.close();
    }
}

@FunctionalInterface
interface Command {
    void execute();
}