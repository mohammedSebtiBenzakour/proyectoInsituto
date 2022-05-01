/*
 Entidad insertar_oferta
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author daw2
 */
@Entity
public class Insertar_oferta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @Column(name = "referencia_oferta")
    private String referencia_oferta;

    @Column(name = "nombre_oferta")
    private String nombre_oferta;

    @Column(name = "empresa_oferta")
    private String empresa_oferta;

    @Column(name = "ciudad_oferta")
    private String ciudad_oferta;

    @Column(name = "tipo_oferta")
    private String tipo_oferta;

    @Column(name = "descripcion_oferta")
    private String descripcion_oferta;

    @Temporal(TemporalType.DATE)
    @Column(name = "fecha_oferta")
    private Date fecha_oferta;

    @Column(name = "fecha_actual")
    private String fecha_actual;

    public Insertar_oferta() {
    }

    public Insertar_oferta(Long id, String referencia_oferta, String nombre_oferta, String empresa_oferta, String ciudad_oferta, String tipo_oferta, String descripcion_oferta, Date fecha_oferta, String fecha_actual) {
        this.id = id;
        this.referencia_oferta = referencia_oferta;
        this.nombre_oferta = nombre_oferta;
        this.empresa_oferta = empresa_oferta;
        this.ciudad_oferta = ciudad_oferta;
        this.tipo_oferta = tipo_oferta;
        this.descripcion_oferta = descripcion_oferta;
        this.fecha_oferta = fecha_oferta;
        this.fecha_actual = fecha_actual;
    }

    public String getReferencia_oferta() {
        return referencia_oferta;
    }

    public void setReferencia_oferta(String referencia_oferta) {
        this.referencia_oferta = referencia_oferta;
    }

    public String getNombre_oferta() {
        return nombre_oferta;
    }

    public void setNombre_oferta(String nombre_oferta) {
        this.nombre_oferta = nombre_oferta;
    }

    public String getEmpresa_oferta() {
        return empresa_oferta;
    }

    public void setEmpresa_oferta(String empresa_oferta) {
        this.empresa_oferta = empresa_oferta;
    }

    public String getCiudad_oferta() {
        return ciudad_oferta;
    }

    public void setCiudad_oferta(String ciudad_oferta) {
        this.ciudad_oferta = ciudad_oferta;
    }

    public String getTipo_oferta() {
        return tipo_oferta;
    }

    public void setTipo_oferta(String tipo_oferta) {
        this.tipo_oferta = tipo_oferta;
    }

    public String getDescripcion_oferta() {
        return descripcion_oferta;
    }

    public void setDescripcion_oferta(String descripcion_oferta) {
        this.descripcion_oferta = descripcion_oferta;
    }

    public Date getFecha_oferta() {
        return fecha_oferta;
    }

    public void setFecha_oferta(Date fecha_oferta) {
        this.fecha_oferta = fecha_oferta;
    }

    public String getFecha_actual() {
        return fecha_actual;
    }

    public void setFecha_actual(String fecha_actual) {
        this.fecha_actual = fecha_actual;
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
        if (!(object instanceof Insertar_oferta)) {
            return false;
        }
        Insertar_oferta other = (Insertar_oferta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Insertar_oferta[ id=" + id + " ]";
    }

}
