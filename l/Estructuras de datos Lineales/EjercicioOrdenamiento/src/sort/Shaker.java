package sort;

public class Shaker {

    public static void ordenamientoShaker(int[] elementos) {
        
        int inicio = 0;
        int fin = elementos.length - 1;

        while (inicio <= fin) {

            for (int i = inicio; i < fin - 1; i++) {
                if (elementos[i] > elementos[i + 1]) {
                    int aux = elementos[i + 1];
                    elementos[i + 1] = elementos[i];
                    elementos[i] = aux;
                }
            }

            fin--;

            for (int i = fin; i > inicio + 1; i--) {
                if (elementos[i] < elementos[i - 1]) {
                    int aux = elementos[i - 1];
                    elementos[i - 1] = elementos[i];
                    elementos[i] = aux;
                }
            }

            inicio++;
        }
    }
    
}
