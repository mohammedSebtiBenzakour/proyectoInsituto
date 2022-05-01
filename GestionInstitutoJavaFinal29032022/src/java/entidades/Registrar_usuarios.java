/*
Entidad Registrar usuarios (Profesores)
 */
package entidades;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author daw44
 */
@Entity
public class Registrar_usuarios implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Expose
    @Id
    @Column(name = "dni")
    private String dni;
    @Expose
    @Column(name = "nombre")
    private String nombre;
    @Expose
    @Column(name = "apellidos")
    private String apellidos;
    @Expose
    @ManyToOne
    @JoinColumn(name = "perfil")
    private Perfiles perfil;
    @Expose
    @Column(name = "usuario")
    private String usuario;
    @Expose
    @Column(name = "clave")
    private String clave;
    @Expose
    @Column(name = "email")
    private String email;
    @Expose
    @ManyToOne
    @JoinColumn(name = "departamento")
    private Departamento_instituto departamento;
    @Expose
    @Column(name = "ciudad")
    private String ciudad;
    @Expose
    @Column(name = "pais")
    private String pais;
    @Expose
    @Column(name = "direccion")
    private String direccion;
    @Expose
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Expose
    @Column(name = "telefono")
    private String telefono;
    @Expose
    @Column(name = "fecha_registro")
    private String fecha_registro;

    @OneToMany
    private List<Materia> listaMaterias;

    public Registrar_usuarios() {
    }

    public Registrar_usuarios(Long id, String dni, String nombre, String apellidos, Perfiles perfil, String usuario, String clave, String email, Departamento_instituto departamento, String ciudad, String pais, String direccion, Date fecha, String telefono, String fecha_registro, List<Materia> listaMaterias) {
        this.id = id;
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.perfil = perfil;
        this.usuario = usuario;
        this.clave = clave;
        this.email = email;
        this.departamento = departamento;
        this.ciudad = ciudad;
        this.pais = pais;
        this.direccion = direccion;
        this.fecha = fecha;
        this.telefono = telefono;
        this.fecha_registro = fecha_registro;
        this.listaMaterias = listaMaterias;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public Perfiles getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfiles perfil) {
        this.perfil = perfil;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Departamento_instituto getDepartamento() {
        return departamento;
    }

    public void setDepartamento(Departamento_instituto departamento) {
        this.departamento = departamento;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public List<Materia> getListaMaterias() {
        return listaMaterias;
    }

    public void setListaMaterias(List<Materia> listaMaterias) {
        this.listaMaterias = listaMaterias;
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
        if (!(object instanceof Registrar_usuarios)) {
            return false;
        }
        Registrar_usuarios other = (Registrar_usuarios) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Registrar_usuarios[ id=" + id + " ]";
    }

}
