package Venta;

import Producto.Producto;
import java.util.ArrayList;
import java.util.List;

public class Venta {
    private final List<Producto> productosVenta = new ArrayList<>();
    private final List<Integer> cantidades = new ArrayList<>();
    private final CalculoTotalStrategy estrategia;

    public Venta(CalculoTotalStrategy estrategia) {
        this.estrategia = estrategia;
    }

    public void agregarProducto(Producto p, int cantidad) {
        productosVenta.add(p);
        cantidades.add(cantidad);
    }

    public double calcularTotal() {
        double subtotal = 0;
        for (int i = 0; i < productosVenta.size(); i++) {
            subtotal += productosVenta.get(i).getPrecio() * cantidades.get(i);
        }
        return estrategia.calcularTotal(subtotal);
    }

    @Override
    public String toString() {
        StringBuilder detallesVenta = new StringBuilder();
        detallesVenta.append("================== Detalles de la Venta =================\n");
        for (int i = 0; i < productosVenta.size(); i++) {
            Producto producto = productosVenta.get(i);
            int cantidad = cantidades.get(i);

            detallesVenta.append("---------------------------------------------------------\n");
            detallesVenta.append(String.format("Producto: %s | Cantidad: %d | Precio unitario: $%.2f\n",
                    producto.getNombre(), cantidad, producto.getPrecio()));
        }
        detallesVenta.append("---------------------------------------------------------\n");
        detallesVenta.append("Total: $").append(calcularTotal()).append(" |\n");
        detallesVenta.append("------------------\n");
        return detallesVenta.toString();
    }
}
