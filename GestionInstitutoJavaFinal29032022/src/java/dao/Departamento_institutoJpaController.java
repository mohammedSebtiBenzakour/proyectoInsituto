/*
Jpa controller para crear un departamento
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import entidades.Departamento_instituto;
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
public class Departamento_institutoJpaController implements Serializable {

    public Departamento_institutoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Departamento_instituto departamento_instituto) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(departamento_instituto);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findDepartamento_instituto(departamento_instituto.getNombre_departamento()) != null) {
                throw new PreexistingEntityException("Departamento_instituto " + departamento_instituto + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Departamento_instituto departamento_instituto) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            departamento_instituto = em.merge(departamento_instituto);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = departamento_instituto.getNombre_departamento();
                if (findDepartamento_instituto(id) == null) {
                    throw new NonexistentEntityException("The departamento_instituto with id " + id + " no longer exists.");
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
            Departamento_instituto departamento_instituto;
            try {
                departamento_instituto = em.getReference(Departamento_instituto.class, id);
                departamento_instituto.getNombre_departamento();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The departamento_instituto with id " + id + " no longer exists.", enfe);
            }
            em.remove(departamento_instituto);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Departamento_instituto> findDepartamento_institutoEntities() {
        return findDepartamento_institutoEntities(true, -1, -1);
    }

    public List<Departamento_instituto> findDepartamento_institutoEntities(int maxResults, int firstResult) {
        return findDepartamento_institutoEntities(false, maxResults, firstResult);
    }

    private List<Departamento_instituto> findDepartamento_institutoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Departamento_instituto.class));
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

    public Departamento_instituto findDepartamento_instituto(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Departamento_instituto.class, id);
        } finally {
            em.close();
        }
    }

    public int getDepartamento_institutoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Departamento_instituto> rt = cq.from(Departamento_instituto.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
