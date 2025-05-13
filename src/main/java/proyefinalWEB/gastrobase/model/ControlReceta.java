/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joseq
 */
public class ControlReceta {

    private static List<Receta> recetas = new ArrayList<>();

    public static void agregarReceta(Receta r) {
        recetas.add(r);
    }

    public static List<Receta> obtenerTodas() {
        return recetas;
    }

}
