package Data;
import Persona.Usuario;
import Producto.Producto;
import java.util.List;

public class InicializarDatos {

    public List<Usuario> usuarios = DataManager.getUsuarios();
    public List<Producto> inventario = DataManager.getInventario();

    public void inicializarDatos() {
        // Usuarios pre-registrados
        DataManager.agregarUsuario(new Usuario("admin1", "admin123", "Administrador"));
        DataManager.agregarUsuario(new Usuario("micro1", "micro123", "M"));
        DataManager.agregarUsuario(new Usuario("vend1", "vend123", "V"));

        // Productos iniciales
        DataManager.agregarProducto(new Producto("P001", "Papa", 10, 1500.0));
        DataManager.agregarProducto(new Producto("P002", "Yuca", 10, 2500.0));
    }

}
