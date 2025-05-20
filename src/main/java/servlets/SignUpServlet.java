/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import DAOs.ChefDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Chef;
import dominio.Usuario;
import exception.PersistenciaException;
import interfaces.IChefDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

/**
 *
 * @author carli
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class SignUpServlet extends HttpServlet {

    private IChefDAO chefDAO;

    @Override
    public void init() throws ServletException {
        IConexionBD conexionBD = new Conexion();
        this.chefDAO = new ChefDAO(conexionBD);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Leer campos del formulario
        String nombre = request.getParameter("first-name");
        String apellido = request.getParameter("last-name");
        String correo = request.getParameter("email");
        String contrasena = request.getParameter("password");
        String telefono = request.getParameter("phone");
        String pais = request.getParameter("country");

        // Validar campos obligatorios
        if (nombre == null || nombre.trim().isEmpty()
                || apellido == null || apellido.trim().isEmpty()
                || correo == null || correo.trim().isEmpty()
                || contrasena == null || contrasena.trim().isEmpty()
                || telefono == null || telefono.trim().isEmpty()
                || pais == null || pais.trim().isEmpty()) {

            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }
// Fecha de nacimiento

        // Validar correo con regex simple
        if (!correo.matches("^[\\w\\.-]+@[\\w\\.-]+\\.\\w{2,}$")) {
            request.setAttribute("error", "Correo electrónico no válido.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        // Validar teléfono básico (solo dígitos y mínimo 7 caracteres)
        if (!telefono.matches("\\d{7,}")) {
            request.setAttribute("error", "Teléfono no válido. Debe contener al menos 7 dígitos.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        // Procesar foto perfil (archivo)
        Part filePart = request.getPart("profile-photo");
        String fotoUrl = null;

        if (filePart != null && filePart.getSize() > 0) {
            String contentType = filePart.getContentType();
            if (!contentType.startsWith("image/")) {
                request.setAttribute("error", "El archivo debe ser una imagen válida.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

            // Nombre único para la imagen
            String fileName = System.currentTimeMillis() + "-" + filePart.getSubmittedFileName();

            // Carpeta uploads dentro del contexto web
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Guardar archivo físicamente
            filePart.write(uploadPath + File.separator + fileName);

            // URL relativa para guardar en BD
            fotoUrl = "uploads/" + fileName;
        }

        // Verificar si correo ya existe
        try {
            Chef existente = chefDAO.buscarPorCorreo(correo);
            if (existente != null) {
                request.setAttribute("error", "El correo ya está registrado.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }
        } catch (PersistenciaException ex) {
            // si no existe, buscarPorCorreo puede lanzar excepción
            if (!ex.getMessage().toLowerCase().contains("noresultexception")) {
                request.setAttribute("error", "Error al validar correo: " + ex.getMessage());
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }
        }

        try {
            Chef existenteTel = chefDAO.buscarPorTelefono(telefono);
            if (existenteTel != null) {
                request.setAttribute("error", "El número de teléfono ya está registrado.");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }
        } catch (PersistenciaException ex) {
            if (!ex.getMessage().toLowerCase().contains("noresultexception")) {
                request.setAttribute("error", "Error al validar teléfono: " + ex.getMessage());
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                return;
            }

        }

        // Crear objeto Chef y guardar
        Chef chef = new Chef();
        chef.setNombre(nombre.trim());
        chef.setApellido(apellido.trim());
        chef.setCorreo(correo.trim());
        chef.setContrasenia(contrasena.trim());
        chef.setTelefono(telefono.trim());
        chef.setFechaNacimiento(LocalDate.MIN);
        chef.setPais(pais.trim());
        chef.setUrlAvatar(fotoUrl);
        chef.setRol(Usuario.Rol.CHEF);

        String fechaNacimientoStr = request.getParameter("dob");
        if (fechaNacimientoStr != null && !fechaNacimientoStr.isEmpty()) {
            try {
                LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoStr);
                chef.setFechaNacimiento(fechaNacimiento);
            } catch (DateTimeParseException e) {
                // Puedes registrar el error o redirigir con un mensaje
                e.printStackTrace();
            }
        }
        try {
            chefDAO.crearChef(chef);
            request.setAttribute("mensaje", "Registro exitoso, por favor inicia sesión.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        } catch (PersistenciaException e) {
            request.setAttribute("error", "Error al registrar: " + e.getMessage());
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
