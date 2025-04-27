package Persona;

public class Usuario {
    private final String username;
    private final String password;
    private final String rol;
    
    public Usuario(String username, String password, String rol) {
        this.username = username;
        this.password = password;
        this.rol = rol;
    }

    // Getters
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getRol() { return rol; }
}
