package decimo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class decimoPunto {

    public static void ejercicioPartidos() {

        System.out.println("10. Con el ejercicio de Partidos realizado en clase adicionar las siguientes funcionalidades al programa:");
        //DSefinicion del arrayList
        ArrayList<String[]> partidos = new ArrayList<>();
        //ubicación del archivo
        String filePath = "src\\decimo\\partidos.txt";

        //Cortar txt por ::
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] datos = linea.split("::");
                if (datos.length == 4) {
                    partidos.add(datos);
                }
            }
        } catch (IOException e) {
            System.out.println("Error al leer el archivo: " + e.getMessage());
            return;
        }

        System.out.println("\na) Mostrar los partidos de futbol donde el visitante fue el ganador e imprimir: ");
        for (String[] partido : partidos) {
            String local = partido[0];
            String visitante = partido[1];
            int golesLocal = Integer.parseInt(partido[2]);
            int golesVisitante = Integer.parseInt(partido[3]);

            if (golesVisitante > golesLocal) {
                System.out.println(local + " vs " + visitante + " - " + golesLocal + ":" + golesVisitante);
            }
        }

        int victoriasSevilla = 0;

        for (String[] partido : partidos) {
            String local = partido[0];
            String visitante = partido[1];
            int golesLocal = Integer.parseInt(partido[2]);
            int golesVisitante = Integer.parseInt(partido[3]);

            if ((local.equals("Sevilla") && golesLocal > golesVisitante) ||
                    (visitante.equals("Sevilla") && golesVisitante > golesLocal)) {
                victoriasSevilla++;
            }
        }

        System.out.println("\nb) Sevilla ganó " + victoriasSevilla + " veces.");

        int victoriasLocales = 0;
        for (String[] partido : partidos) {
            int golesLocal = Integer.parseInt(partido[2]);
            int golesVisitante = Integer.parseInt(partido[3]);

            if (golesLocal > golesVisitante) {
                victoriasLocales++;
            }
        }

        //c) Eliminar los partidos de futbol del ArrayList, cuyo resultado no sea un empate e imprimir
        partidos.removeIf(partido -> Integer.parseInt(partido[2]) != Integer.parseInt(partido[3]));

        System.out.println("\nPartidos que terminaron en empate:");
        for (String[] partido : partidos) {
            System.out.println(partido[0] + " vs " + partido[1] + " - " + partido[2] + ":" + partido[3]);
        }

        System.out.println("\nd) Contar cuantos partidos gano el equipo local: " + victoriasLocales);

    }

}
