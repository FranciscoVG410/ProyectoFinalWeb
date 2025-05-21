<%-- 
    Document   : AdminPanel
    Created on : 19 may 2025, 22:03:28
    Author     : joseq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de Administración - GastroBase</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloHome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloAdministracion.css">
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



            <div class="nav-actions">
                <div class="user-profile" onclick="toggleProfileMenu()">
                    <span class="user-greeting">Hola, Admin</span>
                    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde" alt="Perfil">
                    <div class="profile-menu">
                        <a href="${pageContext.request.contextPath}/adminPanel"><i class="fas fa-shield-alt"></i> Panel Admin</a>
                        <a href="${pageContext.request.contextPath}/views/login.jsp"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Panel de Administración -->
        <div class="admin-panel">
            <div class="admin-header">
                <h1 class="admin-title"><i class="fas fa-shield-alt"></i> Panel de Administración</h1>
            </div>

            <div class="admin-tabs">
                <div class="admin-tab active" onclick="switchTab('posts')">Gestión de Recetas</div>
                <div class="admin-tab" onclick="switchTab('users')">Gestión de Usuarios</div>
            </div>

            <!-- Contenido de Gestión de Recetas -->
            <div class="admin-content active" id="posts-content">
                <div class="search-filter">
                    <input type="text" placeholder="Buscar recetas..." id="postSearch">
                </div>

                <div class="post-list">
                    <c:forEach var="receta" items="${recetas}">
                        <div class="post-card">
                            <c:choose>
                                <c:when test="${not empty receta.fotos}">
                                    <img src="${pageContext.request.contextPath}/${receta.fotos[0].url}" alt="${receta.nombre}" class="post-img">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/img/default.jpg" alt="Imagen no disponible" class="post-img">
                                </c:otherwise>
                            </c:choose>

                            <div class="post-content">
                                <h3 class="post-title">${receta.nombre}</h3>
                                <div class="post-author">
                                    <img src="${pageContext.request.contextPath}/${receta.chef.urlAvatar}" alt="Chef">
                                    <span>${receta.chef.nombre} ${receta.chef.apellido}</span>
                                </div>
                                <div class="post-stats">
                                    <span><i class="fas fa-clock"></i> ${receta.tiempo} min</span>
                                    <span><i class="fas fa-users"></i> ${receta.numPersonas} personas</span>
                                    <span><i class="fas fa-chart-line"></i> ${receta.complejidad}</span>
                                </div>
                                <div class="post-actions">
                                    <form method="post" action="${pageContext.request.contextPath}/eliminarReceta"
                                          onsubmit="return confirm('¿Eliminar esta receta?');">
                                        <input type="hidden" name="idReceta" value="${receta.idReceta}">
                                        <button class="admin-btn delete-btn" type="submit">
                                            <i class="fas fa-trash"></i> Eliminar
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <!-- Contenido de Gestión de Usuarios -->
            <div class="admin-content" id="users-content">
                <div class="search-filter">
                    <input type="text" placeholder="Buscar usuarios..." id="userSearch">

                </div>

                <div class="user-list">
                    <c:forEach var="chef" items="${chefs}">
                        <div class="user-card">
                            <div class="user-avatar-container">
                                <img src="${pageContext.request.contextPath}/${chef.urlAvatar}" alt="Usuario" class="user-avatar">
                                <c:if test="${chef.destacado}">
                                    <span class="featured-badge">Destacado</span>
                                </c:if>
                            </div>
                            <div class="user-info">
                                <h3 class="user-name">${chef.nombre} ${chef.apellido}</h3>
                                <p class="user-email">${chef.correo}</p>
                                <div class="user-stats">
                                    <span><i class="fas fa-utensils"></i> ${fn:length(chef.recetas)} recetas</span>
                                    <span><i class="fas fa-users"></i> ${fn:length(chef.seguidores)} seguidores</span>
                                </div>
                                <span class="user-status ${chef.destacado ? 'status-featured' : 'status-active'}">
                                    ${chef.destacado ? 'Destacado' : 'Activo'}
                                </span>
                                <div class="post-actions">
                                    <form method="post" action="${pageContext.request.contextPath}/eliminarChef"
                                          onsubmit="return confirm('¿Eliminar este usuario?');">
                                        <input type="hidden" name="idChef" value="${chef.idChef}">
                                        <button class="admin-btn ban-btn" type="submit">
                                            <i class="fas fa-ban"></i> Eliminar
                                        </button>
                                    </form>

                                    <form method="post" action="${pageContext.request.contextPath}/destacarChef">
                                        <input type="hidden" name="idChef" value="${chef.idChef}">
                                        <input type="hidden" name="destacar" value="${not chef.destacado}" />
                                        <button class="admin-btn featured-btn" type="submit">
                                            <i class="fas fa-star"></i>
                                            ${chef.destacado ? 'Quitar Destacado' : 'Destacar'}
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>



                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/scriptAdministracion.js"></script>

        <script>
                          // Búsqueda en Recetas
                          document.getElementById("postSearch").addEventListener("input", function () {
                              const query = this.value.toLowerCase();
                              const posts = document.querySelectorAll(".post-list .post-card");

                              posts.forEach(post => {
                                  const title = post.querySelector(".post-title").textContent.toLowerCase();
                                  const author = post.querySelector(".post-author span").textContent.toLowerCase();
                                  post.style.display = (title.includes(query) || author.includes(query)) ? "flex" : "none";
                              });
                          });

                          // Búsqueda en Usuarios
                          document.getElementById("userSearch").addEventListener("input", function () {
                              const query = this.value.toLowerCase();
                              const users = document.querySelectorAll(".user-list .user-card");

                              users.forEach(user => {
                                  const name = user.querySelector(".user-name").textContent.toLowerCase();
                                  const email = user.querySelector(".user-email").textContent.toLowerCase();
                                  user.style.display = (name.includes(query) || email.includes(query)) ? "flex" : "none";
                              });
                          });
        </script>

    </body>
</html>