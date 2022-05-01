/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import entidades.Personal_no_docente;
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
 * @author daw44
 */
public class Personal_no_docenteJpaController implements Serializable {

    public Personal_no_docenteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Personal_no_docente personal_no_docente) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(personal_no_docente);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findPersonal_no_docente(personal_no_docente.getDni()) != null) {
                throw new PreexistingEntityException("Personal_no_docente " + personal_no_docente + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Personal_no_docente personal_no_docente) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            personal_no_docente = em.merge(personal_no_docente);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = personal_no_docente.getDni();
                if (findPersonal_no_docente(id) == null) {
                    throw new NonexistentEntityException("The personal_no_docente with id " + id + " no longer exists.");
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
            Personal_no_docente personal_no_docente;
            try {
                personal_no_docente = em.getReference(Personal_no_docente.class, id);
                personal_no_docente.getDni();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The personal_no_docente with id " + id + " no longer exists.", enfe);
            }
            em.remove(personal_no_docente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Personal_no_docente> findPersonal_no_docenteEntities() {
        return findPersonal_no_docenteEntities(true, -1, -1);
    }

    public List<Personal_no_docente> findPersonal_no_docenteEntities(int maxResults, int firstResult) {
        return findPersonal_no_docenteEntities(false, maxResults, firstResult);
    }

    private List<Personal_no_docente> findPersonal_no_docenteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Personal_no_docente.class));
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

    public Personal_no_docente findPersonal_no_docente(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Personal_no_docente.class, id);
        } finally {
            em.close();
        }
    }

    public int getPersonal_no_docenteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Personal_no_docente> rt = cq.from(Personal_no_docente.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
