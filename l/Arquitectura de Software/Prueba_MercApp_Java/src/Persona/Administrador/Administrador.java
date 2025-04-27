package Persona.Administrador;

import Data.DataManager;
import Inventario.Inventario;
import Persona.InicioSesion;
import Persona.Registro;
import Persona.Usuario;
import Utils.Input;

public class Administrador {
    static String respuesta = "s";

    public static void menuAdministrador() {
        while (true) {
            System.out.println("\n================ ADMINISTRADOR "+InicioSesion.usuarioLogueado.getUsername()+" =================");
            System.out.print("""
                    1. Ver usuarios
                    2. Registrar usuario
                    3. Buscar usuario
                    4. Eliminar usuario
                    5. Ver inventario
                    6. Registrar producto
                    7. Salir
                    =========================================================
                    """);

            int opcion = Input.getInt("Seleccione opción: ");

            switch (opcion) {
                case 1 -> verUsuarios();
                case 2 -> Registro.registrarUsuario();
                case 3 -> buscarUsuario();
                case 4 -> eliminarUsuario();
                case 5 -> verInventario();
                case 6 -> registrarProducto();
                case 7 -> {
                    return;
                }
                default -> System.out.println("Opción inválida");
            }
        }
    }

    private static void verUsuarios() {
        if (DataManager.getUsuarios().isEmpty()) {
            System.out.println("No hay usuarios registrados.");
        } else {
            System.out.println("\n================= USUARIOS REGISTRADOS ==================");
            for (Usuario u : DataManager.getUsuarios()) {
                System.out
                .println("ID: " + u.getIdUsuario() + " | Usuario: " + u.getUsername() + " | Rol: " + u.getRol());
            }
            System.out.println("=========================================================");
        }
    }

    private static void buscarUsuario() {

        int idBuscado = Input.getInt("Ingrese el ID del usuario a buscar: ");
        Input.scanner.nextLine();

        Usuario encontrado = null;
        for (Usuario u : DataManager.getUsuarios()) {
            if (u.getIdUsuario() == idBuscado) {
                encontrado = u;

            }
        }

        if (encontrado == null) {
            System.out.println("Usuario no encontrado.");
        } else {
            System.out.println("Usuario encontrado:");
            System.out.println("ID: " + encontrado.getIdUsuario() + " Usuario: " + encontrado.getUsername() + " | Rol: "
                    + encontrado.getRol());

            System.out.print("¿Desea editar los datos del usuario? (S/N): ");
            respuesta = Input.scanner.nextLine();

            if (respuesta.equalsIgnoreCase("S")) {
                System.out.print("Nuevo nombre de usuario: ");
                String nuevoUsername = Input.scanner.nextLine();

                System.out.print("Nuevo rol (Microempresario (M)/Vendedor (V)): ");
                String nuevoRol = Input.scanner.nextLine().toUpperCase();

                encontrado.setUsername(nuevoUsername);
                encontrado.setRol(nuevoRol);

                System.out.println("Usuario actualizado con éxito!");
            }
        }

    }

    private static void eliminarUsuario() {

        int idEliminar = Input.getInt("Ingrese el ID del usuario a eliminar: ");
        Input.scanner.nextLine(); // Limpiar el buffer

        Usuario encontrado = null;
        for (Usuario u : DataManager.getUsuarios()) {
            if (u.getIdUsuario() == idEliminar) {
                encontrado = u;
                break;
            }
        }

        if (encontrado == null) {
            System.out.println("Usuario no encontrado.");
        } else {
            DataManager.getUsuarios().remove(encontrado);
            System.out.println("Usuario eliminado con éxito!");
        }
    }

    private static void verInventario() {
        if (DataManager.getInventario().isEmpty()) {
            System.out.println("No hay productos en el inventario.");
        } else {
            Inventario.mostrarInventario();
        }
    }

    private static void registrarProducto() {
        System.out.println("Funcionalidad de registrar producto aún no implementada aquí.");
        // Puedes llamar aquí al método que ya tengas para registrar productos.
    }
}
