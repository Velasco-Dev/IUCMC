package Data;

import java.util.ArrayList;
import java.util.List;

import Persona.Usuario;
import Producto.Producto;
import Venta.Venta;

public class DataManager {
    // Arreglos globales
    private static final List<Usuario> usuarios = new ArrayList<>();
    private static final List<Producto> inventario = new ArrayList<>();
    private static final List<Venta> ventas = new ArrayList<>();

    // Métodos estáticos para acceder a los arreglos
    public static List<Usuario> getUsuarios() {
        return usuarios;
    }

    public static List<Producto> getInventario() {
        return inventario;
    }

    public static List<Venta> getVentas() {
        return ventas;
    }

    // Métodos para agregar elementos
    public static void agregarUsuario(Usuario usuario) {
        usuarios.add(usuario);
    }

    public static void agregarProducto(Producto producto) {
        inventario.add(producto);
    }

    public static void agregarVenta(Venta venta) {
        ventas.add(venta);
    }
}
