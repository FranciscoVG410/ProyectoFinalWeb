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

@WebServlet("/feedRecetas")
public class FeedRecetaServlet extends HttpServlet {

    private IRecetaDAO recetaDAO;
    private IChefDAO chefDAO;

    @Override
    public void init() throws ServletException {
        IConexionBD conexionBD = new Conexion();
        this.recetaDAO = new RecetaDAO(conexionBD);
        this.chefDAO = new ChefDAO(conexionBD);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            List<Receta> recetas = recetaDAO.obtenerTodasLasRecetas();
            List<Chef> chefsDestacados = chefDAO.obtenerChefsDestacados(); // Método que filtra por destacado = true

            request.setAttribute("todasLasRecetas", recetas);
            request.setAttribute("chefsDestacados", chefsDestacados);

            request.getRequestDispatcher("/views/Home.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar recetas.");
        }
    }
}
