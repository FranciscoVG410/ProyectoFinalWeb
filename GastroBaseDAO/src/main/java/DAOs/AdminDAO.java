package DAOs;

import conexion.IConexionBD;
import dominio.Admin;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class AdminDAO {

    private IConexionBD conexion;

    public AdminDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

   

    public Admin buscarPorId(Long id) {
        return conexion.getEntityManager().find(Admin.class, id);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
