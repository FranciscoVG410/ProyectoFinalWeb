/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import DAOs.RecetaDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Receta;
import interfaces.IRecetaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/feedRecetas")
public class FeedRecetaServlet extends HttpServlet {

    private IRecetaDAO recetaDAO;

    @Override
    public void init() throws ServletException {
        IConexionBD conexionBD = new Conexion();
        this.recetaDAO = new RecetaDAO(conexionBD);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Receta> recetas = recetaDAO.obtenerTodasLasRecetas();

            System.out.println("RECETAS OBTENIDAS: " + recetas.size());

            for (Receta r : recetas) {
                System.out.println(">> " + r.getNombre() + " | Autor: " + (r.getChef()!= null ? r.getChef().getNombre() : "SIN AUTOR"));
            }

            request.setAttribute("todasLasRecetas", recetas);
            request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar recetas.");
        }
    }
}
