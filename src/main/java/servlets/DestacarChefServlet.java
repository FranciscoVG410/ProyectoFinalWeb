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
@WebServlet("/destacarChef")
public class DestacarChefServlet extends HttpServlet {

    private IChefDAO chefDAO;
    private IAdministraDAO administraDAO;

    @Override
    public void init() {
        IConexionBD conexionBD = new Conexion();
        chefDAO = new ChefDAO(conexionBD);
        administraDAO = new AdministraDAO(conexionBD);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Object usuario = session.getAttribute("usuario");
            if (usuario == null || !(usuario instanceof Admin)) {
                response.sendRedirect("views/login.jsp");
                return;
            }
            Admin admin = (Admin) usuario;
            if (admin == null) {
                response.sendRedirect("views/login.jsp");
                return;
            }

            Long idChef = Long.parseLong(request.getParameter("idChef"));
            boolean destacar = Boolean.parseBoolean(request.getParameter("destacar"));

            Chef chef = chefDAO.buscarPorId(idChef);

            if (chef != null) {
                // Actualizar el estado "destacado" del chef
                chefDAO.actualizarDestacado(idChef, destacar);

                // Registrar acción administrativa
                Administra accion = new Administra();
                accion.setAdmin(admin);
                accion.setChef(chef);
                accion.setTipo(destacar ? Administra.Tipo.Destaca : Administra.Tipo.No_Destacar);
                administraDAO.guardar(accion);
            }

            response.sendRedirect(request.getContextPath() + "/adminPanel");

        } catch (PersistenciaException pe) {
            request.setAttribute("error", "Error de persistencia al actualizar usuario: " + pe.getMessage());
            request.getRequestDispatcher("views/error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error inesperado al actualizar usuario: " + e.getMessage());
            request.getRequestDispatcher("views/error.jsp").forward(request, response);
        }
    }
}
