package DAOs;

import conexion.Conexion;
import dominio.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class UsuarioDAO {

    private EntityManager em;

    public UsuarioDAO() {
        this.em = Conexion.getEntityManager();
    }

    /**
     * Guarda un nuevo usuario en la base de datos.
     *
     * @param usuario objeto Usuario a guardar
     */
    public void guardar(Usuario usuario) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(usuario);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw e;
        }
    }

    // UsuarioDAO.java
    public void crearUsuario(Usuario usuario) {
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(usuario);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw e;
        }
    }

    /**
     * Busca un usuario por su correo electrónico.
     *
     * @param correo correo del usuario
     * @return objeto Usuario o null si no existe
     */
    public Usuario buscarPorCorreo(String correo) {
        try {
            TypedQuery<Usuario> query = em.createQuery(
                    "SELECT u FROM Usuario u WHERE u.correo = :correo", Usuario.class);
            query.setParameter("correo", correo);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    /**
     * Cierra el EntityManager (opcional si se gestiona en un pool).
     */
    public void cerrar() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
