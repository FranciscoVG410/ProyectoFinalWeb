package servlets;

import DAOs.ChefDAO;
import DAOs.RecetaDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Chef;
import dominio.Receta;
import interfaces.IChefDAO;
import interfaces.IRecetaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminPanel")
public class AdminPanelServlet extends HttpServlet {

    private IRecetaDAO recetaDAO;
    private IChefDAO chefDAO;

    @Override
    public void init() throws ServletException {
        IConexionBD conexion = new Conexion();
        this.recetaDAO = new RecetaDAO(conexion);
        this.chefDAO = new ChefDAO(conexion);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Receta> recetas = recetaDAO.obtenerTodasLasRecetas();
            List<Chef> chefs = chefDAO.obtenerTodosLosChefs();

            System.out.println("Recetas obtenidas: " + recetas.size());
            System.out.println("Chefs obtenidos: " + chefs.size());

            for (Chef c : chefs) {
                System.out.println("Chef: " + c.getNombre() + " - Recetas: " + (c.getRecetas() != null ? c.getRecetas().size() : "null"));
            }

            request.setAttribute("recetas", recetas);
            request.setAttribute("chefs", chefs);
            request.getRequestDispatcher("/views/AdminPanel.jsp").forward(request, response);


        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar datos del panel.");
        }
    }
}
