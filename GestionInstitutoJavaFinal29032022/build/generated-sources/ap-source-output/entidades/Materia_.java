package entidades;

import entidades.Matricula;
import entidades.Registrar_usuarios;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-08T22:44:56")
@StaticMetamodel(Materia.class)
public class Materia_ { 

    public static volatile SingularAttribute<Materia, String> descripcion_materia;
    public static volatile SingularAttribute<Materia, String> materia;
    public static volatile SingularAttribute<Materia, Registrar_usuarios> profesor;
    public static volatile SingularAttribute<Materia, Long> id;
    public static volatile SingularAttribute<Materia, String> fecha_creacion;
    public static volatile ListAttribute<Materia, Matricula> listaMatriculaciones;

}