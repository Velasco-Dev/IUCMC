import interfaces.Command;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Recursividad {
    // deifición del mapeador para el menú
    private static final Map<Integer, Command> menuOptions = new HashMap<>();
    // definición de variable de verificación para la entrada
    static boolean entradaValida = false;

    // agregación de opciones en el menú
    static {
        menuOptions.put(1, () -> ejercicios.PuntoUno.uno());
        menuOptions.put(2, () -> ejercicios.PuntoDos.dos());
        menuOptions.put(3, () -> ejercicios.PuntoTres.tres());
        menuOptions.put(4, () -> ejercicios.PuntoCuatro.cuatro());
        menuOptions.put(5, () -> ejercicios.PuntoCinco.cinco());
        menuOptions.put(6, () -> ejercicios.PuntoSeis.seis());
        menuOptions.put(7, () -> ejercicios.PuntoSiete.siete());
        menuOptions.put(8, () -> ejercicios.PuntoOcho.ocho());
        menuOptions.put(9, () -> ejercicios.PuntoNueve.nueve());
        menuOptions.put(10, () -> ejercicios.PuntoDiez.diez());
        menuOptions.put(11, () -> ejercicios.PuntoOnce.once());
        menuOptions.put(12, () -> ejercicios.PuntoDoce.doce());
        menuOptions.put(13, () -> ejercicios.PuntoTrece.trece());
        menuOptions.put(14, () -> ejercicios.PuntoCatorce.catorce());
        menuOptions.put(15, () -> System.exit(0));
    }

    // deifinición del método principal
    public static void Taller() {
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
        // imprime el menú de opciones
        System.out.println("""
                =================== Bienvenido a ===================
                ============== Taller de Recursividad ==============
                ============== Ingenieria Informatica ==============
                =================== Grupo SENA =====================
                ================ Ruben D. Velasco B. ===============
                1. Punto 1.
                2. Punto 2.
                3. Punto 3.
                4. Punto 4.
                5. Punto 5.
                6. Punto 6.
                7. Punto 7.
                8. Punto 8.
                9. Punto 9.
                10. Punto 10.
                11. Punto 11.
                12. Punto 12.
                13. Punto 13.
                14. Punto 14.
                15. Salir.
                ====================================================""");
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
