import java.util.Scanner;
import static principal.bubbleSortEstatico.primero;
import static principal.bubbleSortRandom.segundo;
import static principal.dvSortEstatico.septimo;
import static principal.insercionSortEstatico.quinto;
import static principal.seleccionSortEstatico.cuarto;
import static principal.shakerSortEstatico.tercero;
import static principal.shellSortEstatico.sexto;

public class App {
    public static void main(String[] args) throws Exception {

        int opcion;
        // Menu de ejecución
        try (Scanner scanner = new Scanner(System.in)) {
            // Menu de ejecución
            System.out.println("""
                    1. Ejecutar Bubble Sort estatico.
                    2. Ejecutar Bubble Sort radom.
                    3. Ejecutar Shaker Sort estatico.
                    4. Ejecutar Seleccion Sort estatico.
                    5. Ejecutar Insercion Sort estatico.
                    //no sirve
                    6. Ejecutar Shell Sort estatico.
                    7. Ejecutar Divide y Venceras Sort random.
                    8. Salir.""");
            // Pedir opción al usuario
            System.out.print("Elija una opción: ");
            opcion = scanner.nextInt();
            // Llamar al menú de ejecución
            menu(opcion);
        }
    }

    public static void menu(int opcion) {

        switch (opcion) {
            case 1 -> {
                System.out.println("Ejecutando Bubble Sort estatico...");
                primero();
            }
            case 2 -> {
                System.out.println("Ejecutando Bubble Sort random...");
                segundo();
            }
            case 3 -> {
                System.out.println("Ejecutando Shaker Sort estatico...");
                tercero();
            }
            case 4 -> {
                System.out.println("Ejecutando Seleccion Sort estatico...");
                cuarto();
            }
            case 5 -> {
                System.out.println("Ejecutando Insercion Sort estatico...");
                quinto();
            }
            case 6 -> {
                System.out.println("Ejecutando Shell Sort estatico...");
                sexto();
            }
            case 7 -> {
                System.out.println("Ejecutando Divide y Venceras Sort estatico...");
                septimo();
            }
            //Hacer merge sort estatico
            case 8 -> System.out.println("Saliendo...");
            default -> System.out.println("Opción no válida.");
        }

    }
}
