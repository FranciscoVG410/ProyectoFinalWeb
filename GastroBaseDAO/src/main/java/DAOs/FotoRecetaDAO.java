package DAOs;

import conexion.Conexion;
import dominio.FotoReceta;
import interfaces.IFotoRecetaDAO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class FotoRecetaDAO implements IFotoRecetaDAO {

     EntityManager em = Conexion.getEntityManager();

    @Override
    public void guardar(FotoReceta fotoReceta) {
        EntityManager em = Conexion.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(fotoReceta);
            em.getTransaction().commit();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    @Override
    public List<FotoReceta> obtenerPorRecetaId(Long recetaId) {
        EntityManager em = Conexion.getEntityManager();
        try {
            return em.createQuery("SELECT f FROM FotoReceta f WHERE f.receta.id = :recetaId", FotoReceta.class)
                     .setParameter("recetaId", recetaId)
                     .getResultList();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }
}
