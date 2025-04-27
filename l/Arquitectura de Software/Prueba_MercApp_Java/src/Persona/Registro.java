package Persona;

import Data.DataManager;
import java.util.Scanner;

public class Registro {

    public static void registrarUsuario() {

        String user;
        String pass;
        String rol;

        try (Scanner scanner = new Scanner(System.in)) {
            System.out.println("=================== REGISTRO DE USUARIO =================");
            System.out.println("Por favor, complete los siguientes datos para registrarse.");
            System.out.print("Usuario: ");
            user = scanner.nextLine();
            System.out.print("Contraseña: ");
            pass = scanner.nextLine();
            System.out.print("Rol (Microempresario/Vendedor): ");
            rol = scanner.nextLine();
            
            Usuario usuario = new Usuario(user, pass, rol);
    
            DataManager.agregarUsuario(usuario);
            System.out.println("Usuario registrado exitosamente!");
        }

    }

}
