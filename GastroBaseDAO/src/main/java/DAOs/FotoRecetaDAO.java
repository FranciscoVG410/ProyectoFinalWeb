/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.FotoReceta;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author joseq
 */
public class FotoRecetaDAO {

    private IConexionBD conexion;

    public FotoRecetaDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crear(FotoReceta foto) {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(foto);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        }
    }

    public FotoReceta buscarPorId(Long id) {
        return conexion.getEntityManager().find(FotoReceta.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

}
