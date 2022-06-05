/*
Jpa controller para crear alumnos
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entidades.Matricula;
import entidades.Registrar_alumnos;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author daw44
 */
public class Registrar_alumnosJpaController implements Serializable {

    public Registrar_alumnosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Registrar_alumnos registrar_alumnos) throws PreexistingEntityException, Exception {
        if (registrar_alumnos.getListaMatriculaciones() == null) {
            registrar_alumnos.setListaMatriculaciones(new ArrayList<Matricula>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Matricula> attachedListaMatriculaciones = new ArrayList<Matricula>();
            for (Matricula listaMatriculacionesMatriculaToAttach : registrar_alumnos.getListaMatriculaciones()) {
                listaMatriculacionesMatriculaToAttach = em.getReference(listaMatriculacionesMatriculaToAttach.getClass(), listaMatriculacionesMatriculaToAttach.getId());
                attachedListaMatriculaciones.add(listaMatriculacionesMatriculaToAttach);
            }
            registrar_alumnos.setListaMatriculaciones(attachedListaMatriculaciones);
            em.persist(registrar_alumnos);
            for (Matricula listaMatriculacionesMatricula : registrar_alumnos.getListaMatriculaciones()) {
                Registrar_alumnos oldAlumnoOfListaMatriculacionesMatricula = listaMatriculacionesMatricula.getAlumno();
                listaMatriculacionesMatricula.setAlumno(registrar_alumnos);
                listaMatriculacionesMatricula = em.merge(listaMatriculacionesMatricula);
                if (oldAlumnoOfListaMatriculacionesMatricula != null) {
                    oldAlumnoOfListaMatriculacionesMatricula.getListaMatriculaciones().remove(listaMatriculacionesMatricula);
                    oldAlumnoOfListaMatriculacionesMatricula = em.merge(oldAlumnoOfListaMatriculacionesMatricula);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findRegistrar_alumnos(registrar_alumnos.getDni_alumno()) != null) {
                throw new PreexistingEntityException("Registrar_alumnos " + registrar_alumnos + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Registrar_alumnos registrar_alumnos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Registrar_alumnos persistentRegistrar_alumnos = em.find(Registrar_alumnos.class, registrar_alumnos.getDni_alumno());
            List<Matricula> listaMatriculacionesOld = persistentRegistrar_alumnos.getListaMatriculaciones();
            List<Matricula> listaMatriculacionesNew = registrar_alumnos.getListaMatriculaciones();
            List<Matricula> attachedListaMatriculacionesNew = new ArrayList<Matricula>();
            for (Matricula listaMatriculacionesNewMatriculaToAttach : listaMatriculacionesNew) {
                listaMatriculacionesNewMatriculaToAttach = em.getReference(listaMatriculacionesNewMatriculaToAttach.getClass(), listaMatriculacionesNewMatriculaToAttach.getId());
                attachedListaMatriculacionesNew.add(listaMatriculacionesNewMatriculaToAttach);
            }
            listaMatriculacionesNew = attachedListaMatriculacionesNew;
            registrar_alumnos.setListaMatriculaciones(listaMatriculacionesNew);
            registrar_alumnos = em.merge(registrar_alumnos);
            for (Matricula listaMatriculacionesOldMatricula : listaMatriculacionesOld) {
                if (!listaMatriculacionesNew.contains(listaMatriculacionesOldMatricula)) {
                    listaMatriculacionesOldMatricula.setAlumno(null);
                    listaMatriculacionesOldMatricula = em.merge(listaMatriculacionesOldMatricula);
                }
            }
            for (Matricula listaMatriculacionesNewMatricula : listaMatriculacionesNew) {
                if (!listaMatriculacionesOld.contains(listaMatriculacionesNewMatricula)) {
                    Registrar_alumnos oldAlumnoOfListaMatriculacionesNewMatricula = listaMatriculacionesNewMatricula.getAlumno();
                    listaMatriculacionesNewMatricula.setAlumno(registrar_alumnos);
                    listaMatriculacionesNewMatricula = em.merge(listaMatriculacionesNewMatricula);
                    if (oldAlumnoOfListaMatriculacionesNewMatricula != null && !oldAlumnoOfListaMatriculacionesNewMatricula.equals(registrar_alumnos)) {
                        oldAlumnoOfListaMatriculacionesNewMatricula.getListaMatriculaciones().remove(listaMatriculacionesNewMatricula);
                        oldAlumnoOfListaMatriculacionesNewMatricula = em.merge(oldAlumnoOfListaMatriculacionesNewMatricula);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = registrar_alumnos.getDni_alumno();
                if (findRegistrar_alumnos(id) == null) {
                    throw new NonexistentEntityException("The registrar_alumnos with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Registrar_alumnos registrar_alumnos;
            try {
                registrar_alumnos = em.getReference(Registrar_alumnos.class, id);
                registrar_alumnos.getDni_alumno();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The registrar_alumnos with id " + id + " no longer exists.", enfe);
            }
            List<Matricula> listaMatriculaciones = registrar_alumnos.getListaMatriculaciones();
            for (Matricula listaMatriculacionesMatricula : listaMatriculaciones) {
                listaMatriculacionesMatricula.setAlumno(null);
                listaMatriculacionesMatricula = em.merge(listaMatriculacionesMatricula);
            }
            em.remove(registrar_alumnos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Registrar_alumnos> findRegistrar_alumnosEntities() {
        return findRegistrar_alumnosEntities(true, -1, -1);
    }

    public List<Registrar_alumnos> findRegistrar_alumnosEntities(int maxResults, int firstResult) {
        return findRegistrar_alumnosEntities(false, maxResults, firstResult);
    }

    private List<Registrar_alumnos> findRegistrar_alumnosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Registrar_alumnos.class));
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

    public Registrar_alumnos findRegistrar_alumnos(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Registrar_alumnos.class, id);
        } finally {
            em.close();
        }
    }

    public int getRegistrar_alumnosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Registrar_alumnos> rt = cq.from(Registrar_alumnos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
