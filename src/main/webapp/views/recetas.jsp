<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="proyefinalWEB.gastrobase.model.Receta"%>
<%@page import="proyefinalWEB.gastrobase.model.ControlReceta"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recetas - GastroBaseApp</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff8e1;
            padding: 40px;
        }
        .contenedor {
            max-width: 1100px;
            margin: auto;
        }
        .titulo {
            text-align: center;
            color: #d35400;
            margin-bottom: 30px;
        }
        form {
            text-align: center;
            margin-bottom: 30px;
        }
        input[type="text"], select {
            padding: 10px;
            margin: 0 10px;
            width: 200px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #e67e22;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }
        .tarjeta {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 15px;
        }
        .tarjeta img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
        }
        .nombre {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
            color: #e67e22;
        }
        .categoria {
            font-size: 14px;
            color: #555;
        }
        .descripcion {
            font-size: 15px;
            margin: 10px 0;
        }
        .boton {
            display: inline-block;
            padding: 8px 12px;
            background-color: #e67e22;
            color: white;
            border-radius: 6px;
            text-decoration: none;
        }
        .boton:hover {
            background-color: #ca5d17;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h2 class="titulo">Recetario de Cocina</h2>

        <form method="get" action="recetas.jsp">
            <input type="text" name="busqueda" placeholder="Buscar por nombre..." value="<%= request.getParameter("busqueda") != null ? request.getParameter("busqueda") : "" %>">
            <select name="categoria">
                <option value="">Todas</option>
                <option value="desayuno" <%= "desayuno".equals(request.getParameter("categoria")) ? "selected" : "" %>>Desayuno</option>
                <option value="comida" <%= "comida".equals(request.getParameter("categoria")) ? "selected" : "" %>>Comida</option>
                <option value="postre" <%= "postre".equals(request.getParameter("categoria")) ? "selected" : "" %>>Postre</option>
                <option value="bebida" <%= "bebida".equals(request.getParameter("categoria")) ? "selected" : "" %>>Bebida</option>
            </select>
            <select name="orden">
                <option value="">Ordenar por...</option>
                <option value="nombre_asc" <%= "nombre_asc".equals(request.getParameter("orden")) ? "selected" : "" %>>Nombre (A–Z)</option>
                <option value="nombre_desc" <%= "nombre_desc".equals(request.getParameter("orden")) ? "selected" : "" %>>Nombre (Z–A)</option>
                <option value="tiempo_asc" <%= "tiempo_asc".equals(request.getParameter("orden")) ? "selected" : "" %>>Tiempo (menor primero)</option>
                <option value="tiempo_desc" <%= "tiempo_desc".equals(request.getParameter("orden")) ? "selected" : "" %>>Tiempo (mayor primero)</option>
            </select>
            <input type="submit" value="Buscar">
        </form>

        <div class="grid">
            <%
                String busqueda = request.getParameter("busqueda");
                String categoriaFiltro = request.getParameter("categoria");
                String orden = request.getParameter("orden");

                List<Receta> recetasFiltradas = new ArrayList<>();
                for (Receta receta : ControlReceta.obtenerTodas()) {
                    boolean coincide = true;

                    if (busqueda != null && !busqueda.isEmpty()) {
                        coincide &= receta.getNombre().toLowerCase().contains(busqueda.toLowerCase());
                    }

                    if (categoriaFiltro != null && !categoriaFiltro.isEmpty()) {
                        coincide &= receta.getCategoria().equalsIgnoreCase(categoriaFiltro);
                    }

                    if (coincide) {
                        recetasFiltradas.add(receta);
                    }
                }

                if (orden != null) {
                    switch (orden) {
                        case "nombre_asc":
                            recetasFiltradas.sort((a, b) -> a.getNombre().compareToIgnoreCase(b.getNombre()));
                            break;
                        case "nombre_desc":
                            recetasFiltradas.sort((a, b) -> b.getNombre().compareToIgnoreCase(a.getNombre()));
                            break;
                        case "tiempo_asc":
                            recetasFiltradas.sort((a, b) -> Integer.compare(a.getTiempo(), b.getTiempo()));
                            break;
                        case "tiempo_desc":
                            recetasFiltradas.sort((a, b) -> Integer.compare(b.getTiempo(), a.getTiempo()));
                            break;
                    }
                }

                for (Receta r : recetasFiltradas) {
            %>
                <div class="tarjeta">
                    <% if (r.getImagen() != null && !r.getImagen().isEmpty()) { %>
                        <img src="<%= r.getImagen() %>" alt="Imagen receta">
                    <% } else { %>
                        <img src="https://cdn-icons-png.flaticon.com/512/2921/2921822.png" alt="Sin imagen">
                    <% } %>

                    <div class="nombre"><%= r.getNombre() %></div>
                    <div class="categoria"><%= r.getCategoria().toUpperCase() %> • <%= r.getTiempo() %> min</div>
                    <div class="descripcion"><%= r.getDescripcion() %></div>
                    <a href="${pageContext.request.contextPath}/ver-receta?id=<%= ControlReceta.obtenerTodas().indexOf(r) %>" class="boton">Ver receta</a>
                </div>
            <%
                }
                if (recetasFiltradas.isEmpty()) {
            %>
                <p style="grid-column: 1 / -1; text-align: center;">No se encontraron recetas.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
