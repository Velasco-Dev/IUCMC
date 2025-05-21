package ListaDoblementeEnlazada;

public class ListaDobleEnlace {

    public static void main(String[] args) {
        MetodoListaDoble listaDoble = new MetodoListaDoble();

        System.out.println("Insertar Al Inicio");
        listaDoble.insertarPrincipio(5);
        listaDoble.insertarPrincipio(4);
        listaDoble.insertarPrincipio(3);
        listaDoble.insertarPrincipio(0);

        listaDoble.mostrarDesdeInicio();
        
        System.out.println("======================");
        System.out.println("Insertar Al Final");
        listaDoble.insertarFinal(5);
        listaDoble.insertarFinal(4);
        listaDoble.insertarFinal(3);
        listaDoble.insertarFinal(0);

        listaDoble.mostrarDesdeFinal();


    }

}
