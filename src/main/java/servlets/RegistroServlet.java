package servlets;

import DAOs.UsuarioDAO;
import dominio.Usuario;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/registro"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String nombre = request.getParameter("first-name");
        String apellido = request.getParameter("last-name");
        String password = request.getParameter("password");
        String telefono = request.getParameter("phone");
        String fechaNacimiento = request.getParameter("dob");

        Usuario nuevo = new Usuario();
        nuevo.setCorreo(email);
        nuevo.setNombre(nombre);
        nuevo.setApellido(apellido);
        nuevo.setContrasenia(password);
        nuevo.setTelefono(telefono);
        nuevo.setRol(Usuario.Rol.NORMAL);

        try {
            Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimiento);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fecha);
            nuevo.setFechaNacimiento(calendar);
        } catch (Exception e) {
            request.setAttribute("error", "Fecha de nacimiento inválida.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        // Validar si ya existe el correo
        if (usuarioDAO.buscarPorCorreo(email) != null) {
            request.setAttribute("error", "Este correo ya está registrado.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        usuarioDAO.crearUsuario(nuevo);

        response.sendRedirect(request.getContextPath() + "/views/login.jsp");
    }
}
