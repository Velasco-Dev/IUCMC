package Persona;

public class Usuario {
    private String username;
    private final String password;
    private String rol;
    private int idUsuario;
    private static int contadorId = 1;

    // Constructor
    public Usuario(String username, String password, String rol) {
        this.idUsuario = idUsuario + contadorId++;
        this.username = username;
        this.password = password;
        this.rol = rol;
    }

    // Getters
    public String getUsername() {
        return username;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getPassword() {
        return password;
    }

    public String getRol() {
        CompararRol(rol);
        return rol;
    }

    // Setters
    public void setUsername(String username) {
        this.username = username;
    }

    public void setRol(String rol) {
        CompararRol(rol);

    }

    private void CompararRol(String rol) {
        if (rol.equals("V")) {
            this.rol = "Vendedor";
        } else if (rol.equals("M")) {
            this.rol = "Microempresario";
        } 
        
        // this.rol = rol;
    }
}
