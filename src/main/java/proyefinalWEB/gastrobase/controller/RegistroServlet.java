/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.controller;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import proyefinalWEB.gastrobase.model.Usuario;
import proyefinalWEB.gastrobase.model.ControlUsuario;

/**
 *
 * @author joseq
 */
@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String nombre = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String tipo = request.getParameter("tipoUsuario");

        Usuario nuevo = new Usuario(usuario, password, nombre, correo, tipo);
        ControlUsuario.agregarUsuario(nuevo);

        if (usuario.equals("admin") && password.equals("admin123")) {
            response.sendRedirect("admin.jsp");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<p>Usuario registrado exitosamente. <a href='views/signup.jsp'>Volver</a></p>");
        }
    }
}
