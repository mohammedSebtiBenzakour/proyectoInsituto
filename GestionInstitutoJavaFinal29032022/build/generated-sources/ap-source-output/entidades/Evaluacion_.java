package entidades;

import entidades.Registrar_alumnos;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-14T23:32:57")
@StaticMetamodel(Evaluacion.class)
public class Evaluacion_ { 

    public static volatile SingularAttribute<Evaluacion, String> fecha_registro;
    public static volatile SingularAttribute<Evaluacion, Registrar_alumnos> alumno;
    public static volatile SingularAttribute<Evaluacion, Long> id;
    public static volatile SingularAttribute<Evaluacion, String> nota;
    public static volatile SingularAttribute<Evaluacion, String> observacion;

}