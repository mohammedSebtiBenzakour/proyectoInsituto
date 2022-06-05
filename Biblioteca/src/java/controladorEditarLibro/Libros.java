/*
Clase libros
 */
package controladorEditarLibro;

/**
 *
 * @author daw2
 */
public class Libros {
    private int id;
    private String nombreLibro;
    private String descripcionLibro;
    private String autorLibro;
   
    private Categoria categoriaLibro;

    public Libros() {
    }

    public Libros(int id, String nombreLibro, String descrpcionLibro, String autorLibro, Categoria categoriaLibro) {
        this.id = id;
        this.nombreLibro = nombreLibro;
        this.descripcionLibro = descrpcionLibro;
        this.autorLibro = autorLibro;
        this.categoriaLibro = categoriaLibro;
    }

    public Libros(String nombreLibro, String descrpcionLibro, String autorLibro, Categoria categoriaLibro) {
        this.nombreLibro = nombreLibro;
        this.descripcionLibro = descrpcionLibro;
        this.autorLibro = autorLibro;
        this.categoriaLibro = categoriaLibro;
    }

    public Categoria getCategoriaLibro() {
        return categoriaLibro;
    }

    public void setCategoriaLibro(Categoria categoriaLibro) {
        this.categoriaLibro = categoriaLibro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreLibro() {
        return nombreLibro;
    }

    public void setNombreLibro(String nombreLibro) {
        this.nombreLibro = nombreLibro;
    }

    public String getDescripcionLibro() {
        return descripcionLibro;
    }

    public void setDescripcionLibro(String descripcionLibro) {
        this.descripcionLibro = descripcionLibro;
    }

    public String getAutorLibro() {
        return autorLibro;
    }

    public void setAutorLibro(String autorLibro) {
        this.autorLibro = autorLibro;
    }

    @Override
    public String toString() {
        return "Libros{" + "id=" + id + ", nombreLibro=" + nombreLibro + ", descrpcionLibro=" + descripcionLibro + ", autorLibro=" + autorLibro + ", categoriaLibro=" + categoriaLibro + '}';
    }
    
    

}
