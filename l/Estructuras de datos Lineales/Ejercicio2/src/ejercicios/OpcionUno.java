package ejercicios;


public class OpcionUno {

    public static String ejercicioUno() {
        int[] primos = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 };
        StringBuilder resultado = new StringBuilder("Los primeros 10 números primos son: ");

        for (int primo : primos) {
            if (primo != 29) {
                resultado.append(primo).append(", ");
            } else {
                resultado.append(primo).append(".");
            }
        }

        return resultado.toString();
    }
    
}
