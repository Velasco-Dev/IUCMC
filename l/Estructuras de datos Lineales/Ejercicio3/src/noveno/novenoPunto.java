package noveno;

import java.util.ArrayList;
import java.util.Collections;

public class novenoPunto {

    public static void arrayListObjetos() {
        // Se define el arrayList
        ArrayList<Integer> numeros = new ArrayList<>();

        // a) Adicionar 6 datos (10,20,30,40,50,60)
        Collections.addAll(numeros, 10, 20, 30, 40, 50, 60);
        // e imprimir la lista.
        System.out.println("a) Adicionar 6 datos (10,20,30,40,50,60) e imprimir la lista." + numeros);

        // b) Adicione 2 valores: en la posición 1 (1000) y en la posición 3 (2000) e
        // imprima de nuevo.
        numeros.add(1, 1000);
        numeros.add(3, 2000);

        System.out
                .println("b) Adicione 2 valores: en la posición 1 (1000) y en la posición 3 (2000) e imprima de nuevo: "
                        + numeros);

        // c) Reemplace 2 valores usando set en la posición 0 (5000) y en la posición
        // 2(10000) e imprima.
        numeros.set(0, 5000);
        numeros.set(2, 10000);

        System.out.println(
                "c) Reemplace 2 valores usando set en la posición 0 (5000) y en la posición 2(10000) e imprima de nuevo: "
                        + numeros);

        // d) Imprima la posición (índice) de la primera ocurrencia del valor 2000.
        System.out.println(
                "d) Imprima la posición (índice) de la primera ocurrencia del valor 2000: " + numeros.indexOf(2000));

        // e) Imprima la posición (índice) de la última ocurrencia del valor 2000.
        System.out.println(
                "e) Imprima la posición (índice) de la última ocurrencia del valor 2000: " + numeros.lastIndexOf(2000));
        // f) Adicione 2000 en la última posición.
        numeros.add(2000);
        // g) Repita las impresiones de los puntos d) y e) y observe que
        // posiciones(índices) muestra ahora.
        System.out.println(
                "g) Repita las impresiones de los puntos d) y e) y observe que posiciones(índices) muestra ahora:");
        System.out.println(
                "d) Imprima la posición (índice) de la primera ocurrencia del valor 2000: " + numeros.indexOf(2000));
        System.out.println(
                "e) Imprima la posición (índice) de la última ocurrencia del valor 2000: " + numeros.lastIndexOf(2000));

        // h) Averiguar si el valor (Objeto) 40 está en el ArrayList y en qué posición(si esta).
        if (!numeros.contains(40)) {
            System.out.println("El 40 no se encuentra en el ArrayList.");
        } else {
            System.out.println("h) Averiguar si el valor (Objeto) 40 está en el ArrayList y en qué posición(si esta): "
                    + numeros.indexOf(40));
        }

        // i) Elimine el valor que se encuentre en la posición 5 del ArrayList e imprima
        // para verificar que se eliminó.
        System.out.println(numeros.remove(5));
        System.out.println(
                "i) Elimine el valor que se encuentre en la posición 5 del ArrayList e imprima para verificar que se eliminó: "
                        + numeros);

        // j) Averiguar si la lista esta vacía y si no, cuantos elementos tiene.
        if (!numeros.isEmpty()) {
            System.out
                    .println("j) Averiguar si la lista esta vacía y si no, cuantos elementos tiene: " + numeros.size());
        }

        // k) Crear un segundo ArrayList (nómbrelo =&gt;(b)) con 3 objetos enteros
        // 111,222 y 333 e imprímalo.
        ArrayList<Integer> b = new ArrayList<>();
        Collections.addAll(b, 111, 222, 333);
        System.out.println(
                "k) Crear un segundo ArrayList (nómbrelo =&gt;(b)) con 3 objetos enteros 111,222 y 333 e imprímalo: "
                        + b);

        // l) Crear un tercer ArrayList (nómbrelo =&gt;(c)) con 2 objetos enteros 77777
        // y 88888 e imprímalo.
        ArrayList<Integer> c = new ArrayList<>();
        Collections.addAll(c, 77777, 88888);
        System.out.println(
                "l) Crear un tercer ArrayList (nómbrelo =&gt;(c)) con 2 objetos enteros 77777 y 88888 e imprímalo: "
                        + c);

        // m) Agregar a la lista llamada (b) los elementos de las listas (a) y (c) e
        // imprima la lista (b).
        b.addAll(numeros);
        b.addAll(c);
        System.out.println(
                "m) Agregar a la lista llamada (b) los elementos de las listas (a) y (c) e imprima la lista (b): " + b);

        // n) Adicionar un nuevo valor (99999) a la lista (a) e imprímala.
        numeros.add(99999);
        System.out.println("n) Adicionar un nuevo valor (99999) a la lista (a) e imprímala: " + numeros);

        // o) Borre de la lista (b) UNICAMENTE los elementos de la lista (a) e imprima
        // la lista (b). Se puede hacer? Revise como quedo la lista (a).
        b.removeAll(numeros);
        System.out.println("o) Borre de la lista (b) UNICAMENTE los elementos de la lista (a) e imprima la lista (b)." +
                " Se puede hacer?: " + b);
        System.out.println("o.1) Revise como quedo la lista (a): "+numeros);

        //p) Borre TODOS los elementos de la lista (a) y verifique que quedo vacía.
        numeros.clear();
        System.out.println("p) Borre TODOS los elementos de la lista (a) y verifique que quedo vacía: "+numeros);
    }

}
