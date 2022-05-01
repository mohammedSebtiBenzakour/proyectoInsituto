/*
 Entidad materia
 */
package entidades;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author daw44
 */
@Entity
public class Materia implements Serializable {

    private static final long serialVersionUID = 1L;
   
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Expose
    @Id
    @Column(name = "materia")
    private String materia;
    @Expose
    @Column(name = "descripcion_materia")
    private String descripcion_materia;
    @Expose
    @ManyToOne
    @JoinColumn(name = "dni_profesor")
    private Registrar_usuarios profesor;
    @Expose
    @Column(name = "fecha_creacion")
    private String fecha_creacion;
    @Expose
    @OneToMany
    private List<Matricula> listaMatriculaciones ;
    
    

    public Materia() {
    }

    public Materia(Long id, String materia, String descripcion_materia, Registrar_usuarios profesor, String fecha_creacion, List<Matricula> listaMAtriculaciones) {
        this.id = id;
        this.materia = materia;
        this.descripcion_materia = descripcion_materia;
        this.profesor = profesor;
        this.fecha_creacion = fecha_creacion;
        this.listaMatriculaciones = listaMAtriculaciones;
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

    public List<Matricula> getListaMAtriculaciones() {
        return listaMatriculaciones;
    }

    public void setListaMAtriculaciones(List<Matricula> listaMAtriculaciones) {
        this.listaMatriculaciones = listaMAtriculaciones;
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
