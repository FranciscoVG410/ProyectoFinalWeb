/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import dominio.Chef;
import exception.PersistenciaException;

/**
 *
 * @author carli
 */
public interface IChefDAO {

    public void crearChef(Chef chef) throws PersistenciaException;

    public Chef buscarPorId(Long id) throws PersistenciaException;

    public Chef buscarPorCorreo(String correo) throws PersistenciaException;

    public Chef buscarPorTelefono(String telefono) throws PersistenciaException ;

}
