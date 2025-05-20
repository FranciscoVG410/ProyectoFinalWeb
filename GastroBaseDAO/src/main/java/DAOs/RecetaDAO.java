/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Chef;
import dominio.Receta;
import exception.PersistenciaException;
import interfaces.IRecetaDAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author carli
 */
public class RecetaDAO implements IRecetaDAO {

    private IConexionBD conexion;

    public RecetaDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    @Override
    public void crearReceta(Receta receta) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(receta);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new PersistenciaException("Error al crear la receta: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

      @Override
    public Receta buscarPorId(Long id) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();

        try {
            return em.find(Receta.class, id);
        } catch (Exception e) {
            throw new PersistenciaException("Error al buscar la receta ID: " + id, e);
        } finally {
            em.close();
        }
    }
    @Override
    public List<Receta> obtenerRecetasPorChef(Chef chef) throws PersistenciaException {
    EntityManager em = conexion.getEntityManager();
    try {
        TypedQuery<Receta> query = em.createQuery("SELECT r FROM Receta r WHERE r.chef = :chef", Receta.class);
        query.setParameter("chef", chef);
        return query.getResultList();
    } catch (Exception e) {
        throw new PersistenciaException("Error al obtener recetas del chef.", e);
    } finally {
        em.close();
    }
}



}
