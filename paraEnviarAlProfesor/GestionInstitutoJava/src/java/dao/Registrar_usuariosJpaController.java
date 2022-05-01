/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.exceptions.NonexistentEntityException;
import dao.exceptions.PreexistingEntityException;
import entidades.Registrar_usuarios;
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
public class Registrar_usuariosJpaController implements Serializable {

    public Registrar_usuariosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Registrar_usuarios registrar_usuarios) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(registrar_usuarios);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findregistrar_usuarios(registrar_usuarios.getDni()) != null) {
                throw new PreexistingEntityException("registrar_usuarios " + registrar_usuarios + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Registrar_usuarios registrar_usuarios) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            registrar_usuarios = em.merge(registrar_usuarios);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = registrar_usuarios.getDni();
                if (findregistrar_usuarios(id) == null) {
                    throw new NonexistentEntityException("The registrar_usuarios with id " + id + " no longer exists.");
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
            Registrar_usuarios registrar_usuarios;
            try {
                registrar_usuarios = em.getReference(Registrar_usuarios.class, id);
                registrar_usuarios.getDni();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The registrar_usuarios with id " + id + " no longer exists.", enfe);
            }
            em.remove(registrar_usuarios);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Registrar_usuarios> findregistrar_usuariosEntities() {
        return findregistrar_usuariosEntities(true, -1, -1);
    }

    public List<Registrar_usuarios> findregistrar_usuariosEntities(int maxResults, int firstResult) {
        return findregistrar_usuariosEntities(false, maxResults, firstResult);
    }

    private List<Registrar_usuarios> findregistrar_usuariosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Registrar_usuarios.class));
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

    public Registrar_usuarios findregistrar_usuarios(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Registrar_usuarios.class, id);
        } finally {
            em.close();
        }
    }

    public int getregistrar_usuariosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Registrar_usuarios> rt = cq.from(Registrar_usuarios.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
