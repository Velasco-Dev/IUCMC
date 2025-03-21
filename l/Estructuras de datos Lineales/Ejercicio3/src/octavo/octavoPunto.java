package octavo;

import java.util.ArrayList;
import java.util.Scanner;

public class octavoPunto {

    public static void arrayListPares() {

        System.out.println(
                "8. Inicializar un ArrayList con los 20 primeros números pares ascendentemente y realice lo siguiente:");

        // Se define un ArrayList de enteros
        ArrayList<Integer> pares = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);
        //se añaden los primeros 20 pares al Arraylist
        for (int i = 1; i <= 20; i++) {
            pares.add(i * 2);
        }
        //Se imprime el ArrayList
        System.out.println("a) Imprima el ArrayList leído: " + pares);
        //Se lee el número ingresado por el usuario
        System.out.print(
                "b) Lea un numero cualquiera e insértelo en la posición correcta de acuerdo con el orden del ArrayList: ");

        int numero = scanner.nextInt();

        int posicion = 0;
        //se define la posoción donde debe ir el nuevbo número
        while (posicion < pares.size() && pares.get(posicion) < numero) {

            posicion++;
        }
        //Se añade el número ingresado al ArrayList
        pares.add(posicion, numero);

        //Se imprime el ArrayList con el nuevo número
        System.out.println(
                "b.1) Imprima de nuevo el ArrayList para verificar que el valor se insertó en la posición correcta: : "
                        + pares);

        int numeroEliminar = 0;

        do {
            //Se muestra el mensaje de ingresar el numero que se quiere borrar del arraList hasta que el usuario ponga uno que si está en el Arreglo
            System.out.print(
                    "c) Borre un valor dentro del ArrayList solicitándolo al usuario : ");
            numeroEliminar = scanner.nextInt();
            //se muestra el mensaje de "no se encuentra el elemento en el ArrayList"
            if (!pares.contains(numeroEliminar)) {
    
                System.out.println("== El numero no se encuentra en el ArrayList ==");
    
            } else {
                //Se remueve del ArrayList el elemento si es que existe y se imprime el ArrayList resultante
                pares.remove(Integer.valueOf(numeroEliminar));
                System.out.println("c.1) Imprima de nuevo el arreglo para verificar que el valor se retiró: " + pares);
                return;
            }

        } while (!pares.contains(numeroEliminar));

        scanner.close();
    }

}
