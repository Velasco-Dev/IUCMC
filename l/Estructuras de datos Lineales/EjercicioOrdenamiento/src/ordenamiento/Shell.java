package ordenamiento;

public class Shell {

    public static void ordenamientoShell(int [] elementos) {
        int n = elementos.length;
        // Comenzar con un gran intervalo y reducirlo
        for (int intervalo = n / 2; intervalo > 0; intervalo /= 2) {
            // Hacer una inserción de Shell para este intervalo
            for (int i = intervalo; i < n; i++) {
                int aux;
                // Mover elementos de elementos[0..i-intervalo] que son mayores que aux
                // a una posición adelante de su posición actual
                if (elementos[i - intervalo] > elementos[i]) {
                    aux = elementos[i];
                    elementos[i] = elementos[i + intervalo];
                    elementos[i - intervalo] = aux;
                }
            }
        }
    }
    
}
