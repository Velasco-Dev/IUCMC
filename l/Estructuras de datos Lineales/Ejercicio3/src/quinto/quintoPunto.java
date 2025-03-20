package quinto;

import java.util.Scanner;

public class quintoPunto {

    public static void invertirArreglo() {

        Scanner scanner = new Scanner(System.in);

        System.out.println("5. Inicializar un arreglo con n números enteros e invierta cada uno de los" +
                "números del arreglo y guarde los números invertidos en otro arreglo. Imprima ambos arreglos.");

        System.out.print("Ingrese el numero de elementos que desea invertir: ");
        int n = scanner.nextInt();
        //Se define un arreglo de valores de tipo entero con un tamaño n
        int[] valores = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Ingrese el valor " + (i + 1) + ": ");
            //Se le piden los números al usuario y se guardan en la variable de tipo entero numero
            int valor = scanner.nextInt();
            //Se guardan los valores en el arreglo
            valores[i] = valor;
        }

        System.out.print("============================================\n" +
                "a) El arreglo original es: ");

        //Se imprime el arreglo de números
        for (int i = 0; i < n; i++) {
            //ternaria para poner , o . según sea el caso, Esto con la intensión de presentar la información más ordenada al usuario
            System.out.print(i == valores.length - 1 ? valores[i] + ".\n" : valores[i] + ", ");
        }

        int valoresInvertidos [] = new int[n];

        //Se llena el arreglo original con los números invertidos
        for (int i = 0; i < n; i++) {
            valoresInvertidos[i] = valores[i] * (-1);
        }

        System.out.print("============================================\n" +
                "a) El arreglo invertido es: ");

        //Se imprime el arreglo de números invertidos
        for (int i = 0; i < n; i++) {
            //ternaria para poner , o . según sea el caso, Esto con la intensión de presentar la información más ordenada al usuario
            System.out.print(i == valoresInvertidos.length - 1 ? valoresInvertidos[i] + ".\n" : valoresInvertidos[i] + ", ");
        }
        //cerramos el escanner 
        scanner.close();
    }

}
