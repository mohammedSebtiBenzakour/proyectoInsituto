/*
 Entidad Matricula
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
public class Matricula implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    @Expose
    @Column(name = "nombre_matricula")
    private String nombre_matricula;

    @ManyToOne
    @JoinColumn(name = "nombre_materia")
    private Materia nombre_materia;
    @Expose
    @ManyToOne
    @JoinColumn(name = "dni_alumno")
    private Registrar_alumnos alumno;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "creado_el")
    private String creado_el;

    @OneToMany
    private List<Evaluacion> listaEvaluaciones;

    public Matricula() {
    }

    public Matricula(Long id, String nombre_matricula, Materia nombre_materia, Registrar_alumnos alumno, String descripcion, String creado_el, List<Evaluacion> listaEvaluaciones) {
        this.id = id;
        this.nombre_matricula = nombre_matricula;
        this.nombre_materia = nombre_materia;
        this.alumno = alumno;
        this.descripcion = descripcion;
        this.creado_el = creado_el;
        this.listaEvaluaciones = listaEvaluaciones;
    }

    public String getNombre_matricula() {
        return nombre_matricula;
    }

    public void setNombre_matricula(String nombre_matricula) {
        this.nombre_matricula = nombre_matricula;
    }

    public Materia getNombre_materia() {
        return nombre_materia;
    }

    public void setNombre_materia(Materia nombre_materia) {
        this.nombre_materia = nombre_materia;
    }

    public Registrar_alumnos getAlumno() {
        return alumno;
    }

    public void setAlumno(Registrar_alumnos alumno) {
        this.alumno = alumno;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCreado_el() {
        return creado_el;
    }

    public void setCreado_el(String creado_el) {
        this.creado_el = creado_el;
    }

    public List<Evaluacion> getListaEvaluaciones() {
        return listaEvaluaciones;
    }

    public void setListaEvaluaciones(List<Evaluacion> listaEvaluaciones) {
        this.listaEvaluaciones = listaEvaluaciones;
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
        if (!(object instanceof Matricula)) {
            return false;
        }
        Matricula other = (Matricula) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Matricula[ id=" + id + " ]";
    }

}
