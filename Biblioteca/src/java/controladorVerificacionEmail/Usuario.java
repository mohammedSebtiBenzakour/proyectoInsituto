/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladorVerificacionEmail;

/**
 *
 * @author daw2
 */
public class Usuario {
    
    private String nombre;
    private String email;
    private String codigoVerificacion;

    public Usuario() {
    }

    public Usuario(String nombre, String email, String codigoVerificacion) {
        this.nombre = nombre;
        this.email = email;
        this.codigoVerificacion = codigoVerificacion;
    }

    public String getCodigoVerificacion() {
        return codigoVerificacion;
    }

    public void setCodigoVerificacion(String codigoVerificacion) {
        this.codigoVerificacion = codigoVerificacion;
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
