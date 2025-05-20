<%-- 
    Document   : NullPointer
    Created on : 19 may 2025, 11:42:59 p.m.
    Author     : OMEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error en la aplicación</title>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/NullPointerCSS.css">
    </head>
    <body>
        <header class="error-header">
            <a href="${pageContext.request.contextPath}/views/Home.jsp" class="nav-brand">
                <span class="logo-icon"><i class="fas fa-utensils"></i></span>
                <span>GastroBase</span>
            </a>
        </header>
        
        <main class="error-main">
            <div class="error-icon">
                <i class="fas fa-bug"></i>
            </div>
            <h1 class="error-title">Error en la aplicación</h1>
            <p class="error-message">
                Lo sentimos, ha ocurrido un error inesperado en nuestro sistema.
                Nuestro equipo ha sido notificado y está trabajando para solucionarlo.
                Por favor, intenta nuevamente más tarde.
            </p>
            
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/index.jsp" class="error-btn">
                    <i class="fas fa-home"></i> Volver al inicio
                </a>
                <a href="javascript:history.back()" class="error-btn secondary">
                    <i class="fas fa-arrow-left"></i> Volver atrás
                </a>
            </div>
            
        </main>
        
        <script>
            function toggleDetails() {
                const details = document.getElementById('errorDetails');
                const toggle = document.querySelector('.error-details-toggle');
                
                if (details.style.display === 'block') {
                    details.style.display = 'none';
                    toggle.textContent = 'Mostrar detalles técnicos';
                } else {
                    details.style.display = 'block';
                    toggle.textContent = 'Ocultar detalles técnicos';
                }
            }
            
            // Mostrar detalles si hay parámetro debug en la URL
            if (window.location.search.includes('debug=true')) {
                toggleDetails();
            }
        </script>
    </body>
</html>
