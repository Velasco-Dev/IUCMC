package puntoCuatro;

import java.util.Arrays;
import java.util.Random;

public class puntoCuatro {

    public static void cuatro() {

        // Array de nombres posibles
        String[] nombresDisponibles = {
                "Kalix", "Tagpa", "Javier", "Barbaro", "Circulo Vicioso",
                "Alvaro", "Cristian", "Aldair", "Mamir", "Ansu Fati",
                "Waro Waro", "AnuelAA", "Ruben", "Andrea", "Blessd", "Hola Profe"
        };

        // Crear array de 10 nombres aleatorios
        String[] nombres = new String[10];
        Random rand = new Random();

        for (int i = 0; i < nombres.length; i++) {
            int indiceAleatorio = rand.nextInt(nombresDisponibles.length);
            nombres[i] = nombresDisponibles[indiceAleatorio];
        }

        //arreglo original
        System.out.println("\nEl arreglo original de nombres es: " + Arrays.toString(nombres));

        quickSort(nombres, 0, nombres.length - 1);

        //arreglo ordenado
        System.out.println("El arreglo ordenado de nombres es: " + Arrays.toString(nombres)+"\n");
    }

    // metodo para particionar el arreglo
    private static int partition(String[] nombres, int izquierda, int derecha) {
        String pivote = nombres[derecha];
        int i = (izquierda - 1);
        
        for (int j = izquierda; j < derecha; j++) {
            if (nombres[j].compareToIgnoreCase(pivote) <= 0) {
                i++;
                // Intercambiar elementos
                String temp = nombres[i];
                nombres[i] = nombres[j];
                nombres[j] = temp;
            }
        }
        
        // Colocar el pivote en su posición correcta
        String temp = nombres[i + 1];
        nombres[i + 1] = nombres[derecha];
        nombres[derecha] = temp;
        
        return i + 1;
    }

    // metood que usa ordenamiento quickSort
    public static void quickSort(String[] nombres, int izquierda, int derecha) {
        if (izquierda < derecha) {
            // Obtener el indice de partición
            int pi = partition(nombres, izquierda, derecha);
            
            // Ordenar los elementos antes y despues de la particion
            quickSort(nombres, izquierda, pi - 1);
            quickSort(nombres, pi + 1, derecha);
        }
    }
}
