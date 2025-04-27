package Inventario;

import Data.DataManager;
import Producto.Producto;
import java.util.List;

public class Inventario {

    static List<Producto> inventario = DataManager.getInventario();

    /**
     * Esta clase representa el inventario de productos en el sistema.
     * Contiene métodos para agregar, eliminar y mostrar productos.
     */
    public static void mostrarInventario() {
        System.out.print("""
                \n======================= INVENTARIO ======================
                \tID   |   Nombre   |   Stock   |   Precio
                =========================================================
                """);
        if (inventario.isEmpty()) {
            System.out.println("No hay productos en el inventario.");
            return;
        }
        
        // Solo mostrar productos con cantidad mayor a 0
        for (Producto p : inventario) {
            if (p.getCantidad() > 0) { // Verificar que el stock sea mayor a 0
                System.out.println("ID: " + p.getId() +
                        " | Nombre: " + p.getNombre() +
                        " | Cantidad: " + p.getCantidad() +
                        " | Precio: $" + p.getPrecio());
            }
        }
        System.out.print("=========================================================\n");
    }

}
