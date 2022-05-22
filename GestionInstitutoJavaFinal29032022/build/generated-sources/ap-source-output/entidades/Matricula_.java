package entidades;

import entidades.Evaluacion;
import entidades.Materia;
import entidades.Registrar_alumnos;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-05-22T15:39:56")
@StaticMetamodel(Matricula.class)
public class Matricula_ { 

    public static volatile SingularAttribute<Matricula, Materia> nombre_materia;
    public static volatile SingularAttribute<Matricula, String> descripcion;
    public static volatile SingularAttribute<Matricula, Registrar_alumnos> alumno;
    public static volatile SingularAttribute<Matricula, Long> id;
    public static volatile SingularAttribute<Matricula, String> nombre_matricula;
    public static volatile SingularAttribute<Matricula, String> creado_el;
    public static volatile ListAttribute<Matricula, Evaluacion> listaEvaluaciones;

}