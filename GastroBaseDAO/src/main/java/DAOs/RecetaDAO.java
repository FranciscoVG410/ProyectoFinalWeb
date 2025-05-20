/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Receta;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author carli
 */
public class RecetaDAO {

    private IConexionBD conexion;

    public RecetaDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crear(Receta receta) {
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
            throw e;
        }
    }

    public Receta buscarPorId(Long id) {
        return conexion.getEntityManager().find(Receta.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

}
