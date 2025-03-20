package cuarto;

import java.util.Arrays;
import java.util.Scanner;

public class cuartoPunto {

    public static void numeroMenorMayor() {

        System.out.println("4. Lea 10 números enteros, almacénelos en un arreglo y encuentre:");

        Scanner scanner = new Scanner(System.in);

        //Se inicializa un arreglo de tipo int con tamaño 10
        int[] numeros = new int[10];

        for (int i = 0; i < 10; i++) {
            System.out.print("Ingrese el valor " + (i + 1) + ": ");
            //Se le piden los números al usuario y se guardan en la variable de tipo entero numero
            int numero = scanner.nextInt();
            //Se guardan los números en el arreglo
            numeros[i] = numero;
        }

        //Ordena los elemntos del arreglo de menor a mayor
        Arrays.sort(numeros);

        //imprimimos el valor mayor y menor del arreglo
        System.out.println("============================================\n" +
                "a) El número menor del arreglo es: " + numeros[0]);

        System.out.println("============================================\n" +
                "b) El numero mayor del arreglo es: " + numeros[numeros.length - 1] +
                "\n============================================");

        // se cierra el scanner para ingresar datos por consola
        scanner.close();
    }

}
