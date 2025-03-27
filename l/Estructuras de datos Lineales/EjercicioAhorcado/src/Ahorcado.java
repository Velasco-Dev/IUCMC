import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import interfaces.Command;

public class Ahorcado {

    // deifición del mapeador para el menú
    private static final Map<Integer, Command> menuOptions = new HashMap<>();
    // definición de variable de verificación para la entrada
    static boolean entradaValida = false;

    // agregación de opciones en el menú
    static {
        menuOptions.put(1, () -> game.HangedGame.Game());
        menuOptions.put(2, () -> game.HangedGame.Salir());
    }

    // deifinición del método principal
    public static void Game() {
        Scanner scanner = new Scanner(System.in);

        // Ciclo que muestra el menú hasta que la entrada sea válida
        while (!entradaValida) {
            // Mostrar menú
            mostrarMenu();
            entradaValida = false;
            // Verificación de valor entero en la entrada
            if (scanner.hasNextInt()) {
                // asignación a la variable opción que instancia el método obtenerOpción que a
                // su vez recibe el número ingresado por el usuario
                int opcion = obtenerOpcion(scanner);
                // asiganción de true para la variable de verificación para que se logre
                // ejecutar la opción
                entradaValida = true;
                /*
                 * ejecución de la opción seleccionada, llamando al método ejecutarOpción al
                 * cuál le pasa la entrada del usuario
                 * para verificar si existe o no en el menú
                 */
                ejecutarOpcion(opcion);

            } else {

                System.out.println("Entrada no valida, solo se aceptan numeros enteros.");
                // limpia el caché del scanner para que vuelva a recibir un valor "de cero"
                scanner.next();

            }
        }
    }

    // Definición del método que contiene el menú
    private static void mostrarMenu() {
        System.out.println("=================== Bienvenido a ===================");
        System.out.println("==================== Haged Game ====================");
        System.out.println("=============== Ingenieria Informatica =============");
        System.out.println("====================== Grupo SENA ==================");
        System.out.println("================ Ruben D. Velasco B. ===============");
        System.out.println("1. Empezar a Jugar.");
        System.out.println("2. Terminar el Juego.");
        System.out.println("====================================================");
        System.out.print("Opcion: ");
    }

    // definición del método para obtener la opción
    private static int obtenerOpcion(Scanner scanner) {
        // retorna la opción ingresada, creando una ternaria que verifica que la entrada
        // sea de tipo entero
        return scanner.hasNextInt() ? scanner.nextInt() : -1;
    }

    // definición del método para ejecutar la opción seleccionada
    private static void ejecutarOpcion(int opcion) {
        Command command = menuOptions.getOrDefault(opcion,
                () -> {
                    System.out.println("Opción no válida.");
                    // en caso no ser una opción valida, muestra de nuevo el menú de opciones
                    entradaValida = false;
                });
        // ejecuta la opción
        command.execute();
    }

}
