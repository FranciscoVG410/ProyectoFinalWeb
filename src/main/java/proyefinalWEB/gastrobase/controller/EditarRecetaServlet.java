package proyefinalWEB.gastrobase.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import proyefinalWEB.gastrobase.model.Receta;
import proyefinalWEB.gastrobase.model.ControlReceta;

@WebServlet("/editar-receta")
public class EditarRecetaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Receta receta = ControlReceta.obtenerTodas().get(id);

            request.setAttribute("receta", receta);
            request.setAttribute("id", id);
            request.getRequestDispatcher("views/editar-receta.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("views/error.jsp?codigo=404");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Receta r = new Receta(
            request.getParameter("nombre"),
            request.getParameter("descripcion"),
            request.getParameter("ingredientes"),
            request.getParameter("pasos"),
            request.getParameter("categoria"),
            Integer.parseInt(request.getParameter("tiempo")),
            request.getParameter("imagen")
        );

        ControlReceta.obtenerTodas().set(id, r);
        response.sendRedirect("ver-receta?id=" + id);
    }
}
