/*
Jpa controller para crear un nivel
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import entidades.Nivel_instituto;
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
public class Nivel_institutoJpaController implements Serializable {

    public Nivel_institutoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Nivel_instituto nivel_insituto) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(nivel_insituto);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findNivel_insituto(nivel_insituto.getNombre_nivel()) != null) {
                throw new PreexistingEntityException("Nivel_insituto " + nivel_insituto + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Nivel_instituto nivel_insituto) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            nivel_insituto = em.merge(nivel_insituto);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = nivel_insituto.getNombre_nivel();
                if (findNivel_insituto(id) == null) {
                    throw new NonexistentEntityException("The nivel_insituto with id " + id + " no longer exists.");
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
            Nivel_instituto nivel_insituto;
            try {
                nivel_insituto = em.getReference(Nivel_instituto.class, id);
                nivel_insituto.getNombre_nivel();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The nivel_insituto with id " + id + " no longer exists.", enfe);
            }
            em.remove(nivel_insituto);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Nivel_instituto> findNivel_insitutoEntities() {
        return findNivel_insitutoEntities(true, -1, -1);
    }

    public List<Nivel_instituto> findNivel_insitutoEntities(int maxResults, int firstResult) {
        return findNivel_insitutoEntities(false, maxResults, firstResult);
    }

    private List<Nivel_instituto> findNivel_insitutoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Nivel_instituto.class));
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

    public Nivel_instituto findNivel_insituto(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Nivel_instituto.class, id);
        } finally {
            em.close();
        }
    }

    public int getNivel_insitutoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Nivel_instituto> rt = cq.from(Nivel_instituto.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
