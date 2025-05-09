package puntoDos;

import utils.Input;

public class puntoDos {

    public static void dos() {

        int multiplicador = Input.getInt("Ingrese un numero: ");
        int multiplicando = Input.getInt("Ingrese otro numero: ");

        int resultado = multiplicacionRusa(multiplicador, multiplicando);
        System.out.println("\nResultado de " + multiplicador + " x " + multiplicando + " es: " + resultado + "\n");
    }

    // metodo recursivo que usa multiplicacion rusa
    public static int multiplicacionRusa(int multiplicador, int multiplicando) {

        if(multiplicador != 0){
            System.out.print("\n"+ multiplicador + " " + multiplicando);
        }
        
        if (multiplicador == 0) {
            return 0;
        }

        if (multiplicador % 2 == 0) {

            return multiplicacionRusa(multiplicador / 2, multiplicando * 2);
        } else {

            return multiplicando + multiplicacionRusa(multiplicador / 2, multiplicando * 2);
        }
    }

}
