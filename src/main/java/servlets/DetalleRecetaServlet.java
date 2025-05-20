package servlets;

import DAOs.RecetaDAO;
import DAOs.FotoRecetaDAO;
import dominio.Receta;
import dominio.FotoReceta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/detalle-receta")
public class DetalleRecetaServlet extends HttpServlet {

    private RecetaDAO recetaDAO;
    private FotoRecetaDAO fotoRecetaDAO;

    @Override
    public void init() throws ServletException {
        recetaDAO = new RecetaDAO();
        fotoRecetaDAO = new FotoRecetaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("home.jsp");
            return;
        }

        try {
            Long idReceta = Long.parseLong(idParam);
            Receta receta = recetaDAO.buscarPorId(idReceta);

            if (receta == null) {
                response.sendRedirect("home.jsp");
                return;
            }

            List<FotoReceta> fotos = fotoRecetaDAO.obtenerFotosPorReceta(idReceta);

            request.setAttribute("receta", receta);
            request.setAttribute("fotos", fotos);
            request.getRequestDispatcher("WEB-INF/views/detalleReceta.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("home.jsp");
        }
    }
}
