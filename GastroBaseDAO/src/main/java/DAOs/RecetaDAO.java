/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import conexion.IConexionBD;
import dominio.Chef;
import dominio.FotoReceta;
import dominio.Receta;
import exception.PersistenciaException;
import interfaces.IRecetaDAO;
import java.util.Collections;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author carli
 */
public class RecetaDAO implements IRecetaDAO {

    private IConexionBD conexion;

    public RecetaDAO(IConexionBD conexion) {
        this.conexion = conexion;
    }

    @Override
    public void crearReceta(Receta receta) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(receta);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new PersistenciaException("Error al crear la receta: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public Receta buscarPorId(Long id) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();

        try {
            return em.find(Receta.class, id);
        } catch (Exception e) {
            throw new PersistenciaException("Error al buscar la receta ID: " + id, e);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Receta> obtenerRecetasPorChef(Chef chef) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        try {
            TypedQuery<Receta> query = em.createQuery("SELECT r FROM Receta r WHERE r.chef = :chef", Receta.class);
            query.setParameter("chef", chef);
            return query.getResultList();
        } catch (Exception e) {
            throw new PersistenciaException("Error al obtener recetas del chef.", e);
        } finally {
            em.close();
        }
    }

    @Override
    public void eliminarReceta(Long id) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();
        try {
            Receta receta = em.find(Receta.class, id);
            if (receta != null) {
                em.getTransaction().begin();
                em.remove(receta);
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            throw new PersistenciaException("Error al eliminar la receta.", e);
        } finally {
            em.close();
        }
    }

    public void editarReceta(Receta recetaEditada) throws PersistenciaException {
        EntityManager em = conexion.getEntityManager();

        try {
            em.getTransaction().begin();

            // Buscar receta existente
            Receta recetaOriginal = em.find(Receta.class, recetaEditada.getIdReceta());

            if (recetaOriginal == null) {
                throw new PersistenciaException("La receta con ID " + recetaEditada.getIdReceta() + " no existe.");
            }

            // Actualizar campos principales
            recetaOriginal.setNombre(recetaEditada.getNombre());
            recetaOriginal.setTiempo(recetaEditada.getTiempo());
            recetaOriginal.setNumPersonas(recetaEditada.getNumPersonas());
            recetaOriginal.setComplejidad(recetaEditada.getComplejidad());
            recetaOriginal.setIngredientes(recetaEditada.getIngredientes());
            recetaOriginal.setProceso(recetaEditada.getProceso());

            // Reemplazar fotos si se enviaron nuevas
            if (recetaEditada.getFotos() != null && !recetaEditada.getFotos().isEmpty()) {
                recetaOriginal.getFotos().clear();
                for (FotoReceta foto : recetaEditada.getFotos()) {
                    foto.setReceta(recetaOriginal);
                    recetaOriginal.getFotos().add(foto);
                }
            }

            em.getTransaction().commit();

        } catch (PersistenciaException pe) {
            em.getTransaction().rollback();
            System.err.println("Error de persistencia: " + pe.getMessage());
            throw pe;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.err.println("Error general al editar receta: " + e.getMessage());
            throw new PersistenciaException("Error general al editar la receta", e);
        } finally {
            em.close();
        }

    }

    @Override
    public List<Receta> obtenerTodasLasRecetas() {
        EntityManager em = conexion.getEntityManager();
        try {
            // Asumimos que cada Receta tiene una relación ManyToOne con Usuario (como autor)
            // y una relación OneToMany con Foto (fotos de la receta).
            List<Receta> recetas = em.createQuery(
                    "SELECT DISTINCT r FROM Receta r "
                    + "JOIN FETCH r.chef "
                    + "LEFT JOIN FETCH r.fotos", Receta.class)
                    .getResultList();

            for (Receta r : recetas) {
                System.out.println(">> Receta: " + r.getNombre());
                System.out.println("   Chef: " + (r.getChef() != null ? r.getChef().getNombre() : "null"));
                System.out.println("   Avatar: " + (r.getChef() != null ? r.getChef().getUrlAvatar() : "null"));
                System.out.println("   Fotos: " + (r.getFotos() != null ? r.getFotos().size() : "null"));
            }
            return recetas;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        } finally {
            em.close();
        }
    }

}
