package sexto;

import java.util.ArrayList;
import java.util.Arrays;

public class sextoPunto {

    public static void arrayListNombres(){

        System.out.println("6. Crear un ArrayList con 5 nombres y realizar las siguientes operaciones:");

        ArrayList<String> nombres = new ArrayList<>(5);
        //se añaden todos los elementos al arraylist de nombre del arreglo como lista 
        nombres.addAll(Arrays.asList("Yenhy", "Juan", "Teresa", "Fernando", "Jade"));

        System.out.println("a) Imprimir el ArrayList: "+ nombres);
        //se añade Luis en la posición 1 del array
        nombres.add(1, "Luis");

        System.out.println("b) Adicionar en la posición 1 un nuevo nombre: "+nombres);
        //se elimina la posoción 0 del arreglo
        nombres.remove(0);
        System.out.println("c) Remover de la posición 0 el nombre correspondiente: "+nombres);
        //se añade "Liliana" en el indice 0 dsel ArrayList
        nombres.add(0, "Liliana");
        System.out.println("d) Adicionar en la posición 0 un nuevo nombre e) Imprimir el ArrayList: "+nombres);
        //se imprime el nombre de la primera posición del arreglo
        System.out.println("f) Obtener el nombre de la posición 1 como String: "+nombres.get(1));
        //se imprime el nombre de la última posición del arreglo
        System.out.println("g) Obtener el ultimo nombre de la posición e imprimirlo: "+nombres.getLast());

    }
    
}
