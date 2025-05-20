/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author OMEN
 */
public class Conexion implements IConexionBD {
   
    private EntityManagerFactory entityManagerFactory;

    public Conexion() {
        try {
            this.entityManagerFactory = Persistence.createEntityManagerFactory("ChazzBoutique");
        } catch (Exception e) {
            System.err.println("Error al inicializar el EntityManagerFactory: " + e.getMessage());
            e.printStackTrace();
        }
    }

   
    @Override
    public EntityManager getEntityManager() {
        if (entityManagerFactory == null) {
            throw new IllegalStateException("EntityManagerFactory no esta inicializado.");
        }
        return entityManagerFactory.createEntityManager();
    }

    @Override
    public void closeEntityManagerFactory() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}
