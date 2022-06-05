/*
Clase dao para manipular los libros
 */
package controladorEditarLibro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author daw2
 */
public class LibrosDao {

    Connection con;

    public LibrosDao(Connection con) {
        this.con = con;
    }

    public LibrosDao() {
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public boolean añadirLibro(Libros libro) {
        boolean test = false;

        String sql = "insert into libros (nombreLibro, descripcionLibro , autorLibro, categoriaLibro) values ( ?,?,?,?)";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, libro.getNombreLibro());
            ps.setString(2, libro.getDescripcionLibro());
            ps.setString(3, libro.getAutorLibro());
            ps.setString(4, libro.getCategoriaLibro().getCategoriaLibro());

            ps.executeUpdate();

            test = true;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return test;
    }

    public boolean aniadirCategoria(Categoria categoria) {
        boolean test = false;

        String sql = "insert into categoria_libro (categoria, creado_el) values ( ?,?)";
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Timestamp tm = Timestamp.valueOf(timeStamp);
        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
           
            ps.setString(1, categoria.getCategoriaLibro());
            ps.setTimestamp(2, tm);

            ps.executeUpdate();

            test = true;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return test;
    }

    public List<Libros> getLibros() {

        List<Libros> libros = new LinkedList<>();

        String sql = "select * from libros";
        try {

            PreparedStatement ps = this.con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombreLibro = rs.getString("nombreLibro");
                String descripcionLibro = rs.getString("descripcionLibro");
                String autorLibro = rs.getString("autorLibro");
                String categoriaLibro = rs.getString("categoriaLibro");
                Categoria cat = new Categoria();
                cat.setCategoriaLibro(categoriaLibro);
                Libros libro = new Libros(id, nombreLibro, descripcionLibro, autorLibro, cat);
                libros.add(libro);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return libros;
    }

    public List<Categoria> getCategoriaLibros() {

        List<Categoria> categorias = new LinkedList<>();

        String sql = "select * from categoria_libro";
        try {

            PreparedStatement ps = this.con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String categoriaLibro = rs.getString("categoria");
                Categoria categoria = new Categoria(categoriaLibro);

                categorias.add(categoria);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return categorias;
    }

    public boolean modificarLibro(Libros libro) {

        boolean test = false;
        String sql = "update libros set nombreLibro = ? , descripcionLibro = ? , autorLibro = ? , categoriaLibro = ? where id = ?";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, libro.getNombreLibro());
            ps.setString(2, libro.getDescripcionLibro());
            ps.setString(3, libro.getAutorLibro());
           
            ps.setString(4, libro.getCategoriaLibro().getCategoriaLibro());
            ps.setInt(5, libro.getId());

            ps.executeUpdate();
            test = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return test;
    }
    
    public void modificarLibro2(Libros libro) {

        boolean test = false;
        String sql = "update libros set nombreLibro = ? , descripcionLibro = ? , autorLibro = ? , categoriaLibro = ? where id = ?";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setString(1, libro.getNombreLibro());
            ps.setString(2, libro.getDescripcionLibro());
            ps.setString(3, libro.getAutorLibro());
           
            ps.setString(4, libro.getCategoriaLibro().getCategoriaLibro());
            ps.setInt(5, libro.getId());

            ps.execute();
            test = true;
           
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
       
    }

    public Libros getLibro(int id) {

        Libros libro = null;

        String sql = "select * from libros where id = ? ";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int idLibro = rs.getInt("id");
                String nombreLibro = rs.getString("nombreLibro");
                String descripcionLibro = rs.getString("descripcionLibro");
                String autorLibro = rs.getString("autorLibro");
                String categoriaLibro = rs.getString("categoriaLibro");

                Categoria cat = new Categoria();
                cat.setCategoriaLibro(categoriaLibro);

                libro = new Libros(id, nombreLibro, descripcionLibro, autorLibro, cat);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return libro;

    }

    public void eliminarLibro(int id) {

        String sql = "delete from libros where id = ? ";

        try {
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public List<Libros> getLibros(String buscar) {

        List<Libros> libros = new LinkedList<>();

        String sql = "select * from libros where nombreLibro like '%" + buscar + "%' or descripcionLibro like '%" + buscar + "%'"
                + " or autorLibro like '%" + buscar + "%'";
        //    String sql = "select * from libros where nombreLibro like '%" + "sebt" + "%'";
        try {

            PreparedStatement ps = this.con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombreLibro = rs.getString("nombreLibro");
                String descripcionLibro = rs.getString("descripcionLibro");
                String autorLibro = rs.getString("autorLibro");
                String categoriaLibro = rs.getString("categoriaLibro");

                Categoria cat = new Categoria();
                cat.setCategoriaLibro(categoriaLibro);

                Libros libro = new Libros(id, nombreLibro, descripcionLibro, autorLibro, cat);
                libros.add(libro);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return libros;
    }

    public static void main(String[] args) {
        LibrosDao ld = new LibrosDao();

        List<Libros> listA = ld.getLibros();

        System.out.println(listA.toString());
    }

}
