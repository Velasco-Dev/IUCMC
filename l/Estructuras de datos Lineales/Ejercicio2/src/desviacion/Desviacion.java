package desviacion;
import promedio.*;

public class Desviacion {

    public static double desviacion(int[] edades) {

        Promedio promedio = new Promedio();

        double desviacion = 0;
        int prom = promedio.promedio(edades);
        int n = edades.length;
        double sumatoria = 0;

        for (int edad : edades) {
            sumatoria += Math.pow(edad - prom, 2);
        }

        desviacion = Math.sqrt(sumatoria / n);

        return desviacion;
    }
}
