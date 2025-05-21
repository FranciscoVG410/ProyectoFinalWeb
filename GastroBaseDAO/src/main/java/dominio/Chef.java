/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dominio;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author carli
 */
@Entity
@Table(name = "tblChef")
public class Chef extends Usuario implements Serializable {

    @Column(name = "nombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "apellido", nullable = false, length = 50)
    private String apellido;

    @Column(name = "telefono", unique = true, length = 13)
    private String telefono;

    @Column(name = "urlAvatar", length = 255)
    private String urlAvatar;

    @Column(name = "pais", length = 255)
    private String pais;

    @Column(name = "fechaNacimiento")
    private LocalDate fechaNacimiento;
    
    @Column(name = "destacado")
    private boolean destacado = false;

    @OneToMany(mappedBy = "chef", cascade = CascadeType.PERSIST)
    private List<Comentario> comentarios = new ArrayList<>();
    ;

   @OneToMany(mappedBy = "chef", cascade = CascadeType.ALL, orphanRemoval = true)
private List<Receta> recetas = new ArrayList<>();


    
    @OneToMany(mappedBy = "chef", cascade = CascadeType.PERSIST)
    private List<Favorito> favoritos = new ArrayList<>();
    ;
    
    @OneToMany(mappedBy = "seguidor", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Follow> siguiendo = new HashSet<>();

    @OneToMany(mappedBy = "seguido", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Follow> seguidores = new HashSet<>();

    @OneToMany(mappedBy = "chef", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Administra> administraciones = new ArrayList<>();

    public Chef() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getUrlAvatar() {
        return urlAvatar;
    }

    public void setUrlAvatar(String urlAvatar) {
        this.urlAvatar = urlAvatar;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
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

    public Set<Follow> getSiguiendo() {
        return siguiendo;
    }

    public void setSiguiendo(Set<Follow> siguiendo) {
        this.siguiendo = siguiendo;
    }

    public Set<Follow> getSeguidores() {
        return seguidores;
    }

    public void setSeguidores(Set<Follow> seguidores) {
        this.seguidores = seguidores;
    }

    public List<Administra> getAdministraciones() {
        return administraciones;
    }

    public void setAdministraciones(List<Administra> administraciones) {
        this.administraciones = administraciones;
    }

    public List<Receta> getRecetas() {
        return recetas;
    }

    public void setRecetas(List<Receta> recetas) {
        this.recetas = recetas;
    }


    public boolean isDestacado() {
        return destacado;
    }

    public void setDestacado(boolean destacado) {
        this.destacado = destacado;
    }

    public Long getIdChef() {
    return super.getIdUsuario();
}
}
