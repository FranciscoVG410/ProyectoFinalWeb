package servlets;

import dominio.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("usuario") != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            // Puedes agregar atributos adicionales si necesitas
            request.setAttribute("nombreCompleto", usuario.getNombreCompleto());
            request.setAttribute("correo", usuario.getCorreo());

            // Redirige a la vista de perfil
            request.getRequestDispatcher("/views/perfil.jsp").forward(request, response);
        } else {
            // Si no hay sesión válida, redirige a login
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        }
    }
}
