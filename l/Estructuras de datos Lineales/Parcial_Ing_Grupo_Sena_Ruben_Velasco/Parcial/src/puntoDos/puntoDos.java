package puntoDos;

public class puntoDos {

    public static void primos(){
        //Arreglo de numeros primos
        int count = 0;
        int numero = 2;
        int[] numerosPrimos = new int[25];

        while (count < numerosPrimos.length) {
            boolean primo = true;
            for (int i = 2; i <= Math.sqrt(numero); i++) {
                if (numero % i == 0) {
                    primo = false;
                    break;
                }
            }
            if (primo) {
                numerosPrimos[count] = numero;
                count++;
            }
            numero++;
        }
        
        System.out.print("Los 25 primeros numeros primos son: ");

        //Se imprime el arreglo de números
        for (int i = 0; i < numerosPrimos.length; i++) {
            System.out.print(i == numerosPrimos.length - 1 ? numerosPrimos[i] + ".\n" : numerosPrimos[i] + ", ");
        }
    }
    
}
