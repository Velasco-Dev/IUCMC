package ordenamiento;

public class Burbuja {

    public static int[] ordenamientoBurbuja(int [] elementos) {

        boolean orden = true;

        while (orden) {
            orden = false;
            for (int i = 0; i < elementos.length - 1; i++) {
                if (elementos[i]> elementos[i+1]) {
                    int aux = elementos[i];
                    elementos[i] = elementos[i+1];
                    elementos[i+1] = aux;
                    orden = true;
                }
            }
        }

        return elementos;
    }
    
}
