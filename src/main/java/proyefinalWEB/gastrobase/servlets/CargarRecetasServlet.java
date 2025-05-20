/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.servlets;

import dominio.Receta;
import dominio.Usuario;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OMEN
 */
@WebServlet("/cargarRecetas")
public class CargarRecetasServlet extends HttpServlet {

    @PersistenceContext(unitName = "GastroBasePU")
    private EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Obtener todas las recetas con sus relaciones
            TypedQuery<Receta> query = em.createQuery(
                    "SELECT DISTINCT r FROM Receta r "
                    + "LEFT JOIN FETCH r.comentarios "
                    + "LEFT JOIN FETCH r.favoritos "
                    + "LEFT JOIN FETCH r.fotos "
                    + "LEFT JOIN FETCH r.usuario "
                    + "ORDER BY r.fechaPublicacion DESC", Receta.class);

            List<Receta> recetas = query.getResultList();

            // Obtener chefs destacados (usuarios con más recetas)
            TypedQuery<Usuario> chefsQuery = em.createQuery(
                    "SELECT u FROM Usuario u "
                    + "LEFT JOIN FETCH u.recetas "
                    + "ORDER BY SIZE(u.recetas) DESC", Usuario.class)
                    .setMaxResults(2);

            List<Usuario> chefsDestacados = chefsQuery.getResultList();

            request.setAttribute("recetas", recetas);
            request.setAttribute("chefsDestacados", chefsDestacados);

            request.getRequestDispatcher("/views/home.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(CargarRecetasServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("error", "Error al cargar las recetas");
            request.getRequestDispatcher("/views/error.jsp").forward(request, response);
        }
    }
}
