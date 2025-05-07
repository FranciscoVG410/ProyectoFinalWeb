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
public class Conexion {
    protected static EntityManagerFactory emf;
    
    static {
        try {
            emf = Persistence.createEntityManagerFactory("");
            System.out.println("EntityManagerFactory created successfully");
        } catch (Exception e) {
            System.err.println("Error al crear el EntityManagerFactory: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public static EntityManager getEntityManager() {
        if (emf == null) {
            try {
                emf = Persistence.createEntityManagerFactory("");
            } catch (Exception e) {
                throw new RuntimeException("Failed to initialize EntityManagerFactory", e);
            }
        }
        return emf.createEntityManager();
    }
    
    // Make this static
    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
