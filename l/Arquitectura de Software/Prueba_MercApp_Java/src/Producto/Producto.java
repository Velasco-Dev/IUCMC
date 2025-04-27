package Producto;

public class Producto {
    /**
     * Esta clase representa un producto en el sistema.
     * Contiene información como ID, nombre, cantidad y precio.
     */
    private final String id;
    private final String nombre;
    private int cantidad;
    private final double precio;
    
    public Producto(String id, String nombre, int cantidad, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    // Getters y Setters
    public String getId() { return id; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
    public String getNombre() { return nombre; }
    public double getPrecio() { return precio; }
    
    @Override
    public String toString() {
        return String.format("%s - %s | Stock: %d | Precio: $%.2f", 
                id, nombre, cantidad, precio);
    }
}
