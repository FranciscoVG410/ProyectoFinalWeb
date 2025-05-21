/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import dominio.Chef;
import dominio.Receta;
import exception.PersistenciaException;
import java.util.List;

/**
 *
 * @author carli
 */
public interface IRecetaDAO {

    public void crearReceta(Receta receta) throws PersistenciaException;

    public Receta buscarPorId(Long id) throws PersistenciaException;

    public List<Receta> obtenerRecetasPorChef(Chef chef) throws PersistenciaException;

    public void eliminarReceta(Long id) throws PersistenciaException;

    public void editarReceta(Receta recetaEditada) throws PersistenciaException;
    
    public List<Receta> obtenerTodasLasRecetas();
}
