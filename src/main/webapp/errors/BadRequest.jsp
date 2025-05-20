<%-- 
    Document   : BadRequest
    Created on : 19 may 2025, 11:42:40 p.m.
    Author     : OMEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>400 - Bad Request</title>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/BadRequestCSS.css">
    </head>
    <body>
        <nav class="culinary-nav">
            <a href="${pageContext.request.contextPath}/views/login.jsp" class="nav-brand">
                <span class="logo-icon"><i class="fas fa-utensils"></i></span>
                <span>GastroBase</span>
            </a>
        </nav>

        <!-- Contenido principal del error -->
        <div class="error-container">
            <div class="error-icon">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            <h1 class="error-title">400 - Bad Request</h1>
            <p class="error-subtitle">
                La solicitud que has enviado no es válida o está mal formada.
                Por favor, verifica los datos e intenta nuevamente.
            </p>
            <a href="${pageContext.request.contextPath}/views/login.jsp" class="error-btn">
                <i class="fas fa-home"></i> Volver al inicio
            </a>
        </div>
    </body>
</html>
