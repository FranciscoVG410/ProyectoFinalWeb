/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dominio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author carli
 */
@Entity
@Table(name = "tblAdmin")
public class Admin extends Usuario implements Serializable {

    @OneToMany(mappedBy = "admin", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Administra> administrados = new ArrayList<>();

    ;

    public Admin() {
    }

    public List<Administra> getAdministrados() {
        return administrados;
    }

    public void setAdministrados(List<Administra> administrados) {
        this.administrados = administrados;
    }

}
