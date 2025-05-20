/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package main;

import DAOs.UsuarioDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Admin;
import dominio.Chef;
import dominio.Usuario;
import interfaces.IUsuarioDAO;
import java.time.LocalDate;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author OMEN
 */
public class GastroBaseDAO {

    public static void main(String[] args) {
        IConexionBD conexionBD= new Conexion();
        IUsuarioDAO usuario= new UsuarioDAO(conexionBD);
        
          Admin admin= new Admin();
          admin.setCorreo("admin@admin.com");
          admin.setRol(Usuario.Rol.ADMIN);
          admin.setContrasenia("papitafrita1");
          
          usuario.crearUsuario(admin);
    }
}
