/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import DAOs.RecetaDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Chef;
import dominio.Receta;
import exception.PersistenciaException;
import interfaces.IRecetaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author carli
 */
@WebServlet(name = "misRecetasServlet", urlPatterns = {"/misRecetasServlet"})
public class MisRecetasServlet extends HttpServlet {
 private IRecetaDAO recetaDAO;

    @Override
    public void init() {
        IConexionBD conexion = new Conexion();
        this.recetaDAO = new RecetaDAO(conexion);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Chef chef = (Chef) session.getAttribute("usuario"); // debe ser instancia de Chef

        if (chef == null) {
            response.sendRedirect("views/login.jsp");
            return;
        }

        try {
            List<Receta> recetas = recetaDAO.obtenerRecetasPorChef(chef);
            request.setAttribute("misRecetas", recetas);
            request.getRequestDispatcher("/views/MyProfile.jsp").forward(request, response);
        } catch (PersistenciaException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener recetas.");
        }
    }
}