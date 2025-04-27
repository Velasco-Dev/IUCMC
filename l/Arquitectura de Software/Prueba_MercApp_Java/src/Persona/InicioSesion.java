package Persona;

import Data.DataManager;
import Persona.Administrador.Administrador;
import Utils.Input;
import java.util.List;

public class InicioSesion {

    public static List<Usuario> usuarios = DataManager.getUsuarios();
    public static Usuario usuarioLogueado;

    public static void iniciarSesion() {
        System.out.print("""
                \n==================== INICIO DE SESION ===================
                Por favor, ingrese sus credenciales.
                =========================================================
                """);

        // System.out.print("Usuario: ");
        String usuarioIngresado = Input.getString("Usuario: ");

        // System.out.print("Contraseña: ");
        String contrasenaIngresada = Input.getString("Contraseña: ");

        for (Usuario u : usuarios) {
            if (u.getUsername().equals(usuarioIngresado)) {

                if (u.getPassword().equals(contrasenaIngresada)) {
                    System.out.print("\nBienvenido " + u.getUsername() + "!");
                    usuarioLogueado = u;
                    menuRol();
                    return;
                } else {
                    System.out.println("Contraseña incorrecta!");
                    return;
                }
            }
        }

        System.err.println("\nUsuario no encontrado!\n");
    }

    private static void menuRol() {
        switch (usuarioLogueado.getRol()) {
            case "Administrador" -> Administrador.menuAdministrador();
            case "Microempresario" -> Microempresario.menuMicroempresario();
            case "Vendedor" -> Vendedor.menuVendedor();

            default -> System.out.println("Rol no reconocido");
        }
    }

}
