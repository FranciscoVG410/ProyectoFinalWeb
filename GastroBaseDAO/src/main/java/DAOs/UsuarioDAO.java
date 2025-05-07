/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.Conexion;
import dominio.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

/**
 *
 * @author OMEN
 */
public class UsuarioDAO {
    private EntityManager em;
    private Conexion conexion;

    public UsuarioDAO() {
        this.conexion = new Conexion();
        this.em = conexion.getEntityManager();
    }

    public void crearUsuario(Usuario usuario) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            em.persist(usuario);
            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }
}
