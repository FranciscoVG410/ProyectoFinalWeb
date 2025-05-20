package DAOs;

import conexion.IConexionBD;
import dominio.Administra;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class AdministraDAO {

    private IConexionBD conexion;

    public AdministraDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crear(Administra administra) {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(administra);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        }
    }

    public Administra buscarPorId(Long id) {
        return conexion.getEntityManager().find(Administra.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
