/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package conexion;

import javax.persistence.EntityManager;

/**
 *
 * @author carli
 */
public interface IConexionBD {

    public EntityManager getEntityManager();

    public void closeEntityManagerFactory();

}
