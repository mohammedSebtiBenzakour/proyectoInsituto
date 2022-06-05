/*
Clase con metodos de acceso a la base de datos usuarios
 */
package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author daw2
 */
public class UsarBaseDatos {

    Connection con;

    public UsarBaseDatos(Connection con) {
        this.con = con;
    }

    //for register user 
    public boolean registrarUsuario(Usuario u) {
        boolean set = false;
        try {
            //Insert register data to database
            String sql = "insert into usuarios (nombre,email,password) values(?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(sql);
            pt.setString(1, u.getNombre());
            pt.setString(2, u.getEmail());
            pt.setString(3, u.getPassword());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    public Usuario login(String email, String password) {
        Usuario u = null;

        String sql = "select * from usuarios where email = ? and password = ?";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            
            //si usuario existe
            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
        public Usuario login_registrar_usuarios(String email, String clave) {
        Usuario u = null;

        String sql = "select * from registrar_usuarios where email = ? and clave = ?";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();
            
            //si usuario existe
            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("dni"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("clave"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
         public Usuario login_registrar_usuarios_con_usuario(String usuario, String clave) {
        Usuario u = null;

        String sql = "select * from registrar_usuarios where usuario = ? and clave = ?";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();
            
            //si usuario existe
            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("dni"));
                u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("clave"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }
    
        public String buscarEmail(String email) {
        Usuario u = null;
        
        String sql = "select email from usuarios where email = ? ";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, email);
           

            ResultSet rs = ps.executeQuery();
            
            //si usuario existe
            if (rs.next()) {
                u = new Usuario();
                u.setEmail(rs.getString("email"));
               
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u.getEmail();
    }
        
        public static void main(String[] args) throws SQLException {
            Connection con = Conexion.conectarBD();
            
        UsarBaseDatos us = new UsarBaseDatos(con);
        
       String a = us.buscarEmail("msebti2@gmail.com");
        
            System.out.println(a);
        
    }

}
