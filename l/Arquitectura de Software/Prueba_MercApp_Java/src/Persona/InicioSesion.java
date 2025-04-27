package Persona;

import Data.DataManager;
import java.util.List;
import java.util.Scanner;

public class InicioSesion {

    public static List<Usuario> usuarios = DataManager.getUsuarios();
    public static Usuario usuarioLogueado;

    public static void iniciarSesion() {

        try (Scanner scanner = new Scanner(System.in)) {

            System.out.println("""
                \n=================== INICIO DE SESIÓN =================
                Por favor, ingrese sus credenciales.
                ======================================================""");
            System.out.print("Usuario: ");
            String usuario = scanner.nextLine();
            System.out.print("Contraseña: ");
            String contrasena = scanner.nextLine();
            
            for(Usuario u : usuarios) {
                if(u.getUsername().equals(usuario) && u.getPassword().equals(contrasena)) {
                    usuarioLogueado = u;
                    menuRol();
                    return;
                }
            }
            System.out.println("Credenciales incorrectas!");
        }
    }

    private static void menuRol() {
        switch(usuarioLogueado.getRol()) {
            case "Microempresario" -> Microempresario.menuMicroempresario();
            case "Vendedor" -> Vendedor.menuVendedor();
            default -> System.out.println("Rol no reconocido");
        }
    }
    
}
