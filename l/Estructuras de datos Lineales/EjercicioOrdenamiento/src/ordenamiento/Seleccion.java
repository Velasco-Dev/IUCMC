package ordenamiento;

public class Seleccion {

    public static void ordenamientoSeleccion(int[] elementos) {

        // Recorrer el arreglo hasta el penúltimo elemento
        for (int i = 0; i < elementos.length - 1; i++) {
            // Último elemento ya está en su lugar
            for (int j = i + 1; j < elementos.length - 1; j++) {
                // Encontrar el elemento mínimo en el arreglo no ordenado
                if (elementos[i] > elementos[j]) {
                    // Intercambiar el elemento mínimo encontrado con el primer elemento
                    int aux = elementos[i];
                    elementos[i] = elementos[j];
                    elementos[j] = aux;
                }
            }
        }
        
    }

}
