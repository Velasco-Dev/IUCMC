package promedio;

public class Promedio {
    
    public static int promedio(int[] edades){

        int promedio = 0;

        for (int edad : edades) {
            promedio += edad;
        }
        
        return promedio / edades.length;
    }
}
