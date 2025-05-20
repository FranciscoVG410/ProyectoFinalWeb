/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package main;

import DAOs.UsuarioDAO;
import conexion.Conexion;
import conexion.IConexionBD;
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
        
          Chef chef= new Chef();
          chef.setNombre("carlitos");
          chef.setCorreo("carlitos@gmail.com");
          chef.setRol(Usuario.Rol.CHEF);
          chef.setApellido("rios");
          chef.setContrasenia("123");
          chef.setPais("Mexico");
          chef.setTelefono("6683200668");
          chef.setFechaNacimiento(LocalDate.of(2002, 12, 7));
          
          usuario.crearUsuario(chef);
    }
}
