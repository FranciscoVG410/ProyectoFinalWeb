package servlets;

import DAOs.UsuarioDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Chef;
import dominio.Usuario;
import dominio.Usuario.Rol;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        IConexionBD conexionBD = new Conexion();
        this.usuarioDAO = new UsuarioDAO(conexionBD);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("email");
        String contrasenia = request.getParameter("password");

        Usuario usuario = usuarioDAO.buscarPorCorreo(correo);

        if (usuario != null && usuario.getContrasenia().equals(contrasenia)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            if (usuario.getRol() == Rol.ADMIN) {
                session.setAttribute("admin", usuario);
            }
            if (usuario.getRol() == Rol.CHEF) {
                Chef chef = (Chef) usuario; // Realiza el casting
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String fechaFormateada = chef.getFechaNacimiento().format(formatter);
                session.setAttribute("fechaNacimiento", fechaFormateada);
            }

            // Redirigir según el rol
            switch (usuario.getRol()) {
                case ADMIN:
                    response.sendRedirect(request.getContextPath() + "/adminPanel");
                    break;
                case CHEF:
                    response.sendRedirect(request.getContextPath() + "/feedRecetas");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/login.jsp?error=rolDesconocido");
            }
        } else {
            // Falló el login
            request.setAttribute("error", "Correo o contraseña incorrectos");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
