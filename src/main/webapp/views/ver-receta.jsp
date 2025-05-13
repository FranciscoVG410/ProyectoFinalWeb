<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="proyefinalWEB.gastrobase.model.Receta"%>
<%@page import="proyefinalWEB.gastrobase.model.ControlReceta"%>
<%@page import="java.util.Set"%>
<%
    Receta r = (Receta) request.getAttribute("receta");
    int id = ControlReceta.obtenerTodas().indexOf(r);

    Set<Integer> votadas = (Set<Integer>) session.getAttribute("recetasVotadas");
    boolean yaVotada = votadas != null && votadas.contains(id);

    double promedio = Math.round(r.getPromedioCalificacion() * 10.0) / 10.0;
    int votos = r.getTotalVotos();
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= r.getNombre() %> - Receta</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fffdf5;
            padding: 40px;
        }
        .contenedor {
            max-width: 800px;
            margin: auto;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px #ccc;
        }
        h1 {
            color: #d35400;
        }
        .categoria {
            font-size: 14px;
            color: #888;
            margin-bottom: 10px;
        }
        img {
            width: 100%;
            max-height: 350px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        h3 {
            color: #e67e22;
        }
        pre {
            background-color: #fdf2e9;
            padding: 15px;
            border-radius: 8px;
            white-space: pre-wrap;
        }
        .botones {
            margin-top: 30px;
            display: flex;
            gap: 10px;
        }
        a {
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            border-radius: 6px;
        }
        .volver { background-color: #e67e22; }
        .editar { background-color: #3498db; }
        .eliminar { background-color: #c0392b; }
        a:hover { opacity: 0.9; }

        .voto-msg {
            color: green;
            margin-top: 20px;
            font-weight: bold;
        }
        .calificacion {
            margin-top: 30px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <h1><%= r.getNombre() %></h1>
        <div class="categoria"><%= r.getCategoria().toUpperCase() %> • <%= r.getTiempo() %> min</div>

        <% if (r.getImagen() != null && !r.getImagen().isEmpty()) { %>
            <img src="<%= r.getImagen() %>" alt="Imagen receta">
        <% } %>

        <h3>Descripción</h3>
        <p><%= r.getDescripcion() %></p>

        <h3>Ingredientes</h3>
        <pre><%= r.getIngredientes() %></pre>

        <h3>Pasos de preparación</h3>
        <pre><%= r.getPasos() %></pre>

        <div class="botones">
            <a href="${pageContext.request.contextPath}/views/recetas.jsp" class="volver">Volver</a>
            <a href="${pageContext.request.contextPath}/editar-receta?id=<%= id %>" class="editar">Editar</a>
            <a href="${pageContext.request.contextPath}/eliminar-receta?id=<%= id %>" class="eliminar" onclick="return confirm('¿Estás seguro de eliminar esta receta?')">Eliminar</a>
        </div>

        <div class="calificacion">
            <% if (yaVotada) { %>
                <p class="voto-msg">✔ Ya has calificado esta receta.</p>
            <% } else { %>
                <form action="${pageContext.request.contextPath}/calificar-receta" method="POST">
                    <input type="hidden" name="id" value="<%= id %>">
                    <label for="estrellas">Califica esta receta:</label>
                    <select name="estrellas" required>
                        <option value="">⭐ Selecciona</option>
                        <option value="1">⭐ 1</option>
                        <option value="2">⭐⭐ 2</option>
                        <option value="3">⭐⭐⭐ 3</option>
                        <option value="4">⭐⭐⭐⭐ 4</option>
                        <option value="5">⭐⭐⭐⭐⭐ 5</option>
                    </select>
                    <input type="submit" value="Enviar">
                </form>
            <% } %>

            <p style="margin-top: 15px;">
                Calificación promedio: ⭐ <%= promedio %> / 5
                <% if (votos > 0) { %>
                    (basado en <%= votos %> voto<%= votos == 1 ? "" : "s" %>)
                <% } else { %>
                    (sin votos aún)
                <% } %>
            </p>
        </div>
    </div>
</body>
</html>
