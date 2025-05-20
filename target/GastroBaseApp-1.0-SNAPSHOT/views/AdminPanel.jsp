<%-- 
    Document   : AdminPanel
    Created on : 19 may 2025, 22:03:28
    Author     : joseq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <div class="nav-search">
                <input type="text" placeholder="Buscar recetas, ingredientes...">
                <button class="spice-button">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <div class="nav-actions">
                <div class="user-profile" onclick="toggleProfileMenu()">
                    <span class="user-greeting">Hola, Admin</span>
                    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde" alt="Perfil">
                    <div class="profile-menu">
                        <a href="${pageContext.request.contextPath}/views/MyProfile.jsp"><i class="fas fa-user"></i> Mi Perfil</a>
                        <a href="${pageContext.request.contextPath}/views/AdminPanel.jsp"><i class="fas fa-shield-alt"></i> Panel Admin</a>
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
                    <select id="postFilter">
                        <option value="all">Todas las recetas</option>
                        <option value="reported">Reportadas</option>
                        <option value="recent">Recientes</option>
                        <option value="popular">Populares</option>
                    </select>
                </div>

                <div class="post-list">
                    <!-- Receta 1 -->
                    <div class="post-card">
                        <img src="https://images.unsplash.com/photo-1588013273468-315fd88ea34c" alt="Pasta Carbonara" class="post-img">
                        <div class="post-content">
                            <h3 class="post-title">Carbonara Auténtica</h3>
                            <div class="post-author">
                                <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36" alt="Chef">
                                <span>Marco Bianchi</span>
                            </div>
                            <p>La verdadera carbonara romana con guanciale crujiente y salsa cremosa de huevo.</p>
                            <div class="post-stats">
                                <span><i class="fas fa-heart"></i> 328 likes</span>
                                <span><i class="fas fa-comment"></i> 45 comentarios</span>
                                <span><i class="fas fa-flag"></i> 3 reportes</span>
                            </div>
                            <div class="post-actions">
                                <button class="admin-btn delete-btn" onclick="deletePost(1)">
                                    <i class="fas fa-trash"></i> Eliminar
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Receta 2 -->
                    <div class="post-card">
                        <img src="https://images.unsplash.com/photo-1579871494447-9811cf80d66c" alt="Sushi" class="post-img">
                        <div class="post-content">
                            <h3 class="post-title">Sushi Artesanal</h3>
                            <div class="post-author">
                                <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2" alt="Chef">
                                <span>Yuki Tanaka</span>
                            </div>
                            <p>Rollos de salmón fresco con arroz avinagrado y wasabi casero.</p>
                            <div class="post-stats">
                                <span><i class="fas fa-heart"></i> 512 likes</span>
                                <span><i class="fas fa-comment"></i> 89 comentarios</span>
                                <span><i class="fas fa-flag"></i> 1 reporte</span>
                            </div>
                            <div class="post-actions">
                                <button class="admin-btn delete-btn" onclick="deletePost(2)">
                                    <i class="fas fa-trash"></i> Eliminar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contenido de Gestión de Usuarios -->
            <div class="admin-content" id="users-content">
                <div class="search-filter">
                    <input type="text" placeholder="Buscar usuarios..." id="userSearch">
                    <select id="userFilter">
                        <option value="all">Todos los usuarios</option>
                        <option value="active">Activos</option>
                        <option value="banned">Baneados</option>
                        <option value="verified">Chefs verificados</option>
                        <option value="featured">Destacados</option>
                    </select>
                </div>

                <div class="user-list">
                    <!-- Usuario 1 - Destacado -->
                    <div class="user-card">
                        <div class="user-avatar-container">
                            <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36" alt="Usuario" class="user-avatar">
                            <span class="featured-badge">Destacado</span>
                        </div>
                        <div class="user-info">
                            <h3 class="user-name">Marco Bianchi</h3>
                            <p class="user-email">marco.bianchi@example.com</p>
                            <div class="user-stats">
                                <span><i class="fas fa-utensils"></i> 25 recetas</span>
                                <span><i class="fas fa-users"></i> 1,250 seguidores</span>
                            </div>
                            <span class="user-status status-featured">Destacado</span>
                            <div class="post-actions">
                                <button class="admin-btn ban-btn" onclick="banUser(1, true)">
                                    <i class="fas fa-ban"></i> Banear
                                </button>
                                <button class="admin-btn featured-btn" onclick="toggleFeatured(1, false)">
                                    <i class="fas fa-star"></i> Quitar destacado
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Usuario 2 - No destacado -->
                    <div class="user-card">
                        <div class="user-avatar-container">
                            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2" alt="Usuario" class="user-avatar">
                        </div>
                        <div class="user-info">
                            <h3 class="user-name">Yuki Tanaka</h3>
                            <p class="user-email">yuki.tanaka@example.com</p>
                            <div class="user-stats">
                                <span><i class="fas fa-utensils"></i> 18 recetas</span>
                                <span><i class="fas fa-users"></i> 890 seguidores</span>
                            </div>
                            <span class="user-status status-active">Activo</span>
                            <div class="post-actions">
                                <button class="admin-btn ban-btn" onclick="banUser(2, true)">
                                    <i class="fas fa-ban"></i> Banear
                                </button>
                                <button class="admin-btn featured-btn" onclick="toggleFeatured(2, true)">
                                    <i class="fas fa-star"></i> Destacar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/scriptAdministracion.js"></script>
    </body>
</html>