import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class App {

    private final static String NOMBRE_FICHERO = "src\\patidos.txt";

    public static void main(String[] args) throws Exception {

        System.out.println("Inicio el programa");

        ArrayList<PartidoFutbol> partidos = new ArrayList<>();

        File fichero = new File(NOMBRE_FICHERO);

        Scanner leerLineas = null;

        try {

            leerLineas = new Scanner(fichero);

            while (leerLineas.hasNext()) {
                String linea = leerLineas.nextLine();
                String[] cortarLinea = linea.split("::");

                PartidoFutbol partido = new PartidoFutbol();
                partido.setEquipoLocal(cortarLinea[0]);
                partido.setEquipoVisitante(cortarLinea[1]);
                partido.setGolLocal(Integer.parseInt(cortarLinea[2]));
                partido.setGolVisitante(Integer.parseInt(cortarLinea[3]));

                partidos.add(partido);
            }

        } catch (FileNotFoundException ex) {
            System.out.println("No se ha podido encontar el archivo.");
        }

        System.out.println("Cantidad de partidos: " + partidos.size());

        for (PartidoFutbol partidoFutbol : partidos) {
            System.out.println(partidoFutbol);
        }

    }
}
