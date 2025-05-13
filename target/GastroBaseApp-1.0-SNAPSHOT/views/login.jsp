<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    String tipo = (sesion != null) ? (String) sesion.getAttribute("tipo") : null;
    if (tipo != null) {
        if ("admin".equals(tipo)) {
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("bienvenido.jsp");
        }
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - GastroBaseApp</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; padding: 40px; }
        form { background: white; padding: 20px; max-width: 300px; margin: auto; border-radius: 8px; box-shadow: 0 0 10px #aaa; }
        h2 { text-align: center; }
        input { width: 100%; padding: 10px; margin: 10px 0; }
        input[type="submit"] { background-color: #c0392b; color: white; border: none; cursor: pointer; }
        input[type="submit"]:hover { background-color: #922b21; }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/login" method="POST">
        <h2>Iniciar Sesión</h2>
        <label>Usuario:</label>
        <input type="text" name="usuario" required>

        <label>Contraseña:</label>
        <input type="password" name="password" required>

        <input type="submit" value="Entrar">

        <p style="text-align: center;">
            <a href="${pageContext.request.contextPath}/views/signup.jsp">¿No tienes cuenta? Regístrate aquí</a>
        </p>
    </form>
</body>
</html>
