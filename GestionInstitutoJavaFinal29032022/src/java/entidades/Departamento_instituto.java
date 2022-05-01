/*
 Entidad departemento_instituto
 */
package entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author daw2
 */
@Entity
public class Departamento_instituto implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Id
    @Column(name = "nombre_departamento")
    private String nombre_departamento;

    @Column(name = "creado_el")
    private String creado_el;
    
    @OneToMany
    private List<Registrar_usuarios> listaProfesores ;

    public Departamento_instituto() {
    }

    public Departamento_instituto(Long id, String nombre_departamento, String creado_el) {
        this.id = id;
        this.nombre_departamento = nombre_departamento;
        this.creado_el = creado_el;
    }
    public List<Registrar_usuarios> getlistaProfesores() {
        return listaProfesores;
    }

    public void setlistaProfesores(List<Registrar_usuarios> listaProfesores) {
        this.listaProfesores = listaProfesores;
    }
    

    public String getNombre_departamento() {
        return nombre_departamento;
    }

    public void setNombre_departamento(String nombre_departamento) {
        this.nombre_departamento = nombre_departamento;
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
        if (!(object instanceof Departamento_instituto)) {
            return false;
        }
        Departamento_instituto other = (Departamento_instituto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Departamento_instituto[ id=" + id + " ]";
    }

}
