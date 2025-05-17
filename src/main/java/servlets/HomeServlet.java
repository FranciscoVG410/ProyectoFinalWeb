package servlets;

import DAOs.RecetaDAO;
import DAOs.FotoRecetaDAO;
import dominio.Receta;
import dominio.FotoReceta;
import interfaces.IRecetaDAO;
import interfaces.IFotoRecetaDAO;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Home", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    private final IRecetaDAO recetaDAO = new RecetaDAO();
    private final IFotoRecetaDAO fotoRecetaDAO = new FotoRecetaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Receta> recetas = recetaDAO.obtenerTodas();

        // Para cada receta, obtener hasta 5 fotos desde la base de datos
        for (Receta receta : recetas) {
            List<FotoReceta> fotos = fotoRecetaDAO.obtenerPorRecetaId(Long.valueOf(String.valueOf(receta.getId())));
            if (fotos != null && !fotos.isEmpty()) {
                // Limitamos a 5 fotos
                receta.setFotos(fotos.stream().limit(5).collect(Collectors.toList()));
            }
        }

        request.setAttribute("recetas", recetas);
        request.getRequestDispatcher("/WEB-INF/views/Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
