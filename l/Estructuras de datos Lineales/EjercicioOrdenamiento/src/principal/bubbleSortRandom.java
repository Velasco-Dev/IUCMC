package principal;

import java.util.Arrays;
import java.util.Random;


public class bubbleSortRandom {

    public static void segundo(){
        ///Hacer un programa con 100 elementos aleatorios y ordenarlo con bubblesort
        /// Probar Shaker sort del seudocodigo de las dispositivas
        
        Random random = new Random();// Generador de números aleatorios

        int [] elementos = new int[1000];// Arreglo de 100 elementos

        for (int i = 0; i < elementos.length; i++) {
            elementos[i] = random.nextInt(1000);// Llenar el arreglo con números aleatorios
        }
        
        //Imprimir arreglo original
        System.out.println("El arreglo original es: "+Arrays.toString(elementos)+"\n");
    
        ordenamiento.Burbuja.ordenamientoBurbuja(elementos);
    
        //Imprimir arreglo ordenado
        System.out.println("El arreglo ordenado es: "+Arrays.toString(elementos)+"\n");
    }

    
}
