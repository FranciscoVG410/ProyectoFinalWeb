package servlets;

import DAOs.RecetaDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import exception.PersistenciaException;
import interfaces.IRecetaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EliminarRecetaServlet", urlPatterns = {"/eliminarRecetaChef"})
public class EliminarRecetaChefServlet extends HttpServlet {

    private IRecetaDAO recetaDAO;

    @Override
    public void init() {
        IConexionBD conexion = new Conexion();
        this.recetaDAO = new RecetaDAO(conexion);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("idReceta");

            if (idParam == null || idParam.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de receta no proporcionado");
                return;
            }

            Long idReceta = Long.parseLong(idParam);
            recetaDAO.eliminarReceta(idReceta);  // Este método debe eliminar también las fotos asociadas

            // Redirige al servlet que muestra las recetas actualizadas
            response.sendRedirect(request.getContextPath() + "/misRecetasServlet");

        } catch (PersistenciaException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar la receta");
        }
    }
}
