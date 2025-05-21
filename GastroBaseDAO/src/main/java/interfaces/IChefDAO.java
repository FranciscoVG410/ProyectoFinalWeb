/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import dominio.Chef;
import exception.PersistenciaException;
import java.util.List;

/**
 *
 * @author carli
 */
public interface IChefDAO {

    public void crearChef(Chef chef) throws PersistenciaException;

    public Chef buscarPorId(Long id) throws PersistenciaException;

    public Chef buscarPorCorreo(String correo) throws PersistenciaException;

    public Chef buscarPorTelefono(String telefono) throws PersistenciaException;

    public List<Chef> obtenerTodosLosChefs();

    public void eliminarPorId(Long idChef) throws PersistenciaException;

    public void actualizarDestacado(Long idChef, boolean destacar) throws PersistenciaException;

    public List<Chef> obtenerChefsDestacados();

}
