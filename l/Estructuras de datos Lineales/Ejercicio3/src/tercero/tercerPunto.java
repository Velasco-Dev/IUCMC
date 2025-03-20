package tercero;

import java.util.Scanner;

public class tercerPunto {

    public static void factorial() {

        System.out.println(
                "3. Leer n números enteros, almacenarlos en un arreglo y calcular la factorial de cada número leído, "
                        + "el cual se debe guardar en otro arreglo. Imprima el arreglo de los números iniciales y el de las factoriales.");

        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese la cantidad de numeros: ");
        int n = scanner.nextInt();
        //definición de arreglo de tamaño n
        int[] numeros = new int[n];

        //se llena el arreglo de números con valores ingresados por el usuario
        for (int i = 0; i < n; i++) {
            System.out.print("Ingrese el valor " + (i + 1) + ": ");
            int numero = scanner.nextInt();
            //se asigna el valor ingresado por el usuario a la posición i del arreglo
            numeros[i] = numero;
        }

        System.out.print("============================================\n" +
                "a) El arreglo de los números iniciales es: ");

        //Se imprime el arreglo de números
        for (int i = 0; i < n; i++) {
            System.out.print(i == numeros.length - 1 ? numeros[i] + ".\n" : numeros[i] + ", ");
        }
        
        System.out.print("============================================\n" +
        "b) El arreglo de los números factoriales es: ");

        //Se define una arreglo de factoriales de tamaño n y tipo entero
        int [] factorial = new int[n];

        for (int i = 0; i < factorial.length; i++) {
            // se llama alñ método de calcular factorial para llenar el arreglo factorial de acuerdo a los valores por posición del arreglo de números
            factorial[i] = calcularFactorial(numeros[i]);
        }
        
        //Se imprime el arreglo de números
        for (int i = 0; i < factorial.length; i++) {
            System.out.print(i == factorial.length - 1 ? factorial[i] + ".\n" : factorial[i] + ", ");
        }

        //Se cierra el scanner
        scanner.close();

    }

    //definicón de la función para calcular el factorial que es de tipo entero y recibe un número x y devuelve el factorial de ese número
    public static int calcularFactorial(int num) {
        //se inicializa una variable entera en 1
        int fact = 1;
        for (int i = 1; i <= num; i++) {
            //se multiplica la posición del ciclo (contador i) hasta el número recibido 
            fact *= i;
        }
        return fact;
    }

}
