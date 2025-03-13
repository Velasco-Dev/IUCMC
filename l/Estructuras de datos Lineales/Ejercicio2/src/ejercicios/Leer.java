package ejercicios;

import java.util.*;

public class Leer {

    public static int leer(int mensaje) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el numero de alumnos: ");
        int n = scanner.nextInt();
        int[] edades = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Ingrese la edad del estudiante " + (i + 1) + ": ");
            int edad = scanner.nextInt();
            edades[i] = edad;
        }

        scanner.close();

        return n;
    }

}
