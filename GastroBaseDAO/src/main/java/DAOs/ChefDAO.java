/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Chef;
import exception.PersistenciaException;
import interfaces.IChefDAO;
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


}
