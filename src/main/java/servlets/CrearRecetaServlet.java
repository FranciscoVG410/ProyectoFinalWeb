package servlets;

import DAOs.RecetaDAO;
import conexion.Conexion;
import conexion.IConexionBD;
import dominio.Chef;
import dominio.FotoReceta;
import dominio.Receta;
import exception.PersistenciaException;
import interfaces.IRecetaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Collection;

@WebServlet(name = "compartirReceta", urlPatterns = {"/compartirReceta"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB antes de escribir a disco
        maxFileSize = 1024 * 1024 * 10, // 10MB por archivo
        maxRequestSize = 1024 * 1024 * 50 // 50MB total
)
public class CrearRecetaServlet extends HttpServlet {

    private IRecetaDAO recetaDAO;

    @Override
    public void init() {
        IConexionBD conexion = new Conexion(); // asegúrate de tener esta clase bien implementada
        this.recetaDAO = new RecetaDAO(conexion);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1. Obtener campos del formulario
            String titulo = request.getParameter("titulo");
            int tiempo = Integer.parseInt(request.getParameter("tiempo"));
            int personas = Integer.parseInt(request.getParameter("personas"));
            String complejidad = request.getParameter("complejidad");
            String ingredientes = request.getParameter("ingredientes");
            String instrucciones = request.getParameter("instrucciones");

            // 2. Obtener chef desde la sesión
            HttpSession session = request.getSession();
            Chef chef = (Chef) session.getAttribute("usuario"); // Asegúrate de que esté bien guardado

            // 3. Crear objeto Receta
            Receta receta = new Receta();
            receta.setNombre(titulo);
            receta.setTiempo(tiempo);
            receta.setNumPersonas(personas);
            receta.setComplejidad(complejidad);
            receta.setIngredientes(ingredientes);
            receta.setProceso(instrucciones);
            receta.setChef(chef);

            // 4. Guardar imágenes y agregar FotoReceta
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            Collection<Part> partes = request.getParts();
            int contadorFotos = 0;
            for (Part part : partes) {
                if ("fotos".equals(part.getName()) && part.getSize() > 0) {
                    if (contadorFotos >= 5) {
                        break;
                    }

                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    String rutaRelativa = "uploads/" + fileName;
                    part.write(uploadPath + File.separator + fileName);

                    FotoReceta foto = new FotoReceta();
                    foto.setUrl(rutaRelativa);
                    receta.addFoto(foto);
                    contadorFotos++;
                }
            }

            // 5. Guardar receta en la base de datos
            recetaDAO.crearReceta(receta);

            // 6. Redirigir
            response.sendRedirect("views/MyProfile.jsp");

        } catch (PersistenciaException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al guardar la receta.");
        }
    }
}
