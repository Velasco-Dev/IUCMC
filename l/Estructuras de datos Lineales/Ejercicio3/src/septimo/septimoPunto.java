package septimo;

import java.util.ArrayList;
import java.util.Scanner;

public class septimoPunto {

    public static void arrayListHastaCero() {

        Scanner scanner = new Scanner(System.in);

        System.out.println("7. Escribe un programa que lea números enteros y los guarde en un ArrayList" +
                "hasta que se lea un 0 y muestra los números leídos, su suma y su media.");

        //Definimos el tamaño del ArrayList

        //Definimos el arreglo
        ArrayList<Integer> enteros = new ArrayList<>();     
        int numero = 1;   

        //hacer al menos una vez a solicitud de números con la intención de llenar el ArrayList
        do{

            System.out.print("Ingrese el número que desea agregar al ArrayList: ");
            numero = scanner.nextInt();

            //Si el número ingresado es diferente de 0
            if (numero != 0) {
                //se agrega al ArrayList
                enteros.add(numero);
                //Sino
            }else{
                // se cierra el dowhile y se muestran tanto 
                System.out.println("Ha ingresado un 0, se detendrá la lectura de elementos");
                //el ArrayList,
                System.out.println("El arreglo guardado es: "+ enteros);
                /*como la suma de los elementos que contiene, invocando al método promedio y multiplicando por el tamaño del Arraylist
                para obtener la sumatoria del ArrayList*/
                System.out.println("La suma de los elementos del ArrayList guardado es: "+ promedio(enteros)*(enteros.size()));
                // y mostrando también su media o promedio invocando al mismo método
                System.out.println("El promedio o media del ArrayList guardado es: "+ promedio(enteros));

                scanner.close();
                return;
            }

        }while(numero != 0);

        scanner.close();

    }

    //método que permite encontrar el promedio de los elementos que están en el ArrayList de enteros
    public static double promedio(ArrayList<Integer> enteros){

        double sumatoria = 0;
        //foreach para sumar uno a uno los elementos que están dentro del ArrayList
        for (int entero : enteros) {
            sumatoria += entero;
        }
        //Se retorna el promedio de los elementos que están del del ArrayList
        return sumatoria / enteros.size();
    }

}
