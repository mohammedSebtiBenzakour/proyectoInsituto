package entidades;

import entidades.Matricula;
import entidades.Nivel_instituto;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-05-22T15:39:56")
@StaticMetamodel(Registrar_alumnos.class)
public class Registrar_alumnos_ { 

    public static volatile SingularAttribute<Registrar_alumnos, String> imagen_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> nombre_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> telefono_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> ciudad_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, Date> fecha_nacimiento_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> cp_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> pais_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> segundo_apellido_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> dni_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> calle_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> genero;
    public static volatile SingularAttribute<Registrar_alumnos, Long> id;
    public static volatile SingularAttribute<Registrar_alumnos, Nivel_instituto> nivel_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> creado_el;
    public static volatile ListAttribute<Registrar_alumnos, Matricula> listaMatriculaciones;
    public static volatile SingularAttribute<Registrar_alumnos, String> email_alumno;
    public static volatile SingularAttribute<Registrar_alumnos, String> primer_apellido_alumno;

}