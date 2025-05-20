/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Comentario;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author joseq
 */
public class ComentarioDAO {

    private IConexionBD conexion;

    public ComentarioDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crear(Comentario comentario) {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(comentario);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        }
    }

    public Comentario buscarPorId(Long id) {
        return conexion.getEntityManager().find(Comentario.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
