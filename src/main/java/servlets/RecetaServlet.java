package servlets;

import DAOs.RecetaDAO;
import DAOs.FotoRecetaDAO;
import dominio.FotoReceta;
import dominio.Receta;
import interfaces.IRecetaDAO;
import interfaces.IFotoRecetaDAO;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "RecetaServlet", urlPatterns = {"/recetas"})
@MultipartConfig
public class RecetaServlet extends HttpServlet {

    private final IRecetaDAO recetaDAO = new RecetaDAO();
    private final IFotoRecetaDAO fotoDAO = new FotoRecetaDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");
        String tiempoStr = request.getParameter("tiempo");
        String personasStr = request.getParameter("personas");
        String complejidad = request.getParameter("complejidad");
        String ingredientes = request.getParameter("ingredientes");
        String instrucciones = request.getParameter("instrucciones");

        int tiempo = 0;
        int personas = 0;
        try {
            tiempo = Integer.parseInt(tiempoStr);
            personas = Integer.parseInt(personasStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        Receta receta = new Receta();
        receta.setTitulo(titulo);
        receta.setTiempo(tiempo);
        receta.setPersonas(personas);
        receta.setComplejidad(complejidad);
        receta.setIngredientes(ingredientes);
        receta.setInstrucciones(instrucciones);

        recetaDAO.crearReceta(receta);

        List<FotoReceta> fotos = new ArrayList<>();
        for (Part part : request.getParts()) {
            if ("fotos".equals(part.getName()) && part.getSize() > 0) {
                try (InputStream inputStream = part.getInputStream()) {
                    byte[] imageBytes = inputStream.readAllBytes();
                    String base64 = Base64.getEncoder().encodeToString(imageBytes);

                    FotoReceta foto = new FotoReceta();
                    foto.setReceta(receta);
                    foto.setImagenBase64(base64);

                    fotoDAO.guardar(foto);
                    fotos.add(foto);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        }

        response.sendRedirect("home");
    }
}
