package Persona;

import Data.DataManager;
import Producto.Producto;
import Venta.CalculoConIVA;
import Venta.Venta;
import java.util.List;
import java.util.Scanner;
/**
 * Esta clase representa al vendedor en el sistema.
 * Permite realizar ventas y ver el historial de ventas.
 */

public class Vendedor {

    static Scanner scanner = new Scanner(System.in);

    public static void menuVendedor() {
        while (true) {
            System.out.println("""
                    === VENDEDOR ===
                    1. Nueva venta
                    2. Ver ventas
                    3. Salir
                    """);
            System.out.print("Seleccione opción: ");

            int opcion = scanner.nextInt();
            scanner.nextLine();

            switch (opcion) {
                case 1 -> realizarVenta();
                case 2 -> mostrarVentas();
                case 3 -> {
                    return;
                }
                default -> System.out.println("Opción inválida");
            }
        }
    }

    public static void realizarVenta() {
        Venta venta = new Venta(new CalculoConIVA());
        String continuar;

        do {
            Microempresario.mostrarInventario();
            System.out.print("ID Producto a vender: ");
            String id = scanner.nextLine();

            List<Producto> inventario = DataManager.getInventario();
            for (Producto p : inventario) {
                if (p.getId().equals(id)) {
                    System.out.print("Cantidad: ");
                    int cantidad = scanner.nextInt();
                    scanner.nextLine();

                    if (p.getCantidad() >= cantidad) {
                        venta.agregarProducto(p, cantidad);
                        p.setCantidad(p.getCantidad() - cantidad);
                        System.out.println("Producto agregado a la venta!");
                    } else {
                        System.out.println("Stock insuficiente!");
                    }
                    break;
                }
            }

            System.out.print("¿Agregar otro producto? (s/n): ");
            continuar = scanner.nextLine();
        } while (continuar.equalsIgnoreCase("s"));

        DataManager.agregarVenta(venta);
        System.out.println("Venta registrada! Total: $" + venta.calcularTotal());
    }

    public static void mostrarVentas() {
        List<Venta> ventas = DataManager.getVentas();

        if (ventas.isEmpty()) {
            System.out.println("No hay ventas registradas.");
            return;
        }

        System.out.println("\n=== HISTORIAL DE VENTAS ===");
        for (Venta v : ventas) {
            System.out.println(v);
        }
    }

}
