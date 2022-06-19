package entidades;

import entidades.Materia;
import entidades.Personal_no_docente;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-06-16T13:41:16")
@StaticMetamodel(Curso.class)
public class Curso_ { 

    public static volatile ListAttribute<Curso, Materia> listaMaterias;
    public static volatile SingularAttribute<Curso, String> descripcion_curso;
    public static volatile SingularAttribute<Curso, String> curso;
    public static volatile ListAttribute<Curso, Personal_no_docente> listaPersonalNoDocente;
    public static volatile SingularAttribute<Curso, Long> id;
    public static volatile SingularAttribute<Curso, String> fecha_creacion;

}