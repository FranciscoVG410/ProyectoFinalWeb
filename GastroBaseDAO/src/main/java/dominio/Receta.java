/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dominio;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tblReceta")
public class Receta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idReceta;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "tiempo", nullable = false)
    private int tiempo;

    @Column(name = "numPersonas", nullable = false)
    private int numPersonas;

    @Column(name = "ingredientes", nullable = false)
    private String ingredientes;

    @Column(name = "proceso", nullable = false)
    private String proceso;

    @Column(name = "complejidad", nullable = false)
    private String complejidad;

    @OneToMany(mappedBy = "receta", cascade = CascadeType.PERSIST)
    private List<Comentario> comentarios;

    @OneToMany(mappedBy = "receta", cascade = CascadeType.PERSIST)
    private List<Favorito> favoritos;

    @OneToMany(mappedBy = "receta", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<FotoReceta> fotos = new ArrayList<>();

     @ManyToOne
    @JoinColumn(name = "idChef", nullable = false)
    private Chef chef;
     
    public Receta() {
    }

    public Long getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(Long idReceta) {
        this.idReceta = idReceta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTiempo() {
        return tiempo;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public int getNumPersonas() {
        return numPersonas;
    }

    public void setNumPersonas(int numPersonas) {
        this.numPersonas = numPersonas;
    }

    public String getComplejidad() {
        return complejidad;
    }

    public void setComplejidad(String complejidad) {
        this.complejidad = complejidad;
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getProceso() {
        return proceso;
    }

    public void setProceso(String proceso) {
        this.proceso = proceso;
    }

    public List<Comentario> getComentarios() {
        return comentarios;
    }

    public void setComentarios(List<Comentario> comentarios) {
        this.comentarios = comentarios;
    }

    public List<Favorito> getFavoritos() {
        return favoritos;
    }

    public void setFavoritos(List<Favorito> favoritos) {
        this.favoritos = favoritos;
    }

    public List<FotoReceta> getFotos() {
        return fotos;
    }

    public void setFotos(List<FotoReceta> fotos) {
        this.fotos = fotos;
    }

    public Chef getChef() {
        return chef;
    }

    public void setChef(Chef chef) {
        this.chef = chef;
    }

    public void addFoto(FotoReceta foto) {
        if (fotos.size() >= 5) {
            throw new IllegalStateException("No se pueden agregar más de 5 fotos por receta");
        }
        fotos.add(foto);
        foto.setReceta(this);
    }

    public void removeFoto(FotoReceta foto) {
        fotos.remove(foto);
        foto.setReceta(null);
    }
    
    
}
