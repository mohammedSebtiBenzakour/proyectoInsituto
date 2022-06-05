/*
Entidad subida documento
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
public class SubidaDocumento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
     @Column(name = "subida_documento")
    private String subida_documento;
     
    @Column(name = "creado_el")
    private String creado_el;

    public SubidaDocumento() {
    }

    public SubidaDocumento(Long id, String subida_documento, String creado_el) {
        this.id = id;
        this.subida_documento = subida_documento;
        this.creado_el = creado_el;
    }

    public String getSubida_documento() {
        return subida_documento;
    }

    public void setSubida_documento(String subida_documento) {
        this.subida_documento = subida_documento;
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
        if (!(object instanceof SubidaDocumento)) {
            return false;
        }
        SubidaDocumento other = (SubidaDocumento) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.SubidaDocumento[ id=" + id + " ]";
    }
    
}
