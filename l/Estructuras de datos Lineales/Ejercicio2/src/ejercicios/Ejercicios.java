package ejercicios;

import java.util.*;

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
        StringBuilder output = new StringBuilder();

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

        // Imprimir 10 números por línea
        for (int i = 1; i < pares.length; i++) {
            output.append(pares[i]);

            // Agregar coma o punto según sea necesario
            if (i == pares.length - 1) {
                output.append(", 200.");
            } else {
                output.append(", ");
            }

            // Nueva línea cada 10 números
            if (i % 10 == 0) {
                output.append("\n");
            }
        }

        System.out.println(output.toString());

    }

    private static void opcionTres() {
        System.out.print("Ingrese el numero de alumnos: ");
    }

    private static void opcionCuatro() {
        System.out.print("Ingrese el numero de alumnos: ");
    }

    private static void opcionCinco() {
        System.out.print("Ingrese el numero de alumnos: ");
    }
}

@FunctionalInterface
interface Command {
    void execute();
}