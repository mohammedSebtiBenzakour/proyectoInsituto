/*
registrar alumnos
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author daw2
 */
@Entity
public class Registrar_alumnos implements Serializable {

    private static final long serialVersionUID = 1L;
   
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Lob
    @Column(name="imagen_alumno")
    private String imagen_alumno;
    @Id
    @Column(name="dni_alumno")
    private String dni_alumno;
    @Column(name="nombre_alumno")
    private String nombre_alumno;
    @Column(name="primer_apellido_alumno")
    private String primer_apellido_alumno;
    @Column(name="segundo_apellido_alumno")
    private String segundo_apellido_alumno;
    @Column(name="genero")
    private String genero;
    @Column(name="email_alumno")
    private String email_alumno;
    @Column(name="telefono_alumno")
    private String telefono_alumno;
    @Column(name="nivel_alumno")
    private String nivel_alumno;
    @Column(name="calle_alumno")
    private String calle_alumno;
    @Column(name="ciudad_alumno")
    private String ciudad_alumno;
    @Column(name="cp_alumno")
    private String cp_alumno;
    @Column(name="fecha_nacimiento_alumno")
    @Temporal(TemporalType.DATE)
    private Date fecha_nacimiento_alumno;
    @Column(name="pais_alumno")
    private String pais_alumno;
    @Column(name="creado_el")
    private String creado_el;

    public Registrar_alumnos() {
    }

    public Registrar_alumnos(Long id, String imagen_alumno, String dni_alumno, String nombre_alumno, String primer_apellido_alumno, String segundo_apellido_alumno, String genero, String email_alumno, String telefono_alumno, String nivel_alumno, String calle_alumno, String ciudad_alumno, String cp_alumno, Date fecha_nacimiento_alumno, String pais_alumno, String creado_el) {
        this.id = id;
        this.imagen_alumno = imagen_alumno;
        this.dni_alumno = dni_alumno;
        this.nombre_alumno = nombre_alumno;
        this.primer_apellido_alumno = primer_apellido_alumno;
        this.segundo_apellido_alumno = segundo_apellido_alumno;
        this.genero = genero;
        this.email_alumno = email_alumno;
        this.telefono_alumno = telefono_alumno;
        this.nivel_alumno = nivel_alumno;
        this.calle_alumno = calle_alumno;
        this.ciudad_alumno = ciudad_alumno;
        this.cp_alumno = cp_alumno;
        this.fecha_nacimiento_alumno = fecha_nacimiento_alumno;
        this.pais_alumno = pais_alumno;
        this.creado_el = creado_el;
    }

    public String getImagen_alumno() {
        return imagen_alumno;
    }

    public void setImagen_alumno(String imagen_alumno) {
        this.imagen_alumno = imagen_alumno;
    }

    public String getDni_alumno() {
        return dni_alumno;
    }

    public void setDni_alumno(String dni_alumno) {
        this.dni_alumno = dni_alumno;
    }

    public String getNombre_alumno() {
        return nombre_alumno;
    }

    public void setNombre_alumno(String nombre_alumno) {
        this.nombre_alumno = nombre_alumno;
    }

    public String getPrimer_apellido_alumno() {
        return primer_apellido_alumno;
    }

    public void setPrimer_apellido_alumno(String primer_apellido_alumno) {
        this.primer_apellido_alumno = primer_apellido_alumno;
    }

    public String getSegundo_apellido_alumno() {
        return segundo_apellido_alumno;
    }

    public void setSegundo_apellido_alumno(String segundo_apellido_alumno) {
        this.segundo_apellido_alumno = segundo_apellido_alumno;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEmail_alumno() {
        return email_alumno;
    }

    public void setEmail_alumno(String email_alumno) {
        this.email_alumno = email_alumno;
    }

    public String getTelefono_alumno() {
        return telefono_alumno;
    }

    public void setTelefono_alumno(String telefono_alumno) {
        this.telefono_alumno = telefono_alumno;
    }

    public String getNivel_alumno() {
        return nivel_alumno;
    }

    public void setNivel_alumno(String nivel_alumno) {
        this.nivel_alumno = nivel_alumno;
    }

    public String getCalle_alumno() {
        return calle_alumno;
    }

    public void setCalle_alumno(String calle_alumno) {
        this.calle_alumno = calle_alumno;
    }

    public String getCiudad_alumno() {
        return ciudad_alumno;
    }

    public void setCiudad_alumno(String ciudad_alumno) {
        this.ciudad_alumno = ciudad_alumno;
    }

    public String getCp_alumno() {
        return cp_alumno;
    }

    public void setCp_alumno(String cp_alumno) {
        this.cp_alumno = cp_alumno;
    }

    public Date getFecha_nacimiento_alumno() {
        return fecha_nacimiento_alumno;
    }

    public void setFecha_nacimiento_alumno(Date fecha_nacimiento_alumno) {
        this.fecha_nacimiento_alumno = fecha_nacimiento_alumno;
    }

    public String getPais_alumno() {
        return pais_alumno;
    }

    public void setPais_alumno(String pais_alumno) {
        this.pais_alumno = pais_alumno;
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
        if (!(object instanceof Registrar_alumnos)) {
            return false;
        }
        Registrar_alumnos other = (Registrar_alumnos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Registrar_alumnos[ id=" + id + " ]";
    }
    
}
