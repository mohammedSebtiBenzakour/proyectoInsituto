/*
Jpa controller para la subida de documentos al servidor
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import entidades.SubidaDocumento;
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
public class SubidaDocumentoJpaController implements Serializable {

    public SubidaDocumentoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(SubidaDocumento subidaDocumento) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(subidaDocumento);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(SubidaDocumento subidaDocumento) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            subidaDocumento = em.merge(subidaDocumento);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = subidaDocumento.getId();
                if (findSubidaDocumento(id) == null) {
                    throw new NonexistentEntityException("The subidaDocumento with id " + id + " no longer exists.");
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
            SubidaDocumento subidaDocumento;
            try {
                subidaDocumento = em.getReference(SubidaDocumento.class, id);
                subidaDocumento.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The subidaDocumento with id " + id + " no longer exists.", enfe);
            }
            em.remove(subidaDocumento);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<SubidaDocumento> findSubidaDocumentoEntities() {
        return findSubidaDocumentoEntities(true, -1, -1);
    }

    public List<SubidaDocumento> findSubidaDocumentoEntities(int maxResults, int firstResult) {
        return findSubidaDocumentoEntities(false, maxResults, firstResult);
    }

    private List<SubidaDocumento> findSubidaDocumentoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(SubidaDocumento.class));
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

    public SubidaDocumento findSubidaDocumento(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(SubidaDocumento.class, id);
        } finally {
            em.close();
        }
    }

    public int getSubidaDocumentoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<SubidaDocumento> rt = cq.from(SubidaDocumento.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
