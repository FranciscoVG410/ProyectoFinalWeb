/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import proyefinalWEB.gastrobase.model.ControlReceta;
import proyefinalWEB.gastrobase.model.Receta;

/**
 *
 * @author joseq
 */
@WebServlet("/guardar-receta")
public class GuardarRecetaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String ingredientes = request.getParameter("ingredientes");
        String pasos = request.getParameter("pasos");
        String categoria = request.getParameter("categoria");
        int tiempo = Integer.parseInt(request.getParameter("tiempo"));
        String imagen = request.getParameter("imagen");

        Receta nueva = new Receta(nombre, descripcion, ingredientes, pasos, categoria, tiempo, imagen);
        ControlReceta.agregarReceta(nueva);

        response.sendRedirect("views/recetas.jsp");
    }

}
