import java.util.Arrays;

public class App {
    public static void main(String[] args) throws Exception {

        ///Hacer un programa con 100 elementos aleatorios y ordenarlo con bubblesort
        /// Probar Shaker sort del seudocodigo de las dispositivas
        
        int [] elementos = {8, 5, 2, 3, 1};
        
        //Imprimir arreglo original
        System.out.println("El arreglo original es: "+Arrays.toString(elementos));

        bubbleSort.Burbuja.ordenamientoBurbuja(elementos);

        //Imprimir arreglo ordenado
        System.out.println("El arreglo ordenado es: "+Arrays.toString(elementos));

    }
}
