<%-- 
    Document   : BadGateway
    Created on : 19 may 2025, 11:41:58 p.m.
    Author     : OMEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>502 - Bad Gateway</title>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/BadGatewayCSS.css">
    </head>
    <body>
        <!-- Barra de navegación -->
        <nav class="culinary-nav">
            <a href="${pageContext.request.contextPath}/views/login.jsp" class="nav-brand">
                <span class="logo-icon"><i class="fas fa-utensils"></i></span>
                <span>GastroBase</span>
            </a>
        </nav>

        <!-- Contenido principal del error -->
        <div class="error-container">
            <div class="error-icon">
                <i class="fas fa-unlink"></i>
            </div>
            <h1 class="error-title">502 - Bad Gateway</h1>
            <p class="error-subtitle">
                ¡Ups! Parece que hay un problema con la conexión entre servidores. 
                Nuestro equipo ya está trabajando para solucionarlo. Mientras tanto, 
                puedes volver a la página de inicio o intentar refrescar la página.
            </p>
            <a href="${pageContext.request.contextPath}/views/login.jsp" class="error-btn">
                <i class="fas fa-home"></i> Volver al inicio
            </a>
        </div>
    </body>
</html>
