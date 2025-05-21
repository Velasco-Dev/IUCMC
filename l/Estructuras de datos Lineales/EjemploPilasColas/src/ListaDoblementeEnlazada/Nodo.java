package ListaDoblementeEnlazada;

public class Nodo {

    private int valor;
    private Nodo siguiente;
    private Nodo anterior;

    public Nodo(){
        this.valor = 0;
        this.siguiente = null;
        this.anterior = null;
    }

    public int getValor() {
        return valor;
    }
    public void setValor(int valor) {
        this.valor = valor;
    }
    public Nodo getSiguiente() {
        return siguiente;
    }
    public void setSiguiente(Nodo siguiente) {
        this.siguiente = siguiente;
    }
    public Nodo getAnterior() {
        return anterior;
    }
    public void setAnterior(Nodo anterior) {
        this.anterior = anterior;
    }

}
