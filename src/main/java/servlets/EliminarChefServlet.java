/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import DAOs.AdministraDAO;
import DAOs.ChefDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Admin;
import dominio.Administra;
import dominio.Chef;
import exception.PersistenciaException;
import interfaces.IAdministraDAO;
import interfaces.IChefDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author carli
 */
@WebServlet("/eliminarChef")
public class EliminarChefServlet extends HttpServlet {

    private IChefDAO chefDAO;
    private IAdministraDAO administraDAO;

    @Override
    public void init() {
        IConexionBD conexion = new Conexion();
        chefDAO = new ChefDAO(conexion);
        administraDAO = new AdministraDAO(conexion);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Admin admin = (Admin) session.getAttribute("admin");

            if (admin == null) {
                response.sendRedirect("views/login.jsp");
                return;
            }

            Long idChef = Long.parseLong(request.getParameter("idChef"));
            Chef chef = chefDAO.buscarPorId(idChef);

            if (chef != null) {
                // Registrar acción administrativa
                Administra accion = new Administra();
                accion.setAdmin(admin);
                accion.setChef(chef);
                accion.setTipo(Administra.Tipo.Elimina);
                administraDAO.guardar(accion);

                // Eliminar al chef
                chefDAO.eliminarPorId(idChef);
            }

            response.sendRedirect(request.getContextPath() + "/adminPanel");

        } catch (PersistenciaException pe) {
            request.setAttribute("error", "Error de persistencia al eliminar usuario: " + pe.getMessage());
            request.getRequestDispatcher("views/error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error inesperado al eliminar usuario: " + e.getMessage());
            request.getRequestDispatcher("views/error.jsp").forward(request, response);
        }
    }
}
