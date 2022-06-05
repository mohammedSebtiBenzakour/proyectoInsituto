/*
Clase usuario
 */
package controlador;

/**
 *
 * @author daw2
 */
public class Usuario {
    private int id;
    private String nombre;
    private String email;
    private String password;
    private String usuario;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public Usuario(int id, String nombre, String email, String password, String usuario) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.password = password;
        this.usuario = usuario;
    }

    public Usuario() {
    }

    public Usuario(int id, String nombre, String email, String password) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public Usuario(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Usuario(String nombre, String email, String password) {
        this.nombre = nombre;
        this.email = email;
        this.password = password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
