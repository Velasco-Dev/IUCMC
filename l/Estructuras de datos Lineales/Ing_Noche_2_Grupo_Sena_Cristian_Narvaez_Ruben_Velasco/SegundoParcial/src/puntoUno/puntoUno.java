package puntoUno;

import utils.Input;

public class puntoUno {

    public static void uno() {

        int numero = Input.getInt("\nIngresa un numero: ");
        String binario = binarioDecimal(numero);
        System.out.println(numero + " en binario es: " + binario +"\n");

    }

    // Método para pasar de decimal a binario
    public static String binarioDecimal(int n) {
        return switch (n) {
            case 0 -> "0";
            case 1 -> "1";
            default -> binarioDecimal(n / 2) + (n % 2);
        };
    }

}
