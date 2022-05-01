/*
Entidad curso
 */
package entidades;

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
public class Curso implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Id
    @Column(name = "curso")
    private String curso;

    @Column(name = "descripcion_curso")
    private String descripcion_curso;

    @Column(name = "fecha_creacion")
    private String fecha_creacion;

    @OneToMany
    private List<Materia> listaMaterias;

    @OneToMany
    private List<Personal_no_docente> listaPersonalNoDocente;

    public Curso() {
    }

    public Curso(Long id, String curso, String descripcion_curso, String fecha_creacion, List<Materia> listaMaterias, List<Personal_no_docente> listaPersonalNoDocente) {
        this.id = id;
        this.curso = curso;
        this.descripcion_curso = descripcion_curso;
        this.fecha_creacion = fecha_creacion;
        this.listaMaterias = listaMaterias;
        this.listaPersonalNoDocente = listaPersonalNoDocente;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getDescripcion_curso() {
        return descripcion_curso;
    }

    public void setDescripcion_curso(String descripcion_curso) {
        this.descripcion_curso = descripcion_curso;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public List<Materia> getListaMatrias() {
        return listaMaterias;
    }

    public void setListaMatrias(List<Materia> listaMatrias) {
        this.listaMaterias = listaMatrias;
    }

    public List<Personal_no_docente> getListaPersonalNoDocente() {
        return listaPersonalNoDocente;
    }

    public void setListaPersonalNoDocente(List<Personal_no_docente> listaPersonalNoDocente) {
        this.listaPersonalNoDocente = listaPersonalNoDocente;
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
        if (!(object instanceof Curso)) {
            return false;
        }
        Curso other = (Curso) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Curso[ id=" + id + " ]";
    }

}
