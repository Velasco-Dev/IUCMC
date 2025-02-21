/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicios5;

import java.util.ArrayList;
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

        int tope, i, valor;
        boolean par;

        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingresa el tamaño del arreglo de numeros: ");
        tope = scanner.nextInt();

        ArrayList<Integer> valores = new ArrayList<>();

        for(i=1; i<=tope; i++){
            
            System.out.print("Ingresa el "+ i +"° valor: ");
            valor = scanner.nextInt();
            
            scanner.close();  
            
            par = esPar(valor);
            
            if(par){
                valores.add(valor);
            }            
            
        }
        
        int sumatoria = calcularSumaCuadradosPares(valores);
            
        System.out.print("La suma de las potencias de los numeros pares es: "+ sumatoria);               
    }

    private static boolean esPar(int valor) {
       
        if (valor % 2 == 0) {
            return true;
        }
        
        return false;
    }

    private static int calcularSumaCuadradosPares(ArrayList<Integer> numeros) {

        int suma = 0;
        double potencia;

        for (int i : numeros) {
            potencia = Math.pow(i, 2);
            suma += potencia;
        }

        return suma;
    }
}