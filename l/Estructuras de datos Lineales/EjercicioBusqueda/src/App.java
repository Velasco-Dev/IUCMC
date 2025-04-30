
import ordenamiento.Burbuja;
import static principal.BusquedaBinaria.busquedaBinaria;

public class App {
    
    public static void main(String[] args) {
        int[] arreglo = {24, 4, 65, 18, 102, 126, 140, 161, 8, 2};
        int objetivo = 140;

        int[] ordenado = Burbuja.ordenamientoBurbuja(arreglo);

        int resultado = busquedaBinaria(arreglo, objetivo);
        // int resultado = busquedaBinaria(ordenado, objetivo);

        if (resultado == -1) {
            System.out.println("El valor " + objetivo + " no se encontró en el arreglo.");
        } else {
            System.out.println("El valor " + objetivo + " se encontró en el índice: " + resultado);
        }
    }
}
