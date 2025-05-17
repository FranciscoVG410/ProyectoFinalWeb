/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;


import dominio.Receta;
import java.util.List;
/**
 *
 * @author joseq
 */
public interface IRecetaDAO {
    void crearReceta(Receta receta);
    Receta obtenerRecetaPorId(Long id);
    List<Receta> obtenerTodas();
    void actualizarReceta(Receta receta);
    void eliminarReceta(Long id);
}
