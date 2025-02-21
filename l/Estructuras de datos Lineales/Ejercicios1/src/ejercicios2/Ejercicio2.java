/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicios2;

import java.util.Scanner;

/**
 *
 * @author MMEDIA-MOVIL-9
 */
public class Ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        int a;
        double potencia;

        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingresa el valor de la base: ");
        a = scanner.nextInt();

        potencia = Math.pow(a, 2);
        System.out.println("El resultado de la potencia es: " + potencia);
        scanner.close();
    }
}
