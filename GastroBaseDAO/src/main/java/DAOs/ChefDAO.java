/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Chef;
import dominio.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author OMEN
 */
public class ChefDAO {
    
    private IConexionBD conexion;

    public ChefDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    public void crearUsuario(Chef usuario) {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = null;
        try {
            tx = em.getTransaction();
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

    public Chef buscarPorCorreo(String correo) {
        EntityManager em = conexion.getEntityManager();
        try {
            TypedQuery<Chef> query = em.createQuery(
                    "SELECT u FROM Chef u WHERE u.correo = :correo", Chef.class);
            query.setParameter("correo", correo);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
