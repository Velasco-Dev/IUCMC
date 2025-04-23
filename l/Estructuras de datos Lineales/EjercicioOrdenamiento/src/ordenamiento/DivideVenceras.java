package ordenamiento;

public class DivideVenceras {

    public static int sumaDV(int [] arreglo, int inicio, int fin) {

        if (inicio >= fin) {
            // Caso base: si el arreglo tiene un solo elemento, lo devolvemos
            // como resultado de la suma
            return arreglo[inicio];

        } else {

            int mitad = (inicio + fin) / 2;
            int derecha = sumaDV(arreglo, inicio, mitad);
            int izquierda = sumaDV(arreglo, mitad + 1, fin);
            return derecha + izquierda;

        }
    }
    
}
