package ejercicios;

import java.util.Arrays;

public class PuntoDoce {

    public static void doce() {

        System.out.println("12. Cree una matriz de tamaño mXn y sume los elementos de la matriz.");
        int[][] matriz = {
                { 15, 22, 31 },
                { 43, 58, 65 },
                { 77, 81, 29 }
        };
        int suma = sumarMatriz(matriz, 0, 0);
        // Mostrar la matriz con formato personalizado
        String matrizFormateada = Arrays.deepToString(matriz)
                .replace("], [", "]\n\t\t[")
                .replace("[[", "\t[")
                .replace("]]", "]");
        // Mostrar la matriz y la suma de los elementos
        System.out.println("La matriz es:" + matrizFormateada);
        // Mostrar el resultado
        System.out.println("Y la suma de sus elementos es: " + suma);
    }

    private static int sumarMatriz(int[][] matriz, int i, int j) {
        // Caso base: si hemos llegado al final de la matriz, retornamos 0
        if (i == matriz.length) {
            return 0;
        }

        if (j == matriz[i].length) {
            return sumarMatriz(matriz, i + 1, 0); // Pasar a la siguiente fila
        }

        // Sumar el elemento actual y llamar recursivamente al siguiente elemento
        return matriz[i][j] + sumarMatriz(matriz, i, j + 1);
    }

}
