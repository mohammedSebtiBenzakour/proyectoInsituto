/*
Jpa controller para crear una matricula
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entidades.Materia;
import entidades.Matricula;
import entidades.Registrar_alumnos;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author daw44
 */
public class MatriculaJpaController implements Serializable {

    public MatriculaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Matricula matricula) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Materia nombre_materia = matricula.getNombre_materia();
            if (nombre_materia != null) {
                nombre_materia = em.getReference(nombre_materia.getClass(), nombre_materia.getMateria());
                matricula.setNombre_materia(nombre_materia);
            }
            Registrar_alumnos alumno = matricula.getAlumno();
            if (alumno != null) {
                alumno = em.getReference(alumno.getClass(), alumno.getDni_alumno());
                matricula.setAlumno(alumno);
            }
            em.persist(matricula);
            if (nombre_materia != null) {
                nombre_materia.getListaMAtriculaciones().add(matricula);
                nombre_materia = em.merge(nombre_materia);
            }
            if (alumno != null) {
                alumno.getListaMatriculaciones().add(matricula);
                alumno = em.merge(alumno);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Matricula matricula) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Matricula persistentMatricula = em.find(Matricula.class, matricula.getId());
            Materia nombre_materiaOld = persistentMatricula.getNombre_materia();
            Materia nombre_materiaNew = matricula.getNombre_materia();
            Registrar_alumnos alumnoOld = persistentMatricula.getAlumno();
            Registrar_alumnos alumnoNew = matricula.getAlumno();
            if (nombre_materiaNew != null) {
                nombre_materiaNew = em.getReference(nombre_materiaNew.getClass(), nombre_materiaNew.getMateria());
                matricula.setNombre_materia(nombre_materiaNew);
            }
            if (alumnoNew != null) {
                alumnoNew = em.getReference(alumnoNew.getClass(), alumnoNew.getDni_alumno());
                matricula.setAlumno(alumnoNew);
            }
            matricula = em.merge(matricula);
            if (nombre_materiaOld != null && !nombre_materiaOld.equals(nombre_materiaNew)) {
                nombre_materiaOld.getListaMAtriculaciones().remove(matricula);
                nombre_materiaOld = em.merge(nombre_materiaOld);
            }
            if (nombre_materiaNew != null && !nombre_materiaNew.equals(nombre_materiaOld)) {
                nombre_materiaNew.getListaMAtriculaciones().add(matricula);
                nombre_materiaNew = em.merge(nombre_materiaNew);
            }
            if (alumnoOld != null && !alumnoOld.equals(alumnoNew)) {
                alumnoOld.getListaMatriculaciones().remove(matricula);
                alumnoOld = em.merge(alumnoOld);
            }
            if (alumnoNew != null && !alumnoNew.equals(alumnoOld)) {
                alumnoNew.getListaMatriculaciones().add(matricula);
                alumnoNew = em.merge(alumnoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = matricula.getId();
                if (findMatricula(id) == null) {
                    throw new NonexistentEntityException("The matricula with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Matricula matricula;
            try {
                matricula = em.getReference(Matricula.class, id);
                matricula.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The matricula with id " + id + " no longer exists.", enfe);
            }
            Materia nombre_materia = matricula.getNombre_materia();
            if (nombre_materia != null) {
                nombre_materia.getListaMAtriculaciones().remove(matricula);
                nombre_materia = em.merge(nombre_materia);
            }
            Registrar_alumnos alumno = matricula.getAlumno();
            if (alumno != null) {
                alumno.getListaMatriculaciones().remove(matricula);
                alumno = em.merge(alumno);
            }
            em.remove(matricula);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Matricula> findMatriculaEntities() {
        return findMatriculaEntities(true, -1, -1);
    }

    public List<Matricula> findMatriculaEntities(int maxResults, int firstResult) {
        return findMatriculaEntities(false, maxResults, firstResult);
    }

    private List<Matricula> findMatriculaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Matricula.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Matricula findMatricula(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Matricula.class, id);
        } finally {
            em.close();
        }
    }

    public int getMatriculaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Matricula> rt = cq.from(Matricula.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
