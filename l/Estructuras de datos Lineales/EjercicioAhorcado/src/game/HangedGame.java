package game;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class HangedGame {

    public static void Game() {

        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        // Lista de palabras predefinidas
        ArrayList<String> palabras = new ArrayList<>(
                Arrays.asList("java", "desarrollo", "computador", "teclado", "ahorcado", "estructura", "solid", "informatica"));

        // Seleccionar una palabra al azar
        String secreta = palabras.get(random.nextInt(palabras.size()));

        // Lista para representar la palabra con guiones
        ArrayList<Character> oculta = new ArrayList<>();

        for (int i = 0; i < secreta.length(); i++) {

            oculta.add('_');
        }

        int intentos = secreta.length() + 3;
        ArrayList<Character> letrasErradas = new ArrayList<>();

        // Bucle principal del juego
        while (intentos > 0 && oculta.contains('_')) {

            System.out.println("\nPalabra: " + mostrarPalabra(oculta));
            System.out.println("Intentos restantes: " + intentos);
            System.out.println("Letras incorrectas: " + letrasErradas);
            System.out.print("Ingrese una letra: ");
            char letra = scanner.next().toLowerCase().charAt(0);

            // Verificar si la letra está en la palabra
            if (secreta.indexOf(letra) != -1) {
                // Reemplazar los guiones con la letra correcta
                for (int i = 0; i < secreta.length(); i++) {

                    if (secreta.charAt(i) == letra) {

                        oculta.set(i, letra);
                    }
                }

            } else {
                // Letra incorrecta, restar intento y guardarla
                if (!letrasErradas.contains(letra)) {

                    letrasErradas.add(letra);
                    intentos--;
                } else {

                    System.out.println("Ya intentaste con esa letra.");
                }
            }

            if (Character.isDigit(letra) && letra == '2') {

                Salir();

            }
        }

        // Resultado del juego
        if (!oculta.contains('_')) {

            System.out.println("\n¡Felicidades! Adivinaste la palabra: " + secreta);

        } else {

            System.out.println("\nGame Over. La palabra era: " + secreta);

        }

        scanner.close();
    }

    public static void Salir() {
        
        System.out.println("\nGracias por jugar. ¡Hasta la próxima!");
        System.exit(0);

    }

    // Método auxiliar para mostrar la palabra con espacios
    private static String mostrarPalabra(ArrayList<Character> oculta) {

        StringBuilder sb = new StringBuilder();

        for (char c : oculta) {

            sb.append(c).append(" ");

        }

        return sb.toString();
    }

}
