package Venta;
import Data.DataManager;
import Producto.Producto;
import java.util.ArrayList;
import java.util.List;

public class Venta {
    /**
     * Esta clase representa una venta de productos.
     * Utiliza el patrón de diseño Strategy para calcular el total de la venta.
     * Se pueden agregar productos y cantidades a la venta.
     * El total se calcula utilizando la estrategia definida.
     */
    private final List<Producto> productos = DataManager.getInventario();
    private final List<Integer> cantidades = new ArrayList<>();
    private final CalculoTotalStrategy estrategia;
    
    public Venta(CalculoTotalStrategy estrategia) {
        this.estrategia = estrategia;
    }
    
    public void agregarProducto(Producto p, int cantidad) {
        productos.add(p);
        cantidades.add(cantidad);
    }
    
    public double calcularTotal() {
        double subtotal = 0;
        for(int i = 0; i < productos.size(); i++) {
            subtotal += productos.get(i).getPrecio() * cantidades.get(i);
        }
        return estrategia.calcularTotal(subtotal);
    }
    
    @Override
    public String toString() {
        return String.format("Venta - Total: $%.2f", calcularTotal());
    }
}
