package ListaDoblementeEnlazada;

public class MetodoListaDoble {

    private Nodo cabecera;

    public MetodoListaDoble() {
        this.cabecera = null;
    }

    // identificar si la lista tiene elementos
    public boolean esVacia() {
        return this.cabecera == null;
    }

    // funcion que permite ir hacia adelante
    public void avanzar() {
        if (!esVacia()) {
            while (this.cabecera.getSiguiente() != null) {
                this.cabecera = this.cabecera.getSiguiente();
            }
        }
    }

    // funcion que permite ir hacia atrás
    public void retroceder() {
        if (!esVacia()) {
            while (this.cabecera.getAnterior() != null) {
                this.cabecera = this.cabecera.getAnterior();
            }
        }
    }

    // Función de inserción inicio
    public void insertarPrincipio(int valor) {

        Nodo nuevo = new Nodo();
        nuevo.setValor(valor);

        if (esVacia()) {

            this.cabecera = nuevo;

        } else {

            retroceder();
            nuevo.setSiguiente(this.cabecera);

            this.cabecera.setAnterior(nuevo);
            this.cabecera = nuevo;
        }
    }

    // Función de inserción fnal
    public void insertarFinal(int valor) {

        Nodo nuevo = new Nodo();
        nuevo.setValor(valor);

        if (esVacia()) {

            this.cabecera = nuevo;

        } else {

            avanzar();
            nuevo.setAnterior(this.cabecera);

            this.cabecera.setSiguiente(nuevo);
            this.cabecera = nuevo;
        }
    }

    public void mostrarDesdeInicio() {

        if (esVacia()) {

            System.out.println("La lista está vacía");

        } else {

            retroceder();
            Nodo aux = this.cabecera;

            while (aux != null) {
                System.out.println("\t | "+aux.getValor() + " | \t");
                aux = aux.getSiguiente();
            }
        }
    }
    public void mostrarDesdeFinal() {

        if (esVacia()) {

            System.out.println("La lista está vacía");

        } else {

            avanzar();
            Nodo aux = this.cabecera;

            while (aux != null) {
                System.out.println("\t | "+aux.getValor() + " | \t");
                aux = aux.getAnterior();
            }
        }
    }

}
