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

/**
 *
 * @author joseq
 */
@WebServlet("/eliminar-receta")
public class EliminarRecetaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ControlReceta.obtenerTodas().remove(id);
            response.sendRedirect("views/recetas.jsp");
        } catch (Exception e) {
            response.sendRedirect("views/error.jsp?codigo=404");
        }
    }
}
