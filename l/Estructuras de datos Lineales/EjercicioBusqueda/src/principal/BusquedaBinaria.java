package principal;

public class BusquedaBinaria {

    /**
     * Realiza una búsqueda binaria en un arreglo ordenado.
     * @param arr Arreglo ordenado de enteros.
     * @param objetivo Valor a buscar.
     * @return Índice del valor encontrado, o -1 si no está en el arreglo.
     */
    public static int busquedaBinaria(int[] arr, int objetivo) {
        int izquierda = 0;
        int derecha = arr.length - 1;

        while (izquierda <= derecha) {
            int medio = izquierda + (derecha - izquierda) / 2;

            if (arr[medio] == objetivo) {
                return medio;
            }

            if (arr[medio] < objetivo) {
                izquierda = medio + 1;
            } else {
                derecha = medio - 1;
            }
        }

        return -1; // No encontrado
    }

}
