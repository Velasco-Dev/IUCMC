package Persona.Administrador;

import Data.DataManager;
import Persona.Usuario;

public class ActalizarUsuarios {
    public static void actualizarUsuario(Usuario usuarioActualizado) {
        // Buscar el usuario en la lista por nombre (o cualquier otra propiedad única)
        for (int i = 0; i < DataManager.getUsuarios().size(); i++) {
            Usuario usuario = DataManager.getUsuarios().get(i);

            // Comparar el nombre (o cualquier otra propiedad única) del usuario con el que
            // quieres actualizar
            if (usuario.getUsername().equals(usuarioActualizado.getUsername())) {
                // Actualizar la información del usuario
                DataManager.getUsuarios().set(i, usuarioActualizado);
                return;
            }
        }
        System.out.println("Usuario no encontrado");
    }
}
