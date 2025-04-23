package ordenamiento;

public class Insercion {

    public static void ordenamientoInsercion(int [] elementos) {
        int aux;
        // Recorrer el arreglo desde el segundo elemento hasta el último elemento
        int j;
        for (int i = 1; i < elementos.length - 1; i++) {
            aux = elementos[i];
            j = i - 1;
            // Mover los elementos de elementos[0..i-1], que son mayores que key,
            // a una posición adelante de su posición actual
            while (j >= 0 && elementos[j] > aux) {
                elementos[j + 1] = elementos[j];
                j--;
            }
            elementos[j + 1] = aux;
        }
    }
    
}
