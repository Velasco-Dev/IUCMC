package puntoUno;

import java.util.Random;
import utils.Input;

public class puntoUno {

    public static void matrices(){

        Random random = new Random();

        //Definición del tamaño de la matríz
        int tamano = Input.getInt("\nIngrese el número de filas y columnas para la matriz: ");
        //Definición de la matriz de tamaño nxm (cuadrada)
        int [][] matriz = new int [tamano][tamano];

        int filas = matriz.length;// inicializar filas
        int columna = matriz[0].length;// inicializar columnas

        //Llenado de la matriz con números random
        for (int i = 0; i < filas; i++) {//recorrido por filas
            for (int j = 0; j < columna; j++) {//recorrido por columnas
                //Llena la matriz con elementos random que pueden tener un valor máximo de 10
                matriz[i][j] = random.nextInt(10);
            }
        }
        
        System.out.println("a) La matriz generada de forma aleatoria es: ");

        //Impresión de la matriz
        for (int i = 0; i < filas; i++) {//recorrido por filas
            for (int j = 0; j < columna; j++) {//recorrido por columnas
                System.out.printf("%5d", matriz[i][j]);
            }
            System.out.println();
        }     
        
        System.out.println("b) Sumar matriz original con su transpuesta: ");

        int matrizT [][] = matriz;

        System.out.println("b.1) Matriz transpuesta: ");

        for (int i = 0; i < filas; i++) {//recorrido por filas
            for (int j = 0; j < columna; j++) {//recorrido por columnas
                System.out.printf("%5d", matrizT[j][i]);
            }
            System.out.println();
        } 

        System.out.println("b.2) Sumar las matrices: ");

        for (int i = 0; i < filas; i++) {//recorrido por filas
            for (int j = 0; j < columna; j++) {//recorrido por columnas
                System.out.printf("%5d", matriz[i][j] + matrizT[j][i]);
            }
            System.out.println();
        } 

        System.out.println("c) Multiplicar las esquinas de la matriz resultante: ");

        for (int i = 0; i < filas; i++) {//recorrido por filas
            for (int j = 0; j < columna; j++) {//recorrido por columnas

            }
            System.out.println();
        } 
    }

}
