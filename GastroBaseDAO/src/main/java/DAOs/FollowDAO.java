/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Follow;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author joseq
 */
public class FollowDAO {

    private IConexionBD conexion;

    public FollowDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crear(Follow follow) {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(follow);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        }
    }

    public Follow buscarPorId(Long id) {
        return conexion.getEntityManager().find(Follow.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

}
