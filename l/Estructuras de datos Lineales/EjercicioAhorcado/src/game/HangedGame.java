package game;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class HangedGame {

    public static void Game() {

        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        // Definición del arraylist de palabras predefinidas
        ArrayList<String> palabras = new ArrayList<>(
                Arrays.asList("java", "desarrollo", "computador", "teclado", "ahorcado", "estructura", "solid", "informatica"));

        // Seleccionar una palabra al azar con la clase random
        String secreta = palabras.get(random.nextInt(palabras.size()));

        //definición del arraylist para representar la palabra con guiones
        ArrayList<Character> oculta = new ArrayList<>();
        // de acuerdo a la palabra escogida de forma aleatoria del arreglo y al tamaño en caracteres de esa palabra
        for (int i = 0; i < secreta.length(); i++) {
            //añade un guión en cada posición del array de caracteres de la palabra
            oculta.add('_');
        }

        //definición de la cantidad de oportunidades según el tamaño de la palabra
        int intentos = secreta.length() + 3;
        //definición de el arraylist de tipo caracter que contiene las letras con los intentos fallidos 
        ArrayList<Character> erradas = new ArrayList<>();

        // while principal del juego en donde el ciclo se va a repetir si hay intentos disponibles y además la palabra oculta contiene "_"
        while (intentos > 0 && oculta.contains('_')) {

            //se imprimen guiones que muestran el tamaño en caractéres de la palabra, 
            //llamando al método mostrarPalabra y pasandole la letra para que según sea 
            //necesario vaya descubriendo la palabra en caso de ingresar una letra correcta
            System.out.println("\nPalabra: " + mostrarPalabra(oculta));
            //muestra los intentos
            System.out.println("Intentos restantes: " + intentos);
            //muestra el arreglo de letras erradas
            System.out.println("Letras incorrectas: " + erradas);
            //se le pide al usuario que ingrese una letra para verificar si la palabra contiene dicha letra
            System.out.print("Ingrese una letra: ");
            //se parsea la letra a minusculas y toma solo la primera letra ingresada, 
            //así que aunque el usuario ingrese 3 letras, sólo toma la de la posición 0
            char letra = scanner.next().toLowerCase().charAt(0);

            // Verificar si la letra está en la palabra
            if (secreta.indexOf(letra) != -1) {
                // Reemplazar los guiones con la letra correcta
                for (int i = 0; i < secreta.length(); i++) {
                    //En la posición correcta
                    if (secreta.charAt(i) == letra) {
                        //cuantas veces aparezca esa letra
                        oculta.set(i, letra);
                    }
                }

            } else {
                // Letra incorrecta, restar intento y guardarla
                if (!erradas.contains(letra)) {
                    //añade la letra ingresada al arreglo de intentos fallidos
                    erradas.add(letra);
                    //se decrementan los intentos
                    intentos--;
                } else {

                    System.out.println("Ya intentaste con esa letra.");
                }
            }

            //Si durante el juego, se escribe 2, se sale del juego.
            if (Character.isDigit(letra) && letra == '2') {
                //Ejecución del método salir
                Salir();

            }
        }

        // Mensaje que se muestra al ganar o perder el juego
        if (!oculta.contains('_')) {

            System.out.println("\n¡Felicidades! Adivinaste la palabra: " + secreta);
        } else {

            System.out.println("\nGame Over. La palabra era: " + secreta);
        }

        //se cierra el scanner
        scanner.close();
    }

    //Método parta salir del programa
    public static void Salir() {
        
        System.out.println("\nGracias por jugar. ¡Hasta la próxima!");
        //Cierra la ejecución de la máquina virtual de java
        System.exit(0);

    }

    // Método para mostrar la palabra con espacios que recibe un arraylist de tipo caracter de nombre oculta
    private static String mostrarPalabra(ArrayList<Character> oculta) {
        //deinfición de un stringbuilder sb que es una clase que permite crear y modificar cadenas de caracteres
        StringBuilder sb = new StringBuilder();
        //for each que recorre la palabra que llega 
        for (char c : oculta) {
            //y de acuerdo a si el intento es satisfactorio agrega la letra y un espacio
            sb.append(c).append(" ");

        }
        //retorna el stringbuilder
        return sb.toString();
    }

}
