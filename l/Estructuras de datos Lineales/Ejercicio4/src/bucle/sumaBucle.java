package bucle;

public class sumaBucle {

    public static int CalularSuma(int numero) {
        int suma = 0;
        for (int i = 1; i <= numero; i++) {
            suma += i;
        }
        return suma;
    }
    
}
