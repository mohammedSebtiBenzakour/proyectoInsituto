/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import entidades.Registrar_alumnos;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author daw2
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
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(registrar_alumnos);
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
            registrar_alumnos = em.merge(registrar_alumnos);
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
