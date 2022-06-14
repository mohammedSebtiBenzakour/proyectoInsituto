package entidades;

import entidades.Departamento_instituto;
import entidades.Materia;
import entidades.Perfiles;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-14T07:48:33")
@StaticMetamodel(Registrar_usuarios.class)
public class Registrar_usuarios_ { 

    public static volatile SingularAttribute<Registrar_usuarios, String> apellidos;
    public static volatile SingularAttribute<Registrar_usuarios, String> clave;
    public static volatile SingularAttribute<Registrar_usuarios, String> direccion;
    public static volatile SingularAttribute<Registrar_usuarios, String> nombre;
    public static volatile SingularAttribute<Registrar_usuarios, Perfiles> perfil;
    public static volatile SingularAttribute<Registrar_usuarios, String> pais;
    public static volatile SingularAttribute<Registrar_usuarios, Date> fecha;
    public static volatile ListAttribute<Registrar_usuarios, Materia> listaMaterias;
    public static volatile SingularAttribute<Registrar_usuarios, String> fecha_registro;
    public static volatile SingularAttribute<Registrar_usuarios, String> ciudad;
    public static volatile SingularAttribute<Registrar_usuarios, Departamento_instituto> departamento;
    public static volatile SingularAttribute<Registrar_usuarios, String> usuario;
    public static volatile SingularAttribute<Registrar_usuarios, Long> id;
    public static volatile SingularAttribute<Registrar_usuarios, String> telefono;
    public static volatile SingularAttribute<Registrar_usuarios, String> dni;
    public static volatile SingularAttribute<Registrar_usuarios, String> email;

}