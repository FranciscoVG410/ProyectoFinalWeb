/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package main;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author OMEN
 */
public class GastroBaseDAO {

    public static void main(String[] args) {
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("GastroBase");
            EntityManager em = emf.createEntityManager();
            System.out.println("Database generated successfully!");
            em.close();
            emf.close();
        } catch (Exception e) {
            System.out.println("Error generating database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
