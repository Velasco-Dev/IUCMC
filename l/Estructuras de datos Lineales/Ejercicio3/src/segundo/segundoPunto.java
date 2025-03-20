package segundo;

public class segundoPunto {

    public static void cienNumeroPares(){

        System.out.println("2. Inicializar por programa un arreglo con los 100 primeros números pares e imprimirlo:");

        //Definición del arreglo
        int[] pares = new int[100];
        //Llenado del arreglo
        for (int i = 1; i < pares.length; i++) {
            pares[i] = i * 2;
        }
    
        System.out.println("============================================\n" +
                "a)Los primeros 100 números pares son: ");
        //Impresión en Linea
        for (int par : pares) {
    
            if (par == 0) {
                //no imprimir 0
                System.out.print("");
            } else if (par != 198) {
                //agregar comas después de cada valor
                System.out.print(par + ", ");
            } else {
                //imprimir el último valor sin comas
                System.out.print(par + ", 200.\n");
            }
        }
    
        System.out.println("============================================\n" +
                "b) En 10 líneas de 10 números pares:");
        //Impresión en grupos de 10 números
        for (int i = 1; i < pares.length; i++) {
            // Ternaria para imprimir los números
            System.out.print(pares[i] == 0 ? "" : pares[i] == 198 ? pares[i] + ", 200.\n" : pares[i] + ", ");
    
            // Ternaria para el salto de línea
            System.out.print(i % 10 == 0 ? "\n" : "");
        }
    }
}
