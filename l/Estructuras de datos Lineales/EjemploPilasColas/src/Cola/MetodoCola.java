package Cola;

public class MetodoCola {

    private Nodo frente, fin;

    public MetodoCola(Nodo frente, Nodo fin) {
        this.frente = frente;
        this.fin = fin;
    }

    public boolean esVacia() {
        return frente == null;
    }

    public void enColar(int valor) {
        Nodo nuevo = new Nodo();

        nuevo.setValor(valor);
        
        if (frente == null) {
            frente = nuevo;
            fin = nuevo;
        } else {
            fin.setSiguiente(nuevo);
            fin = nuevo;
        }
    }

    public int desenColar(){

        if(!esVacia()){
            int dato = frente.getValor();

            if(frente == fin){
                frente = null;
                fin = null;
            }else{
                frente = frente.getSiguiente();
            }

            return dato;
        }else{
            return Integer.MAX_VALUE;
        }
    }

    public void mostrarCola(){
        Nodo aux = frente;

        while (aux != null) {
            System.out.println("\t | "+aux.getValor()+" | \t");
            aux = aux.getSiguiente();
        }
    }

    public boolean buscarCola(int valorBuscar){
        Nodo aux = frente;
        boolean existente = false;

        while (existente != true && aux != null) {
            if (valorBuscar == aux.getValor()) {
                existente = true;
            }else{
                aux.getSiguiente();
            }
        }

        return false;
    }

}
