package primero;

public class primerPunto {
    
    public static void primosList() {

        //Arreglo de números primos
        int[] primos = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 };

        System.out.println("1. Inicializar directamente un arreglo con los primeros 10 números primos e imprimir el arreglo.");
        System.out.print("Los primeros 10 números primos son: ");

        //Impresión de arreglo
        for (int primo : primos) {
            if (primo != 29) {
                System.out.print(primo + ", ");
            } else {
                System.out.print(primo + ".");
            }
        }
    }

}
