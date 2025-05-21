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


@WebServlet(name = "EditarRecetaServlet", urlPatterns = {"/editarReceta"})
public class EditarRecetaServlet extends HttpServlet {

    private IRecetaDAO recetaDAO;

    @Override
    public void init() throws ServletException {
        IConexionBD conexion = new Conexion();
        recetaDAO = new RecetaDAO(conexion);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener los parámetros del formulario
            Long idReceta = Long.parseLong(request.getParameter("idReceta"));
            String titulo = request.getParameter("titulo");
            int tiempo = Integer.parseInt(request.getParameter("tiempo"));
            int personas = Integer.parseInt(request.getParameter("personas"));
            String complejidad = request.getParameter("complejidad");
            String ingredientes = request.getParameter("ingredientes");
            String instrucciones = request.getParameter("instrucciones");

              // Mostrar los valores recibidos para debug
            System.out.println("--------- Datos recibidos ---------");
            System.out.println("ID: " + idReceta);
            System.out.println("Título: " + titulo);
            System.out.println("Tiempo: " + tiempo);
            System.out.println("Personas: " + personas);
            System.out.println("Complejidad: " + complejidad);
            System.out.println("Ingredientes: " + ingredientes);
            System.out.println("Instrucciones: " + instrucciones);
            System.out.println("-----------------------------------");

            
            
            
            // Crear la receta actualizada
            Receta recetaActualizada = new Receta();
            recetaActualizada.setIdReceta(idReceta);
            recetaActualizada.setNombre(titulo);
            recetaActualizada.setTiempo(tiempo);
            recetaActualizada.setNumPersonas(personas);
            recetaActualizada.setComplejidad(complejidad);
            recetaActualizada.setIngredientes(ingredientes);
            recetaActualizada.setProceso(instrucciones);

            // Actualizar en la base de datos
            recetaDAO.editarReceta(recetaActualizada);

            // Redirigir al perfil
            response.sendRedirect(request.getContextPath() + "/misRecetasServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error al actualizar la receta.");
        }
    }
}