package DAOs;

import conexion.Conexion;
import dominio.Receta;
import interfaces.IRecetaDAO;
import java.util.List;
import javax.persistence.EntityManager;

public class RecetaDAO implements IRecetaDAO {

    @Override
    public void crearReceta(Receta receta) {
        EntityManager em = Conexion.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(receta);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public Receta obtenerRecetaPorId(Long id) {
        EntityManager em = Conexion.getEntityManager();
        try {
            return em.find(Receta.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Receta> obtenerTodas() {
        EntityManager em = Conexion.getEntityManager();
        try {
            return em.createQuery("SELECT r FROM Receta r", Receta.class).getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public void actualizarReceta(Receta receta) {
        EntityManager em = Conexion.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(receta);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void eliminarReceta(Long id) {
        EntityManager em = Conexion.getEntityManager();
        try {
            Receta receta = em.find(Receta.class, id);
            if (receta != null) {
                em.getTransaction().begin();
                em.remove(receta);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}
