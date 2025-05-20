/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Favorito;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author joseq
 */
public class FavoritoDAO {

    private IConexionBD conexion;

    public FavoritoDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crear(Favorito favorito) {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(favorito);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        }
    }

    public Favorito buscarPorId(Long id) {
        return conexion.getEntityManager().find(Favorito.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

}
