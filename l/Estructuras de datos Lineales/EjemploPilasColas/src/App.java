
import Cola.MetodoCola;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Método Cola");

        MetodoCola cola = new MetodoCola(null, null);

        cola.enColar(5);
        cola.enColar(7);
        cola.enColar(10);
        cola.enColar(48);

        cola.desenColar();
        // cola.desenColar();

        cola.enColar(45);

        cola.mostrarCola();

        System.out.println(cola.buscarCola(10) ? "Se encuentra en número" : "No se encuentra el número");
    }
}
