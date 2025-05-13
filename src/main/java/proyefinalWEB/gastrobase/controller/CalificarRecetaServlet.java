/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import proyefinalWEB.gastrobase.model.ControlReceta;
import proyefinalWEB.gastrobase.model.Receta;

/**
 *
 * @author joseq
 */
@WebServlet("/calificar-receta")
public class CalificarRecetaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        int estrellas = Integer.parseInt(request.getParameter("estrellas"));

        HttpSession session = request.getSession();
        Set<Integer> recetasVotadas = (Set<Integer>) session.getAttribute("recetasVotadas");

        if (recetasVotadas == null) {
            recetasVotadas = new HashSet<>();
        }

        if (!recetasVotadas.contains(id)) {
            Receta receta = ControlReceta.obtenerTodas().get(id);
            receta.agregarCalificacion(estrellas);
            recetasVotadas.add(id);
            session.setAttribute("recetasVotadas", recetasVotadas);
        }

        response.sendRedirect("ver-receta?id=" + id);
    }

}
