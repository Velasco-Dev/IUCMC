package basico;

import java.util.ArrayList;
import java.util.Scanner;

public class Basico {

        public static int SumatoriaBasica(int numLibros) {
        
        ArrayList<Integer> libros = new ArrayList<>();
        int sumatoria = 0;
        int paginas = 0;
        Scanner scanner = new Scanner(System.in);

        for (int i = 0; i < numLibros; i++) {
            libros.add(paginas);
        }

        for (int i = 0; i < numLibros; i++) {
            System.out.print("Ingresa el número de páginas del libro " + (i + 1) + ": ");
            paginas = scanner.nextInt();
            libros.set(i, paginas);
            sumatoria += paginas;
        }
        
        scanner.close();
        
        return sumatoria; 
    }
    
}
