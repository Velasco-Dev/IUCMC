package Persona;

import Producto.Producto;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Microempresario {

    public static List<Producto> inventario = new ArrayList<>();
    public static Scanner scanner = new Scanner(System.in);

    public static void menuMicroempresario() {
        while (true) {
            System.out.println("""
                    === MICROEMPRESARIO ===
                    1. Agregar producto
                    2. Actualizar stock
                    3. Ver inventario
                    4. Salir
                    """);
            System.out.print("Seleccione opción: ");

            int opcion = scanner.nextInt();
            scanner.nextLine();

            switch (opcion) {
                case 1 -> agregarProducto();
                case 2 -> actualizarStock();
                case 3 -> mostrarInventario();
                case 4 -> {
                    return;
                }
                default -> System.out.println("Opción inválida");
            }
        }
    }

    private static void agregarProducto() {
        System.out.print("ID Producto: ");
        String id = scanner.nextLine();
        System.out.print("Nombre: ");
        String nombre = scanner.nextLine();
        System.out.print("Cantidad inicial: ");
        int cantidad = scanner.nextInt();
        System.out.print("Precio: ");
        double precio = scanner.nextDouble();
        scanner.nextLine();

        inventario.add(new Producto(id, nombre, cantidad, precio));
        System.out.println("Producto agregado!");
    }

    private static void actualizarStock() {
        mostrarInventario();
        System.out.print("ID Producto a actualizar: ");
        String id = scanner.nextLine();

        for (Producto p : inventario) {
            if (p.getId().equals(id)) {
                System.out.print("Nueva cantidad: ");
                p.setCantidad(scanner.nextInt());
                scanner.nextLine();
                System.out.println("Stock actualizado!");
                return;
            }
        }
        System.out.println("Producto no encontrado!");
    }

    public static void mostrarInventario() {
        System.out.println("\n=== INVENTARIO ===");
        for (Producto p : inventario) {
            System.out.println(p);
        }
    }

}
