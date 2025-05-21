package DAOs;

import conexion.IConexionBD;
import dominio.Administra;
import exception.PersistenciaException;
import interfaces.IAdministraDAO;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class AdministraDAO implements IAdministraDAO {

    private IConexionBD conexion;

    public AdministraDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void guardar(Administra administra) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(administra);
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new PersistenciaException("Error general al guardar Administra", e);
        } finally {
            em.close();
        }
    }

    public Administra buscarPorId(Long id) {
        return conexion.getEntityManager().find(Administra.class, id);

    }
}
