/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.servlets;

import DAOs.UsuarioDAO;
import com.google.protobuf.TextFormat.ParseException;
import dominio.Usuario;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OMEN
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/registro"})
public class SignUpServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/views/SignUp.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener parámetros del formulario
        String correo = request.getParameter("email");
        String nombre = request.getParameter("first-name");
        String apellido = request.getParameter("last-name");
        String contrasenia = request.getParameter("password");
        String telefono = request.getParameter("phone");
        String fechaNacimientoStr = request.getParameter("dob");

        // Validación de campos
        Map<String, String> errores = validarCampos(correo, nombre, apellido, contrasenia, telefono, fechaNacimientoStr);

        if (!errores.isEmpty()) {
            request.setAttribute("errorMap", errores);
            mantenerValores(request, correo, nombre, apellido, telefono, fechaNacimientoStr);
            request.getRequestDispatcher("/views/SignUp.jsp").forward(request, response);
            return;
        }

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();

            // Verificar si el correo ya existe
            if (usuarioDAO.buscarPorCorreo(correo) != null) {
                errores.put("email", "Este correo ya está registrado");
                request.setAttribute("errorMap", errores);
                mantenerValores(request, correo, nombre, apellido, telefono, fechaNacimientoStr);
                request.getRequestDispatcher("/views/SignUp.jsp").forward(request, response);
                return;
            }

            // Convertir String a Calendar
            Calendar fechaNacimiento = convertirStringACalendar(fechaNacimientoStr);

            // Crear nuevo usuario
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setCorreo(correo);
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setApellido(apellido);
            nuevoUsuario.setContrasenia(contrasenia);
            nuevoUsuario.setTelefono(telefono);
            nuevoUsuario.setFechaNacimiento(fechaNacimiento);
            nuevoUsuario.setRol(Usuario.Rol.NORMAL); // Rol por defecto

            // Registrar usuario
            usuarioDAO.crearUsuario(nuevoUsuario);

            // Redirigir a login con mensaje de éxito
            request.getSession().setAttribute("registroExitoso", "¡Registro completado! Por favor inicia sesión");
            response.sendRedirect(request.getContextPath() + "/login");

        } catch (Exception e) {
            request.setAttribute("error", "Error en el servidor: " + e.getMessage());
            request.getRequestDispatcher("/views/SignUp.jsp").forward(request, response);
        }
    }

    private Map<String, String> validarCampos(String correo, String nombre, String apellido,
            String contrasenia, String telefono, String fechaNacimientoStr) {
        Map<String, String> errores = new HashMap<>();

        if (correo == null || correo.trim().isEmpty() || !correo.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            errores.put("email", "Ingrese un email válido");
        }

        if (nombre == null || nombre.trim().isEmpty()) {
            errores.put("first-name", "El nombre es requerido");
        }

        if (apellido == null || apellido.trim().isEmpty()) {
            errores.put("last-name", "El apellido es requerido");
        }

        if (contrasenia == null || contrasenia.length() < 6) {
            errores.put("password", "La contraseña debe tener al menos 6 caracteres");
        }

        if (telefono == null || !telefono.matches("^[0-9]{10,15}$")) {
            errores.put("phone", "Ingrese un teléfono válido (10-15 dígitos)");
        }

        if (fechaNacimientoStr == null || fechaNacimientoStr.trim().isEmpty()) {
            errores.put("dob", "La fecha de nacimiento es requerida");
        } else {
            try {
                Calendar fechaNacimiento = convertirStringACalendar(fechaNacimientoStr);
                Calendar hoyMenos18 = Calendar.getInstance();
                hoyMenos18.add(Calendar.YEAR, -18);

                if (fechaNacimiento.after(hoyMenos18)) {
                    errores.put("dob", "Debes ser mayor de 18 años");
                }
            } catch (Exception e) {
                errores.put("dob", "Fecha inválida");
            }
        }

        return errores;
    }

    private Calendar convertirStringACalendar(String fechaStr) throws ParseException, java.text.ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(fechaStr);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar;
    }

    private void mantenerValores(HttpServletRequest request, String correo, String nombre,
            String apellido, String telefono, String fechaNacimientoStr) {
        request.setAttribute("email", correo);
        request.setAttribute("first-name", nombre);
        request.setAttribute("last-name", apellido);
        request.setAttribute("phone", telefono);
        request.setAttribute("dob", fechaNacimientoStr);
    }
}
