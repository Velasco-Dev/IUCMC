import java.util.Scanner;

public class Ejercicio4 {

    public static void Ejercicio(){

        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un numero: ");
        int numero = scanner.nextInt();
        scanner.close();

        int sumaBucle = bucle.sumaBucle.CalularSuma(numero);
        long sumaFormula = formula.sumaFormula.CalularSumaFormula(numero);

        long sumaBucleTime = System.nanoTime();
        
        System.out.println("La suma es: "+sumaBucle);
        System.out.println("La suma es: "+sumaFormula);

        System.out.println("El tiempo del bucle es: "+sumaBucleTime/1e6 +" ms");


    }
    
}
