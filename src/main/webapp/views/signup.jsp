<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro - GastroBaseApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
    <style>
        body { font-family: Arial; background-color: #f9f1e7; padding: 40px; }
        form { background: white; padding: 20px; max-width: 350px; margin: auto; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        h2 { text-align: center; color: #c0392b; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; }
        input[type="submit"] { background-color: #e74c3c; color: white; border: none; cursor: pointer; }
        input[type="submit"]:hover { background-color: #c0392b; }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/registro" method="POST">
        <h2>Crear Cuenta</h2>
        <label>Nombre de usuario:</label>
        <input type="text" name="usuario" required>

        <label>Contraseña:</label>
        <input type="password" name="password" required>

        <label>Tipo de usuario:</label>
        <select name="tipo">
            <option value="normal">Normal</option>
            <option value="admin">Administrador</option>
        </select>

        <input type="submit" value="Registrar">
    </form>
</body>
</html>
