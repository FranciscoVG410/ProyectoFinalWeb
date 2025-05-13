/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.model;

/**
 *
 * @author joseq
 */
public class Receta {

    private String nombre;
    private String descripcion;
    private String ingredientes;
    private String pasos;
    private String categoria;
    private int tiempo;
    private String imagen;

    // Calificaciones
    private int sumaCalificaciones = 0;
    private int totalVotos = 0;

    public Receta(String nombre, String descripcion, String ingredientes, String pasos,
            String categoria, int tiempo, String imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.ingredientes = ingredientes;
        this.pasos = pasos;
        this.categoria = categoria;
        this.tiempo = tiempo;
        this.imagen = imagen;
    }

    // Getters
    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public String getPasos() {
        return pasos;
    }

    public String getCategoria() {
        return categoria;
    }

    public int getTiempo() {
        return tiempo;
    }

    public String getImagen() {
        return imagen;
    }

    // Calificación
    public void agregarCalificacion(int estrellas) {
        this.sumaCalificaciones += estrellas;
        this.totalVotos++;
    }

    public double getPromedioCalificacion() {
        return totalVotos == 0 ? 0 : (double) sumaCalificaciones / totalVotos;
    }

    public int getTotalVotos() {
        return totalVotos;
    }

    public int getSumaCalificaciones() {
        return sumaCalificaciones;
    }

    // Setters si los necesitas
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public void setPasos(String pasos) {
        this.pasos = pasos;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

}
