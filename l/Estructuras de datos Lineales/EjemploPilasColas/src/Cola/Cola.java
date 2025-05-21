package Cola;

public class Cola {

    public static void main(String[] args) throws Exception {
        System.out.println("Método Cola");

        MetodoCola cola = new MetodoCola(null, null);

        cola.enColar(5);
        cola.enColar(7);
        cola.enColar(1);
        cola.enColar(4);

        cola.desenColar();
        // cola.desenColar();

        cola.enColar(1);

        cola.mostrarCola();

        System.out.println(cola.buscarCola(5) ? "Se encuentra en número" : "No se encuentra el número");
    }
    
}
