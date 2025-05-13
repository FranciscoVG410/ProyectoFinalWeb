<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    String nombreUsuario = (sesion != null) ? (String) sesion.getAttribute("usuarioLogueado") : null;
    if (nombreUsuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenido</title>
    <style>
        body { font-family: Verdana; background-color: #e8f8f5; padding: 40px; }
        .box { max-width: 500px; margin: auto; background: #d1f2eb; padding: 20px; border-radius: 10px; }
        a { color: #c0392b; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="box">
        <h2>¡Hola <%= nombreUsuario %>!</h2>
        <p>Has iniciado sesión correctamente.</p>
        <p><a href="${pageContext.request.contextPath}/logout">Cerrar sesión</a></p>
    </div>
</body>
</html>
Si