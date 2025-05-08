import Utils.Input;
import interfaces.Command;
import java.util.HashMap;
import java.util.Map;
import puntoDos.puntoDos;
import puntoUno.puntoUno;

public class Parcial {
    // deifición del mapeador para el menú
    private static final Map<Integer, Command> menuOptions = new HashMap<>();
    // definición de variable de verificación para la entrada
    static boolean entradaValida = false;

    // agregación de opciones en el menú
    static {
        menuOptions.put(0, () -> Salir());
        menuOptions.put(1, () -> puntoUno.matrices());
        menuOptions.put(2, () -> puntoDos.primos());
        // menuOptions.put(3, () -> tercerPunto.factorial());
    }

    // deifinición del método principal
    public static void Parciall() {

        while (!entradaValida) {
            mostrarMenu();
            int opcion = Input.getInt("Opcion: ");
            entradaValida = false;

            if (opcion <= 3) {
                entradaValida = true;
                ejecutarOpcion(opcion);
            }
        }
    }

    private static void Salir() {
        System.out.println("""
                =====================================================
                ====================== Saliendo =====================
                ===================== Hasta luego ===================
                =====================================================
                """);
        System.exit(0);
    }

    // Definición del método que contiene el menú
    private static void mostrarMenu() {
        System.out.print("""
                =====================================================
                ==================== Bienvenido a ===================
                ================ Parcial Segundo Corte ==============
                =============== Ingenieria Informatica ==============
                ====================== Grupo SENA ===================
                ================= Ruben D. Velasco B. ===============
                =====================================================
                Menú de Opciones:
                0. Salir
                1. Punto 1
                2. Punto 2
                3. Punto 3
                  (Numeros mayores a 3 muestran el menu nuevamente)
                =====================================================
                """);
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
