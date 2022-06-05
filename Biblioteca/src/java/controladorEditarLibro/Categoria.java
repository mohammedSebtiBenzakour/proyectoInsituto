/*
Clase categoria del libro
 */
package controladorEditarLibro;

import java.sql.Timestamp;

/**
 *
 * @author daw2
 */
public class Categoria {

    private String categoriaLibro;
    private Timestamp creado_el;

    public Categoria() {
    }

    public Categoria(String categoriaLibro, Timestamp creado_el) {
        this.categoriaLibro = categoriaLibro;
        this.creado_el = creado_el;
    }

    public Categoria(String categoriaLibro) {
        this.categoriaLibro = categoriaLibro;
    }

    public String getCategoriaLibro() {
        return categoriaLibro;
    }

    public void setCategoriaLibro(String categoriaLibro) {
        this.categoriaLibro = categoriaLibro;
    }

    public Timestamp getCreado_el() {
        return creado_el;
    }

    public void setCreado_el(Timestamp creado_el) {
        this.creado_el = creado_el;
    }

    @Override
    public String toString() {
        return "Categoria{" + "categoriaLibro=" + categoriaLibro + ", creado_el=" + creado_el + '}';
    }

}
