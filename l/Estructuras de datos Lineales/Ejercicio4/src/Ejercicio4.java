import java.util.Scanner;

public class Ejercicio4 {

    public static void Ejercicio(){

        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un numero: ");
        int numero = scanner.nextInt();

        int sumaBucle = bucle.sumaBucle.CalularSuma(numero);
        long sumaFormula = formula.sumaFormula.CalularSumaFormula(numero);
        System.out.print("La suma es: "+sumaBucle);
        System.out.print("La suma es: "+sumaFormula);

        scanner.close();
        
    }
    
}
