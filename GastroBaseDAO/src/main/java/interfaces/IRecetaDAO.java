/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import dominio.Receta;
import exception.PersistenciaException;

/**
 *
 * @author carli
 */
public interface IRecetaDAO {
    public void crearReceta(Receta receta) throws PersistenciaException;
    public Receta buscarPorId(Long id) throws PersistenciaException ;
}
