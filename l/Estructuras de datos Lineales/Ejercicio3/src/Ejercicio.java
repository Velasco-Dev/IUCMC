import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import interfaces.Command;

import primero.primerPunto;
import segundo.segundoPunto;
import tercero.tercerPunto;
import cuarto.cuartoPunto;
import quinto.quintoPunto;
import sexto.sextoPunto;
import septimo.septimoPunto;
import octavo.octavoPunto;
import noveno.novenoPunto;
import decimo.decimoPunto;

public class Ejercicio {

    //deifición del mapeador para el menú
    private static final Map<Integer, Command> menuOptions = new HashMap<>();
    //definición de variable de verificación para la entrada
    static boolean entradaValida = false;

    
    //agregación de opciones en el menú
    static {
        menuOptions.put(1, () -> primerPunto.primosList());
        menuOptions.put(2, () -> segundoPunto.cienNumerosPares());
        menuOptions.put(3, () -> tercerPunto.factorial());
        menuOptions.put(4, () -> cuartoPunto.numeroMenorMayor());
        menuOptions.put(5, () -> quintoPunto.invertirArreglo());
        menuOptions.put(6, () -> sextoPunto.arrayListNombres());
        menuOptions.put(7, () -> septimoPunto.arrayListHastaCero());
        menuOptions.put(8, () -> octavoPunto.arrayListPares());
        menuOptions.put(9, () -> novenoPunto.arrayListObjetos());
        menuOptions.put(10, () -> decimoPunto.ejercicioPartidos());
    }

    //deifinición del método principal
    public static void Ejercicio3() {
        Scanner scanner = new Scanner(System.in);

        //Ciclo que muestra el menú hasta que la entrada sea válida
        while (!entradaValida) {
            //Mostrar menú
            mostrarMenu();
            entradaValida = false;
            //Verificación de valor entero en la entrada
            if (scanner.hasNextInt()) {
                //asignación a la variable opción que instancia el método obtenerOpción que a su vez recibe el número ingresado por el usuario
                int opcion = obtenerOpcion(scanner);
                //asiganción de true para la variable de verificación para que se logre ejecutar la opción
                entradaValida = true;
                /*ejecución de la opción seleccionada, llamando al método ejecutarOpción al cuál le pasa la entrada del usuario 
                para verificar si existe o no en el menú*/
                ejecutarOpcion(opcion);

            } else {
                
                System.out.println("Entrada no valida, solo se aceptan numeros enteros.");
                //limpia el caché del scanner para que vuelva a recibir un valor "de cero"
                scanner.next();

            }
        }
    }

    //Definición del método que contiene el menú
    private static void mostrarMenu() {
        System.out.println("=================== Bienvenido a ===================");
        System.out.println("============= Ejercicios sobre Arreglos ============");
        System.out.println("============ Unidimensionales y ArrayList ==========");
        System.out.println("1. Punto 1");
        System.out.println("2. Punto 2");
        System.out.println("3. Punto 3");
        System.out.println("4. Punto 4");
        System.out.println("5. Punto 5");
        System.out.println("6. Punto 6");
        System.out.println("7. Punto 7");
        System.out.println("8. Punto 8");
        System.out.println("9. Punto 9");
        System.out.print("10. Punto 10\nOpcion: ");
    }

    //definición del método para obtener la opción
    private static int obtenerOpcion(Scanner scanner) {
        //retorna la opción ingresada, creando una ternaria que verifica que la entrada sea de tipo entero 
        return scanner.hasNextInt() ? scanner.nextInt() : -1;
    }

    //definición del método para ejecutar la opción seleccionada
    private static void ejecutarOpcion(int opcion) {
        Command command = menuOptions.getOrDefault(opcion,
                () -> {
                    System.out.println("Opción no válida.");
                    //en caso no ser una opción valida, muestra de nuevo el menú de opciones
                    entradaValida = false;
                });
        //ejecuta la opción
        command.execute();
    }
}
