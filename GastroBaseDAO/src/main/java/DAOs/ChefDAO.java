/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Chef;
import exception.PersistenciaException;
import interfaces.IChefDAO;
import java.util.Collections;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author joseq
 */
public class ChefDAO implements IChefDAO {

    private IConexionBD conexion;

    public ChefDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    @Override
    public void crearChef(Chef chef) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(chef);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new PersistenciaException("Error al crear el chef: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public Chef buscarPorId(Long id) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();

        try {
            return em.find(Chef.class, id);
        } catch (Exception e) {
            throw new PersistenciaException("Error al buscar el chef con ID: " + id, e);
        } finally {
            em.close();
        }
    }

    @Override
    public Chef buscarPorCorreo(String correo) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        try {
            TypedQuery<Chef> query = em.createQuery(
                    "SELECT u FROM Chef u WHERE u.correo = :correo", Chef.class);
            query.setParameter("correo", correo);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null; // or Optional.empty() if you prefer Optional pattern
        } catch (Exception e) {
            throw new PersistenciaException("Error al buscar chef por correo", e);
        } finally {
            em.close();
        }
    }
    
    @Override
    public Chef buscarPorTelefono(String telefono) throws PersistenciaException {
    EntityManager em = conexion.getEntityManager();
    try {
        TypedQuery<Chef> query = em.createQuery("SELECT c FROM Chef c WHERE c.telefono = :telefono", Chef.class);
        query.setParameter("telefono", telefono);
        return query.getSingleResult();
    } catch (NoResultException e) {
        return null;
    } catch (Exception e) {
        throw new PersistenciaException("Error al buscar por teléfono", e);
    } finally {
        em.close();
    }
}
@Override
public List<Chef> obtenerTodosLosChefs() {
    EntityManager em = conexion.getEntityManager();
    try {
        return em.createQuery(
                "SELECT DISTINCT c FROM Chef c LEFT JOIN FETCH c.recetas", Chef.class)
                .getResultList();
    } catch (Exception e) {
        e.printStackTrace();
        return Collections.emptyList();
    } finally {
        em.close();
    }
}

    @Override
    public void eliminarPorId(Long idChef) throws PersistenciaException {
    EntityManager em = conexion.getEntityManager();
    try {
        em.getTransaction().begin();
        Chef chef = em.find(Chef.class, idChef);
        if (chef != null) {
            em.remove(chef);
        }
        em.getTransaction().commit();
    } catch (Exception e) {
        em.getTransaction().rollback();
        throw new PersistenciaException("Error al eliminar el chef con ID: " + idChef, e);
    } finally {
        em.close();
    }
}
    @Override
    public void actualizarDestacado(Long idChef, boolean destacar) throws PersistenciaException {
    EntityManager em = conexion.getEntityManager();
    try {
        em.getTransaction().begin();
        Chef chef = em.find(Chef.class, idChef);
        if (chef != null) {
            chef.setDestacado(destacar);
        }
        em.getTransaction().commit();
    } catch (Exception e) {
        em.getTransaction().rollback();
        throw new PersistenciaException("Error al actualizar el estado destacado del chef con ID: " + idChef, e);
    } finally {
        em.close();
    }
}


}
