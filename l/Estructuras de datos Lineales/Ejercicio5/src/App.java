
import basico.Basico;
import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingresa el número de libros: ");
        int numLibros = scanner.nextInt();
        
        System.out.print("\nLa sumatoria de las paginas de los libros: "+ Basico.SumatoriaBasica(numLibros));
        scanner.close();
    }
}
