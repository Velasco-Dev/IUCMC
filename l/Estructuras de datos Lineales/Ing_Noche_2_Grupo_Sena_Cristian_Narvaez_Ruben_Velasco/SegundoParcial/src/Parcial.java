import interfaces.Command;
import java.util.HashMap;
import java.util.Map;
import puntoDos.puntoDos;
import puntoTres.puntoTres;
import puntoCuatro.puntoCuatro;
import puntoUno.puntoUno;
import utils.Input;

public class Parcial {
    // deifición del mapeador para el menú
    private static final Map<Integer, Command> menuOptions = new HashMap<>();
    // definición de variable de verificación para la entrada
    static boolean entradaValida = false;

    // agregación de opciones en el menú
    static {
        menuOptions.put(0, () -> Salir());
        menuOptions.put(1, () -> puntoUno.uno());
        menuOptions.put(2, () -> puntoDos.dos());
        menuOptions.put(3, () -> puntoTres.tres());
        menuOptions.put(4, () -> puntoCuatro.cuatro());
    }
    public static void main(String[] args) throws Exception {
        while (!entradaValida) {
            mostrarMenu();
            int opcion = Input.getInt("Opcion: ");
            
            if (opcion <= 4) {
                entradaValida = false;
                ejecutarOpcion(opcion);
            }else{
                System.out.println("\nOpcion no definida\n");
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
                ================= Cristian S. Narvaez ===============
                ================= Ruben D. Velasco B. ===============
                =====================================================
                Menú de Opciones:
                0. Salir
                1. Punto 1
                2. Punto 2
                3. Punto 3
                4. Punto 4
                =====================================================
                """);
    }

    // definición del método para ejecutar la opción seleccionada
    private static void ejecutarOpcion(int opcion) {
        Command command = menuOptions.getOrDefault(opcion,
                () -> {
                    // en caso no ser una opción valida, muestra de nuevo el menú de opciones
                    entradaValida = false;
                });
        // ejecuta la opción
        command.execute();
    }
}
