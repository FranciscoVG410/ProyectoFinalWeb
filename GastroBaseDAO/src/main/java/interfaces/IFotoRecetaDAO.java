package interfaces;

import dominio.FotoReceta;
import java.util.List;

public interface IFotoRecetaDAO {
    void guardar(FotoReceta fotoReceta);
    List<FotoReceta> obtenerPorRecetaId(Long recetaId);
}
