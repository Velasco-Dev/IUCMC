import java.util.Scanner;
import static principal.bubbleSortEstatico.primero;
import static principal.bubbleSortRandom.segundo;
import static principal.shakerSortEstatico.tercero;


public class App {
    public static void main(String[] args) throws Exception {

        int opcion;
        //Menu de ejecución
        try (Scanner scanner = new Scanner(System.in)) {
            //Menu de ejecución
            System.out.println("""
                                       1. Ejecutar Bubble Sort estatico.
                                       2. Ejecutar Bubble Sort radom.
                                       3. Ejecutar Shaker Sort estatico.
                                       4. Salir.""");
            //Pedir opción al usuario
            System.out.print("Elija una opción: ");
            opcion = scanner.nextInt();
        }

        switch (opcion) {
            case 1 -> {
                System.out.println("Ejecutando Bubble Sort estatico...");
                primero();
            }
            case 2 -> {
                System.out.println("Ejecutando Bubble Sort radom...");   
                segundo();
            }
            case 3 -> {
                System.out.println("Ejecutando Shaker Sort estatico...");
                tercero();
            }
            case 4 -> System.out.println("Saliendo...");
            default -> System.out.println("Opción no válida.");
        }
    }
}
