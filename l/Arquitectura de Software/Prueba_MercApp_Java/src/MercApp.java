import Data.InicializarDatos;
import Persona.InicioSesion;
import Persona.Registro;
import Utils.Input;

public class MercApp {

    public static void main(String[] args) {

        // Datos estáticos iniciales
        InicializarDatos inicializarDatos = new InicializarDatos();
        inicializarDatos.inicializarDatos();

        while (true) {
            System.out.print("""
                    \n========================= MERCAPP =======================
                    Bienvenido a MercApp, tu aplicación de gestión de ventas.
                    ====================== MENÚ PRINCIPAL ===================
                    1. Iniciar sesión
                    2. Registrarse
                    3. Salir
                    =========================================================
                        """);

            int opcion = Input.getInt("Seleccione opción: ");

            switch (opcion) {
                case 1:
                    InicioSesion.iniciarSesion();
                    break;
                case 2:
                    Registro.registrarUsuario();
                    break;
                case 3:
                    System.out.println("""
                            \nSaliendo de la aplicación...
                            Gracias por usar MercApp. ¡Hasta luego!
                            """);
                    System.exit(0);
                default:
                    System.out.println("Opción invalida");
            }
        }

    }
}
