/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dominio;

import java.io.Serializable;
import java.time.LocalDateTime;
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
@Table(name="tblFollow")
public class Follow implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idFollow;
    
    @ManyToOne
    @JoinColumn(name = "seguidor_id", nullable = false)
    private Chef seguidor;

    @ManyToOne
    @JoinColumn(name = "seguido_id", nullable = false)
    private Chef seguido;

    @Column(nullable = false)
    private LocalDateTime fechaSeguido = LocalDateTime.now();

    public Follow() {
    }

    public Long getIdFollow() {
        return idFollow;
    }

    public void setIdFollow(Long idFollow) {
        this.idFollow = idFollow;
    }

    public Chef getSeguidor() {
        return seguidor;
    }

    public void setSeguidor(Chef seguidor) {
        this.seguidor = seguidor;
    }

    public Chef getSeguido() {
        return seguido;
    }

    public void setSeguido(Chef seguido) {
        this.seguido = seguido;
    }

    public LocalDateTime getFechaSeguido() {
        return fechaSeguido;
    }

    public void setFechaSeguido(LocalDateTime fechaSeguido) {
        this.fechaSeguido = fechaSeguido;
    }

}
