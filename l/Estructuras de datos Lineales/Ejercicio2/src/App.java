import java.util.*;

import moda.*;
import promedio.*;
import desviacion.*;

public class App {
    public static void main(String[] args) throws Exception {

        Scanner scanner = new Scanner(System.in);
        int opcion = 0;
        boolean entradaValida = false;
        // System.out.println("Bienvenido:\n¿Que ejercicio deseas ejecutar?\n1. Ejercicio 1\n2. Ejercicio 2");
        // opcion = scanner.nextInt();

        while(!entradaValida){

            System.out.println("Bienvenido:\n¿Que ejercicio deseas ejecutar?"+
                                "\n1. Ejercicio 1\n2. Ejercicio 2");
            
            if(scanner.hasNextInt()){
                opcion = scanner.nextInt();
                entradaValida = true;

                if(opcion>2){

                    System.out.println("Opcion no valida");
                    entradaValida = false;

                }else if(opcion==1){
                    System.out.println("============================================\n"
                                        +"=Calduladora de promedio, moda y desviacion=\n"
                                        +"============================================");
                    System.out.print("Ingrese el numero de alumnos: ");
                    int n = scanner.nextInt();
                    int[] edades = new int[n];
        
                    for(int i=0; i<n; i++){
                        System.out.print("Ingrese la edad del estudiante "+(i+1)+": ");
                        int edad = scanner.nextInt();
                        edades[i] = edad;
                    }
        
                    Promedio promedio = new Promedio();
                    Moda moda = new Moda();
                    Desviacion desviacion = new Desviacion();
        
                    int prom = promedio.promedio(edades);
                    System.out.println("============================================\n"+
                                    "El promedio de edades de los estudiantes es: "+ prom);
                    int mod = moda.moda(edades);
                    System.out.println("============================================\n"+
                                    "La moda de edades de los estudiantes es: "+ mod);
                    double desv = desviacion.desviacion(edades);
                    System.out.println("============================================\n"+
                                    "La desviacion de edades de los estudiantes es: "+ desv+
                                    "\n============================================");
                    
                }

            }else{
                System.out.println("============================================\n"+
                                "Entrada no valida, solo se aceptan numeros enteros.\n"+
                                "============================================");
                scanner.next();
            }
        }
        scanner.close();
    }
/* 
    public static int promedio(int[] edades){

        int promedio = 0;

        for (int edad : edades) {
            promedio += edad;
        }
        
        return promedio / edades.length;
    }

    public static int moda(int[] edades){
        // Ordenamos el array
        Arrays.sort(edades); 
    
        int moda = edades[0];
        int maxFrecuencia = 1;
        int frecuenciaActual = 1;
        
        for (int i = 1; i < edades.length; i++) {
            if (edades[i] == edades[i-1]) {
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

    public static double desviacion(int[] edades){
        double desviacion = 0;
        int promedio = promedio(edades);
        int n = edades.length;
        double sumatoria = 0;

        for (int edad : edades) {
            sumatoria += Math.pow(edad - promedio, 2);
        }

        desviacion = Math.sqrt(sumatoria/n);

        return desviacion;
    }
    */
}
