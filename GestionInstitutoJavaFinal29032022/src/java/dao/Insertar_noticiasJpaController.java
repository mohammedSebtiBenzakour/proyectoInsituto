/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import entidades.Insertar_noticias;
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
public class Insertar_noticiasJpaController implements Serializable {

    public Insertar_noticiasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Insertar_noticias insertar_noticias) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(insertar_noticias);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Insertar_noticias insertar_noticias) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            insertar_noticias = em.merge(insertar_noticias);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = insertar_noticias.getId();
                if (findInsertar_noticias(id) == null) {
                    throw new NonexistentEntityException("The insertar_noticias with id " + id + " no longer exists.");
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
            Insertar_noticias insertar_noticias;
            try {
                insertar_noticias = em.getReference(Insertar_noticias.class, id);
                insertar_noticias.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The insertar_noticias with id " + id + " no longer exists.", enfe);
            }
            em.remove(insertar_noticias);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Insertar_noticias> findInsertar_noticiasEntities() {
        return findInsertar_noticiasEntities(true, -1, -1);
    }

    public List<Insertar_noticias> findInsertar_noticiasEntities(int maxResults, int firstResult) {
        return findInsertar_noticiasEntities(false, maxResults, firstResult);
    }

    private List<Insertar_noticias> findInsertar_noticiasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Insertar_noticias.class));
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

    public Insertar_noticias findInsertar_noticias(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Insertar_noticias.class, id);
        } finally {
            em.close();
        }
    }

    public int getInsertar_noticiasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Insertar_noticias> rt = cq.from(Insertar_noticias.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
