<%-- 
    Document   : home
    Created on : 3 may 2025, 09:00:00 a.m.
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feed Principal - GastroBase</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloHome.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <!-- Barra de navegación -->
        <nav class="culinary-nav">
            <div class="nav-brand">
                <i class="fas fa-mortar-pestle logo-icon"></i>
                <span>GastroBase</span>
            </div>

            <div class="nav-search">
                <input type="text" placeholder="Buscar recetas, ingredientes...">
                <button class="spice-button">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <div class="nav-actions">
                <div class="user-profile" onclick="toggleProfileMenu()">
                    <span class="user-greeting">Hola, ${sessionScope.usuario.nombre}</span>
                    <img src="${sessionScope.usuario.fotoPerfil != null ? sessionScope.usuario.fotoPerfil : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde'}" alt="Perfil">
                    <div class="profile-menu">
                        <a href="${pageContext.request.contextPath}/views/MyProfile.jsp"><i class="fas fa-user"></i> Mi Perfil</a>
                        <a href="${pageContext.request.contextPath}/cerrarSesion"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Contenido principal -->
        <main class="culinary-main">
            <section class="recipe-feed">
                <h2 class="section-title">Recetas del Momento 🔥</h2>

                <!-- Iterar sobre las recetas desde la BD -->
                <c:forEach var="receta" items="${recetas}">
                    <article class="recipe-card">
                        <div class="recipe-header">
                            <c:choose>
                                <c:when test="${not empty receta.fotos}">
                                    <img src="${receta.fotos[0].url}" alt="${receta.nombre}">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c" alt="${receta.nombre}">
                                </c:otherwise>
                            </c:choose>
                            <div class="recipe-meta">
                                <h3>${receta.nombre}</h3>
                                <div class="author-info">
                                    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde" alt="Autor">
                                    <span>${receta.usuario.nombre}</span>
                                </div>
                                <div class="recipe-stats">
                                    <span><i class="fas fa-clock"></i> ${receta.tiempo} min</span>
                                    <span><i class="fas fa-utensils"></i> ${receta.numPersonas} personas</span>
                                    <span><i class="fas fa-chart-line"></i> ${receta.complejidad}</span>
                                </div>
                            </div>
                        </div>
                        <div class="recipe-content">
                            <div class="ingredients-preview">
                                <h4>Ingredientes principales:</h4>
                                <p>${fn:substring(receta.ingredientes, 0, 100)}...</p>
                            </div>
                            <div class="recipe-actions">
                                <button class="like-btn" onclick="likeReceta(${receta.idReceta})">
                                    <i class="fas fa-heart"></i> ${receta.favoritos != null ? receta.favoritos.size() : 0}
                                </button>
                                <button class="comment-btn" onclick="mostrarComentarios(${receta.idReceta})">
                                    <i class="fas fa-comment"></i> ${receta.comentarios != null ? receta.comentarios.size() : 0}
                                </button>
                                <button class="save-btn" onclick="guardarReceta(${receta.idReceta})">
                                    <i class="fas fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </section>

            <!-- Sidebar derecho -->
            <aside class="culinary-sidebar">
                <div class="trending-section">
                    <h4>Tendencias hoy <i class="fas fa-fire"></i></h4>
                    <ul class="trending-list">
                        <li>#CocinaFusion</li>
                        <li>#PostresSinHorno</li>
                        <li>#VeganoGourmet</li>
                    </ul>
                </div>

                <div class="featured-chefs">
                    <h4>Chefs Destacados <i class="fas fa-award"></i></h4>
                    <div class="chefs-grid">
                        <c:forEach var="chef" items="${chefsDestacados}" end="1">
                            <div class="chef-card">
                                <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde" alt="${chef.nombre}">
                                <h5>${chef.nombre}</h5>
                                <p>${chef.recetas != null ? chef.recetas.size() : 0} recetas</p>
                                <button class="follow-btn" onclick="seguirUsuario(${chef.id})">Seguir</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </aside>
        </main>

        <!-- Botón flotante -->
        <div class="floating-action">
            <button class="flame-button-circle" onclick="openRecipeModal()">
                <i class="fas fa-plus"></i>
            </button>
        </div>

        <script src="${pageContext.request.contextPath}/js/scriptRecetas.js"></script>
    </body>
</html>