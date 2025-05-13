<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    String tipo = (sesion != null) ? (String) sesion.getAttribute("tipo") : null;
    String usuario = (sesion != null) ? (String) sesion.getAttribute("usuarioLogueado") : null;

    if (tipo == null || !"admin".equals(tipo)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Panel Admin - GastroBaseApp</title>
    <style>
        body { font-family: Arial; background-color: #fff3e6; padding: 40px; }
        .admin-box { max-width: 600px; margin: auto; background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px #ccc; }
        h2 { color: #d35400; }
        a { color: #c0392b; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="admin-box">
        <h2>Bienvenido, <%= usuario %> (Administrador)</h2>
        <p>Has accedido al panel de administración.</p>
        <p><a href="${pageContext.request.contextPath}/logout">Cerrar sesión</a></p>
    </div>
</body>
</html>
