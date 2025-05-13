<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="proyefinalWEB.gastrobase.model.Receta"%>
<%
    Receta r = (Receta) request.getAttribute("receta");
    int id = (Integer) request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Receta - GastroBaseApp</title>
    <style>
        body { font-family: Arial; background-color: #f9f1e7; padding: 40px; }
        form { background: white; padding: 30px; max-width: 600px; margin: auto; border-radius: 10px; box-shadow: 0 0 10px #ccc; }
        h2 { text-align: center; color: #d35400; }
        label, input, textarea, select { width: 100%; margin: 10px 0; padding: 10px; border-radius: 6px; border: 1px solid #ccc; }
        input[type="submit"] { background: #e67e22; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/editar-receta" method="POST">
        <h2>Editar receta</h2>
        <input type="hidden" name="id" value="<%= id %>">

        <label>Nombre:</label>
        <input type="text" name="nombre" value="<%= r.getNombre() %>" required>

        <label>Descripción:</label>
        <textarea name="descripcion" rows="3"><%= r.getDescripcion() %></textarea>

        <label>Ingredientes:</label>
        <textarea name="ingredientes" rows="4"><%= r.getIngredientes() %></textarea>

        <label>Pasos:</label>
        <textarea name="pasos" rows="5"><%= r.getPasos() %></textarea>

        <label>Categoría:</label>
        <select name="categoria">
            <option value="desayuno" <%= r.getCategoria().equals("desayuno") ? "selected" : "" %>>Desayuno</option>
            <option value="comida" <%= r.getCategoria().equals("comida") ? "selected" : "" %>>Comida</option>
            <option value="postre" <%= r.getCategoria().equals("postre") ? "selected" : "" %>>Postre</option>
            <option value="bebida" <%= r.getCategoria().equals("bebida") ? "selected" : "" %>>Bebida</option>
        </select>

        <label>Tiempo (min):</label>
        <input type="number" name="tiempo" value="<%= r.getTiempo() %>" required>

        <label>URL imagen:</label>
        <input type="text" name="imagen" value="<%= r.getImagen() %>">

        <input type="submit" value="Guardar cambios">
    </form>
</body>
</html>
