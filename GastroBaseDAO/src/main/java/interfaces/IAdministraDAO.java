/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import dominio.Administra;
import exception.PersistenciaException;

/**
 *
 * @author carli
 */
public interface IAdministraDAO {

    public void guardar(Administra administra) throws PersistenciaException;

}
