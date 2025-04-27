import Persona.InicioSesion;
import Persona.Registro;
import java.util.Scanner;

public class MercApp {

    public static void main(String[] args) {

        try (Scanner scanner = new Scanner(System.in)) {
            // Datos estáticos iniciales
            InicializarDatos inicializarDatos = new InicializarDatos();
            inicializarDatos.inicializarDatos();

            while (true) {
                System.out.println("""
                        ========================= MERCAPP =======================
                        Bienvenido a MercApp, tu aplicación de gestión de ventas.
                        ====================== MENÚ PRINCIPAL ===================
                        1. Iniciar sesión
                        2. Registrarse
                        3. Salir """);

                System.out.print("Seleccione opción: ");

                int opcion = scanner.nextInt();

                switch (opcion) {
                    case 1:
                        InicioSesion.iniciarSesion();
                        break;
                    case 2:
                        Registro.registrarUsuario();
                        break;
                    case 3:
                        System.exit(0);
                    default:
                        System.out.println("Opción inválida");
                }
            }
        }
    }
}
