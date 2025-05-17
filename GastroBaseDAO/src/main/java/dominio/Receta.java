package dominio;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "RECETA")
public class Receta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "TITULO", nullable = false)
    private String titulo;

    @Column(name = "TIEMPO", nullable = false)
    private int tiempo;

    @Column(name = "PERSONAS", nullable = false)
    private int personas;

    @Column(name = "COMPLEJIDAD", nullable = false)
    private String complejidad;

    @Column(name = "INGREDIENTES", nullable = false, columnDefinition = "TEXT")
    private String ingredientes;

    @Column(name = "INSTRUCCIONES", nullable = false, columnDefinition = "TEXT")
    private String instrucciones;

    @OneToMany(mappedBy = "receta", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    private List<FotoReceta> fotos;

    public Receta() {
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getTiempo() {
        return tiempo;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public int getPersonas() {
        return personas;
    }

    public void setPersonas(int personas) {
        this.personas = personas;
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

    public String getInstrucciones() {
        return instrucciones;
    }

    public void setInstrucciones(String instrucciones) {
        this.instrucciones = instrucciones;
    }

    public List<FotoReceta> getFotos() {
        return fotos;
    }

    public void setFotos(List<FotoReceta> fotos) {
        this.fotos = fotos;
    }
}
