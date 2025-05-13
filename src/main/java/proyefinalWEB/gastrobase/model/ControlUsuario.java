/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyefinalWEB.gastrobase.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joseq
 */
public class ControlUsuario {

    private static List<Usuario> usuarios = new ArrayList<>();

    public static void agregarUsuario(Usuario u) {
        usuarios.add(u);
    }

    public static List<Usuario> obtenerLista() {
        return usuarios;
    }

    public static void eliminarUsuario(String usuario) {
        usuarios.removeIf(u -> u.getUsuario().equals(usuario));
    }

    public static void actualizarUsuario(Usuario u) {
        for (int i = 0; i < usuarios.size(); i++) {
            if (usuarios.get(i).getUsuario().equals(u.getUsuario())) {
                usuarios.set(i, u);
                break;
            }
        }
    }

    public static boolean existe(String usuario) {
        for (Usuario u : usuarios) {
            if (u.getUsuario().equalsIgnoreCase(usuario)) {
                return true;
            }
        }
        return false;
    }

}
