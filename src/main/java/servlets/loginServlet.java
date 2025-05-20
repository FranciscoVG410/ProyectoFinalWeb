package servlets;

import DAOs.UsuarioDAO;
import dominio.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("email");
        String contrasenia = request.getParameter("password");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.buscarPorCorreo(correo);

        if (usuario != null && usuario.getContrasenia().equals(contrasenia)) {
            // Credenciales válidas
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            response.sendRedirect(request.getContextPath() + "/views/home.jsp");
        } else {
            // Credenciales inválidas
            request.setAttribute("error", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
