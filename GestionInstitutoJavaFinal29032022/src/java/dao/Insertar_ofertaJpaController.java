/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import entidades.Insertar_oferta;
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
public class Insertar_ofertaJpaController implements Serializable {

    public Insertar_ofertaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Insertar_oferta insertar_oferta) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(insertar_oferta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Insertar_oferta insertar_oferta) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            insertar_oferta = em.merge(insertar_oferta);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = insertar_oferta.getId();
                if (findInsertar_oferta(id) == null) {
                    throw new NonexistentEntityException("The insertar_oferta with id " + id + " no longer exists.");
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
            Insertar_oferta insertar_oferta;
            try {
                insertar_oferta = em.getReference(Insertar_oferta.class, id);
                insertar_oferta.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The insertar_oferta with id " + id + " no longer exists.", enfe);
            }
            em.remove(insertar_oferta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Insertar_oferta> findInsertar_ofertaEntities() {
        return findInsertar_ofertaEntities(true, -1, -1);
    }

    public List<Insertar_oferta> findInsertar_ofertaEntities(int maxResults, int firstResult) {
        return findInsertar_ofertaEntities(false, maxResults, firstResult);
    }

    private List<Insertar_oferta> findInsertar_ofertaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Insertar_oferta.class));
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

    public Insertar_oferta findInsertar_oferta(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Insertar_oferta.class, id);
        } finally {
            em.close();
        }
    }

    public int getInsertar_ofertaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Insertar_oferta> rt = cq.from(Insertar_oferta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
