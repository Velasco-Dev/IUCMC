package moda;

import java.util.*;

public class Moda {

    public static int moda(int[] edades) {
        // Ordenamos el array
        Arrays.sort(edades);

        int moda = edades[0];
        int maxFrecuencia = 1;
        int frecuenciaActual = 1;

        for (int i = 1; i < edades.length; i++) {
            if (edades[i] == edades[i - 1]) {
                frecuenciaActual++;
                if (frecuenciaActual > maxFrecuencia) {
                    maxFrecuencia = frecuenciaActual;
                    moda = edades[i];
                }
            } else {
                frecuenciaActual = 1;
            }
        }

        return moda;
    }

}
