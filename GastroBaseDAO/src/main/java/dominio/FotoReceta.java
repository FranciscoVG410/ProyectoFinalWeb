/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dominio;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author carli
 */
@Entity
@Table(name="tblFotoReceta")
public class FotoReceta implements Serializable {
   @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFotoReceta;
    
   @Column(name="url", nullable = false)
    private String url;

    @ManyToOne
    @JoinColumn(name = "idReceta", nullable = false)
    private Receta receta;

    public FotoReceta() {
    }

    public Long getIdFotoReceta() {
        return idFotoReceta;
    }

    public void setIdFotoReceta(Long idFotoReceta) {
        this.idFotoReceta = idFotoReceta;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Receta getReceta() {
        return receta;
    }

    public void setReceta(Receta receta) {
        this.receta = receta;
    }
    
    
}