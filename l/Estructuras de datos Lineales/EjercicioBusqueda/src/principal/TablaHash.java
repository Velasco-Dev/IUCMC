package principal;

import java.util.LinkedList;

public class TablaHash {

    public LinkedList<Entry>[] tabla;
    public int capacidad;

    @SuppressWarnings("unchecked")
    public TablaHash(int capacidad) {
        this.capacidad = capacidad;
        tabla = new LinkedList[capacidad];
        for (int i = 0; i < capacidad; i++) {
            tabla[i] = new LinkedList<>();
        }
    }

    private int funcionHash(int clave) {
        return clave % capacidad;
    }

    public void insertar(int clave, String valor) {
        int indice = funcionHash(clave);
        LinkedList<Entry> lista = tabla[indice];
        for (Entry entry : lista) {
            if (entry.clave == clave) {
                entry.valor = valor; // Actualizar valor si clave existe
                return;
            }
        }
        lista.add(new Entry(clave, valor));
    }

    public String buscar(int clave) {
        int indice = funcionHash(clave);
        LinkedList<Entry> lista = tabla[indice];
        for (Entry entry : lista) {
            if (entry.clave == clave) {
                return entry.valor;
            }
        }
        return null; // No encontrado
    }

    public void eliminar(int clave) {
        int indice = funcionHash(clave);
        LinkedList<Entry> lista = tabla[indice];
        lista.removeIf(entry -> entry.clave == clave);
    }

    private static class Entry {
        int clave;
        String valor;

        Entry(int clave, String valor) {
            this.clave = clave;
            this.valor = valor;
        }
    }

    public static void principalHash(String[] args) {
        TablaHash tablaHash = new TablaHash(10);

        tablaHash.insertar(1, "Manzana");
        tablaHash.insertar(2, "Banana");
        tablaHash.insertar(12, "Naranja"); // Colisión con clave 2

        System.out.println("Buscar clave 1: " + tablaHash.buscar(1));
        System.out.println("Buscar clave 2: " + tablaHash.buscar(2));
        System.out.println("Buscar clave 12: " + tablaHash.buscar(12));

        tablaHash.eliminar(2);
        System.out.println("Buscar clave 2 después de eliminar: " + tablaHash.buscar(2));
    }
}
