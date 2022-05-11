package entidades;

import entidades.Departamento_instituto;
import entidades.Perfiles;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-05-11T21:25:45")
@StaticMetamodel(Personal_no_docente.class)
public class Personal_no_docente_ { 

    public static volatile SingularAttribute<Personal_no_docente, String> apellidos;
    public static volatile SingularAttribute<Personal_no_docente, String> clave;
    public static volatile SingularAttribute<Personal_no_docente, String> direccion;
    public static volatile SingularAttribute<Personal_no_docente, String> nombre;
    public static volatile SingularAttribute<Personal_no_docente, Perfiles> perfil;
    public static volatile SingularAttribute<Personal_no_docente, String> pais;
    public static volatile SingularAttribute<Personal_no_docente, Date> fecha;
    public static volatile SingularAttribute<Personal_no_docente, String> fecha_registro;
    public static volatile SingularAttribute<Personal_no_docente, String> ciudad;
    public static volatile SingularAttribute<Personal_no_docente, Departamento_instituto> departamento;
    public static volatile SingularAttribute<Personal_no_docente, String> usuario;
    public static volatile SingularAttribute<Personal_no_docente, Long> id;
    public static volatile SingularAttribute<Personal_no_docente, String> telefono;
    public static volatile SingularAttribute<Personal_no_docente, String> dni;
    public static volatile SingularAttribute<Personal_no_docente, String> email;

}