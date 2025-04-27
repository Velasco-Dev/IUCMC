package Persona;

import Data.DataManager;
import Inventario.Inventario;
import Producto.Producto;
import Utils.Input;

public class Microempresario {

    public static void menuMicroempresario() {
        while (true) {
            System.out.println("\n================ MICROEMPRESARIO "+InicioSesion.usuarioLogueado.getUsername()+" =================");
            System.out.print("""
                    1. Agregar producto
                    2. Actualizar stock
                    3. Ver inventario
                    4. Salir
                    =========================================================
                    """);
            System.out.print("Seleccione opción: ");

            int opcion = Input.scanner.nextInt();
            Input.scanner.nextLine();

            switch (opcion) {
                case 1 -> agregarProducto();
                case 2 -> actualizarStock();
                case 3 -> Inventario.mostrarInventario();
                case 4 -> {
                    return;
                }
                default -> System.out.println("Opción inválida");
            }
        }
    }

    private static void agregarProducto() {
        System.out.print("ID Producto: ");
        String id = Input.scanner.nextLine();
        System.out.print("Nombre: ");
        String nombre = Input.scanner.nextLine();
        System.out.print("Cantidad inicial: ");
        int cantidad = Input.scanner.nextInt();
        System.out.print("Precio: ");
        double precio = Input.scanner.nextDouble();
        Input.scanner.nextLine();

        // Crear un nuevo producto y agregarlo al inventario de DataManager
        Producto producto = new Producto(id, nombre, cantidad, precio);
        DataManager.agregarProducto(producto); // Asegúrate de tener un método para agregar productos en DataManager

        System.out.println("Producto agregado!");
    }

    private static void actualizarStock() {
        Inventario.mostrarInventario();
        System.out.print("ID Producto a actualizar: ");
        String id = Input.scanner.nextLine();

        for (Producto p : DataManager.getInventario()) { // Cambiar para obtener productos desde DataManager
            if (p.getId().equals(id)) {
                System.out.print("Nueva cantidad: ");
                p.setCantidad(Input.scanner.nextInt());
                Input.scanner.nextLine();
                System.out.println("Stock actualizado!");
                return;
            }
        }
        System.out.println("Producto no encontrado!");
    }
}
