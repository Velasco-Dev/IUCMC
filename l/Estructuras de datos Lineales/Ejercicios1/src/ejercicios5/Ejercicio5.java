/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicios5;

import java.util.Scanner;

/**
 *
 * @author MMEDIA-MOVIL-9
 */
public class Ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        int b, h, area;

        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingresa el valor de la base: ");
        b = scanner.nextInt();

        System.out.print("Ingresa el valor de la altura: ");
        h = scanner.nextInt();

        area = (b * h);
        System.out.println("El area es: " + area);
        scanner.close();
    }
}
