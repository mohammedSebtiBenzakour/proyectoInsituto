/*
 Entidad evaluacion
 */
package entidades;

import com.google.gson.annotations.Expose;
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
 * @author daw44
 */
@Entity
public class Evaluacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Expose
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    @Expose
    @ManyToOne
    @JoinColumn(name = "dni_alumno")
    private Registrar_alumnos alumno;
    @Expose
    @Column(name = "nota")
    private String nota;

    @Column(name = "observacion")
    private String observacion;

    @Column(name = "fecha_registro")
    private String fecha_registro;

    public Evaluacion() {
    }

    public Evaluacion(Long id, Registrar_alumnos alumno, String nota, String observacion, String fecha_registro) {
        this.id = id;
        this.alumno = alumno;
        this.nota = nota;
        this.observacion = observacion;
        this.fecha_registro = fecha_registro;
    }

    public Registrar_alumnos getAlumno() {
        return alumno;
    }

    public void setAlumno(Registrar_alumnos alumno) {
        this.alumno = alumno;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
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
        if (!(object instanceof Evaluacion)) {
            return false;
        }
        Evaluacion other = (Evaluacion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Evaluacion[ id=" + id + " ]";
    }

}
