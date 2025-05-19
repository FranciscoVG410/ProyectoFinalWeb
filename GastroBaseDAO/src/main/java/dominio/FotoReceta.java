package dominio;

import javax.persistence.*;

@Entity
@Table(name = "foto_receta")
public class FotoReceta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    @Column(name = "imagen_base64", columnDefinition = "LONGTEXT")
    private String imagenBase64;

    @ManyToOne
    @JoinColumn(name = "receta_id")
    private Receta receta;

    public FotoReceta() {}

    public FotoReceta(String imagenBase64, Receta receta) {
        this.imagenBase64 = imagenBase64;
        this.receta = receta;
    }

    public Long getId() {
        return id;
    }

    public String getImagenBase64() {
        return imagenBase64;
    }

    public void setImagenBase64(String imagenBase64) {
        this.imagenBase64 = imagenBase64;
    }

    public Receta getReceta() {
        return receta;
    }

    public void setReceta(Receta receta) {
        this.receta = receta;
    }
}
