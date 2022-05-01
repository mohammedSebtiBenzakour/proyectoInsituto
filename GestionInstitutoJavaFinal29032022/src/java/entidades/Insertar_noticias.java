/*
 Entidad insertar_noticias
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author daw2
 */
@Entity
public class Insertar_noticias implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @Column(name = "nombre_noticia")
    private String nombre_noticia;

    @Column(name = "texto_noticia")
    private String texto_noticia;

    @Column(name = "creado_el")
    private String creado_el;

    public Insertar_noticias() {
    }

    public Insertar_noticias(Long id, String nombre_noticia, String texto_noticia, String creado_el) {
        this.id = id;
        this.nombre_noticia = nombre_noticia;
        this.texto_noticia = texto_noticia;
        this.creado_el = creado_el;
    }

    public String getNombre_noticia() {
        return nombre_noticia;
    }

    public void setNombre_noticia(String nombre_noticia) {
        this.nombre_noticia = nombre_noticia;
    }

    public String getTexto_noticia() {
        return texto_noticia;
    }

    public void setTexto_noticia(String texto_noticia) {
        this.texto_noticia = texto_noticia;
    }

    public String getCreado_el() {
        return creado_el;
    }

    public void setCreado_el(String creado_el) {
        this.creado_el = creado_el;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Insertar_noticias)) {
            return false;
        }
        Insertar_noticias other = (Insertar_noticias) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Insertar_noticias[ id=" + id + " ]";
    }

}
