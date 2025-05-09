package utils;

import java.util.Scanner;

public class Input {
    /**
     * Esta clase se encarga de gestionar la entrada de datos del usuario.
     * Contiene métodos para leer diferentes tipos de datos desde la consola.
     */
    // Scanner para leer la entrada del usuario
    public static final Scanner scanner = new Scanner(System.in);

    public static final String ERROR = "Opción inválida. Intente nuevamente.\n=====================================================";

    public static int getInt(String message) {
        System.out.print(message);
        while (!scanner.hasNextInt()) {
            System.out.println(ERROR);
            scanner.next(); // Limpiar el buffer
            System.out.print(message);
        }
        return scanner.nextInt();
    }

    public static double getDouble(String message) {
        System.out.print(message);
        while (!scanner.hasNextDouble()) {
            System.out.println(ERROR);
            scanner.next(); // Limpiar el buffer
            System.out.print(message);
        }
        return scanner.nextDouble();
    }

    public static String getString(String message) {
        System.out.print(message);
        String input = scanner.nextLine();
        if (input.isEmpty()) {
            input = scanner.nextLine();
        }
        return input;
    }
}

