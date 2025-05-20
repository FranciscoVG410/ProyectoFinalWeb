/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

/**
 *
 * @author OMEN
 */
import DAOs.UsuarioDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            IConexionBD conexion = new Conexion();
            UsuarioDAO usuarioDAO = new UsuarioDAO(conexion);
            Usuario usuario = usuarioDAO.buscarPorCorreo(email);

            if (usuario == null || !usuario.getContrasenia().equals(password)) {
                request.setAttribute("error", "Email o contraseña incorrectos");
                request.setAttribute("email", email); // Mantener el email ingresado
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

            // Crear sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            // Redirigir al home
            response.sendRedirect(request.getContextPath() + "/views/Home.jsp");

        } catch (Exception e) {
            request.setAttribute("error", "Error al iniciar sesión: " + e.getMessage());
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
