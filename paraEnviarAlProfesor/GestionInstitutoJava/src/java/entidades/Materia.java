/*
 Entidad materia
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author daw2
 */
@Entity
public class Materia implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Id
    @Column(name = "materia")
    private String materia;

    @Column(name = "descripcion_materia")
    private String descripcion_materia;
    
    @ManyToOne
    @JoinColumn(name = "dni_profesor")
    private Registrar_usuarios profesor;

    @Column(name = "fecha_creacion")
    private String fecha_creacion;

    public Materia() {
    }

    public Materia(Long id, String materia, String descripcion_materia, Registrar_usuarios profesor, String fecha_creacion) {
        this.id = id;
        this.materia = materia;
        this.descripcion_materia = descripcion_materia;
        this.profesor = profesor;
        this.fecha_creacion = fecha_creacion;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getDescripcion_materia() {
        return descripcion_materia;
    }

    public void setDescripcion_materia(String descripcion_materia) {
        this.descripcion_materia = descripcion_materia;
    }

    public Registrar_usuarios getProfesor() {
        return profesor;
    }

    public void setProfesor(Registrar_usuarios profesor) {
        this.profesor = profesor;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
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
        if (!(object instanceof Materia)) {
            return false;
        }
        Materia other = (Materia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Materia[ id=" + id + " ]";
    }

}
