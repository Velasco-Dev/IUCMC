package principal;

import java.util.Arrays;

public class shellSortEstatico {

    public static void sexto(){
        //Arreglo de elementos a ordenar
        int [] elementos = { 8, 5, 2, 3, 1, 15, -2, 24, 77, 100, 88, 0, 22, 11, 45, -100};

        // Imprimir arreglo original
        System.out.println("El arreglo original es: " + Arrays.toString(elementos));

        sort.Shell.ordenamientoShell(elementos);

        // Imprimir arreglo ordenado
        System.out.println("El arreglo ordenado es: " + Arrays.toString(elementos));
    }
    
}
