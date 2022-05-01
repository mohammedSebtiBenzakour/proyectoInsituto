/*
  Entidad nivel_insituto
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
public class Nivel_instituto implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Id
    @Column(name = "nombre_nivel")
    private String nombre_nivel;

    @Column(name = "creado_el")
    private String creado_el;

    public Nivel_instituto() {
    }

    public Nivel_instituto(Long id, String nombre_nivel, String creado_el) {
        this.id = id;
        this.nombre_nivel = nombre_nivel;
        this.creado_el = creado_el;
    }

    public String getNombre_nivel() {
        return nombre_nivel;
    }

    public void setNombre_nivel(String nombre_nivel) {
        this.nombre_nivel = nombre_nivel;
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
        if (!(object instanceof Nivel_instituto)) {
            return false;
        }
        Nivel_instituto other = (Nivel_instituto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Nivel_insituto[ id=" + id + " ]";
    }

}
