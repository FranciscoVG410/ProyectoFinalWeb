<%-- 
    Document   : perfil
    Created on : 3 may 2025, 09:00:00 a.m.
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de Usuario - GastroBase</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloHome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloMyProfile.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <!-- Barra de navegación -->
        <nav class="culinary-nav">
            <a href="${pageContext.request.contextPath}/feedRecetas" class="nav-brand">
                <i class="fas fa-mortar-pestle logo-icon"></i>
                <span>GastroBase</span>
            </a>



            <div class="nav-actions">
                <div class="user-profile" onclick="toggleProfileMenu()">
                    <span class="user-greeting">Hola, Chef ${sessionScope.usuario.nombre}</span>
                    <img src="${pageContext.request.contextPath}/${sessionScope.usuario.urlAvatar}" alt="Perfil">
                    <div class="profile-menu">
                        <a href="${pageContext.request.contextPath}/views/MyProfile.jsp"><i class="fas fa-user"></i> Mi Perfil</a>
                        <a href="${pageContext.request.contextPath}/views/login.jsp"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Contenido principal -->
        <main class="profile-main">
            <!-- Cabecera del perfil -->
            <div class="profile-header">
                <div class="profile-banner">
                    <div class="banner-content">
                        <i class="fas fa-utensils banner-icon"></i>
                    </div>
                </div>
                <div class="profile-info">
                    <div class="profile-avatar">
                        <img src="${pageContext.request.contextPath}/${sessionScope.usuario.urlAvatar}" alt="Avatar">
                    </div>
                    <div class="profile-details">
                        <div class="profile-heading">
                            <h1>Chef ${sessionScope.usuario.nombre} ${sessionScope.usuario.apellido}</h1>
                            <button class="edit-profile-btn">
                                <i class="fas fa-pencil-alt"></i> Editar Perfil
                            </button>
                        </div>
                        <p class="profile-bio">👨🍳 Apasionado de la cocina molecular | 🏆 Ganador de MasterChef 2023</p>
                        <div class="profile-stats">
                            <div class="stat-item">
                                <span class="stat-number">1.2k</span>
                                <span class="stat-label">Seguidores</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">850</span>
                                <span class="stat-label">Seguidos</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">45</span>
                                <span class="stat-label">Recetas</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">326</span>
                                <span class="stat-label">Favoritos</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





            <!-- Modal para editar receta -->
            <div class="new-recipe-modal" id="editRecipeModal">
                <div class="modal-content">
                    <span class="close-modal" onclick="closeEditRecipeModal()">&times;</span>
                    <h2><i class="fas fa-utensils"></i> Editar Receta</h2>

                    <form class="recipe-form" id="editRecipeForm"
                          action="${pageContext.request.contextPath}/editarReceta"
                          method="POST">

                        <!-- Campo oculto con el ID de la receta -->
                        <input type="hidden" name="idReceta" value="${receta.idReceta}">

                        <div class="form-group">
                            <label>Título de la receta</label>
                            <input type="text" name="titulo" value="${receta.nombre}" required>
                        </div>

                        <div class="specs-grid">
                            <div class="form-group">
                                <label><i class="fas fa-clock"></i> Tiempo (min)</label>
                                <input type="number" name="tiempo" min="1" value="${receta.tiempo}" required>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-users"></i> Personas</label>
                                <input type="number" name="personas" min="1" value="${receta.numPersonas}" required>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-signal"></i> Complejidad</label>
                                <select name="complejidad" required>
                                    <option value="">Seleccionar...</option>
                                    <option ${receta.complejidad == 'Fácil' ? 'selected' : ''}>Fácil</option>
                                    <option ${receta.complejidad == 'Media' ? 'selected' : ''}>Media</option>
                                    <option ${receta.complejidad == 'Difícil' ? 'selected' : ''}>Difícil</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-carrot"></i> Ingredientes</label>
                            <textarea name="ingredientes" rows="4" required>${receta.ingredientes}</textarea>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-list-ol"></i> Instrucciones</label>
                            <textarea name="instrucciones" rows="6" required>${receta.instrucciones}</textarea>
                        </div>


                        <div class="form-actions">
                            <button type="button" class="cancel-btn" onclick="closeEditRecipeModal()">Cancelar</button>
                            <button type="submit" class="publish-btn">
                                <i class="fas fa-save"></i> Guardar Cambios
                            </button>
                        </div>
                    </form>
                </div>
            </div>



            <!-- Sección de contenido -->
            <div class="profile-content">
                <!-- Información personal -->
                <section class="personal-info-section">
                    <h2><i class="fas fa-user-circle"></i> Información Personal</h2>
                    <div class="info-grid">
                        <div class="info-item">
                            <label>Nombre completo:</label>
                            <p>${sessionScope.usuario.nombre} ${sessionScope.usuario.apellido}</p>
                        </div>
                        <div class="info-item">
                            <label>Fecha de nacimiento:</label>
                            <p>${sessionScope.usuario.fechaNacimiento}</p>
                        </div>
                        <div class="info-item">
                            <label>País:</label>
                            <p>${sessionScope.usuario.pais}</p>
                        </div>
                        <div class="info-item">
                            <label>Telefono:</label>
                            <p>${sessionScope.usuario.telefono}</p>
                        </div>
                    </div>
                </section>

                <!-- Tabs de navegación corregidos -->
                <div class="profile-tabs">
                    <button class="tab-button active" onclick="openTab('my-recipes', event)">
                        <i class="fas fa-book-open"></i> Mis Recetas
                    </button>
                    <button class="tab-button" onclick="openTab('favorites', event)">
                        <i class="fas fa-heart"></i> Favoritos
                    </button>
                    <button class="tab-button" onclick="openTab('followers', event)">
                        <i class="fas fa-users"></i> Seguidores
                    </button>
                    <button class="tab-button" onclick="openTab('following', event)">
                        <i class="fas fa-user-friends"></i> Siguiendo
                    </button>
                </div>

                <!-- Contenido de tabs -->
                <div id="my-recipes" class="tab-content active">
                    <div class="recipes-header">
                        <h3>Mis Creaciones Culinarias</h3>
                        <button class="new-recipe-btn" onclick="openRecipeModal()">
                            <i class="fas fa-plus"></i> Nueva Receta
                        </button>
                    </div>
                    <div class="recipes-grid">

                        <div class="recipes-grid">
                            <c:forEach var="receta" items="${misRecetas}">
                                <article class="recipe-card">
                                    <div class="recipe-header">
                                        <img src="${pageContext.request.contextPath}/${receta.fotos[0].url}" alt="${receta.nombre}">
                                        <div class="recipe-meta">
                                            <h3>${receta.nombre}</h3>
                                            <div class="recipe-stats">
                                                <span><i class="fas fa-clock"></i> ${receta.tiempo} min</span>
                                                <span><i class="fas fa-users"></i> ${receta.numPersonas} personas</span>
                                                <span><i class="fas fa-chart-line"></i> ${receta.complejidad}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recipe-actions">
                                        <button class="edit-btn"
                                                onclick='openEditRecipeModal(
                                                ${receta.idReceta},
                                                                "${fn:escapeXml(receta.nombre)}",
                                                ${receta.tiempo},
                                                ${receta.numPersonas},
                                                                "${receta.complejidad}",
                                                                "${fn:escapeXml(receta.ingredientes)}",
                                                                "${fn:escapeXml(receta.proceso)}"
                                                                )'>
                                            <i class="fas fa-edit"></i> Editar
                                        </button>


                                        <form method="post" action="${pageContext.request.contextPath}/eliminarReceta"
                                              onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta receta?');"
                                              style="display: inline;">
                                            <input type="hidden" name="idReceta" value="${receta.idReceta}">
                                            <button type="submit" class="delete-btn">
                                                <i class="fas fa-trash"></i> Eliminar
                                            </button>
                                        </form>
                                    </div>
                                </article>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal para nueva receta -->
            <div class="new-recipe-modal" id="recipeModal">
                <div class="modal-content">
                    <span class="close-modal" onclick="closeRecipeModal()">&times;</span>
                    <h2><i class="fas fa-utensils"></i> Nueva Receta</h2>
                    <form class="recipe-form" id="recipeForm"
                          action="${pageContext.request.contextPath}/compartirReceta"
                          method="POST"
                          enctype="multipart/form-data">

                        <div class="form-group">
                            <label>Título de la receta</label>
                            <input type="text" name="titulo" placeholder="Ej: Paella Valenciana" required>
                        </div>

                        <div class="specs-grid">
                            <div class="form-group">
                                <label><i class="fas fa-clock"></i> Tiempo (min)</label>
                                <input type="number" name="tiempo" min="1" placeholder="30" required>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-users"></i> Personas</label>
                                <input type="number" name="personas" min="1" placeholder="4" required>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-signal"></i> Complejidad</label>
                                <select name="complejidad" required>
                                    <option value="">Seleccionar...</option>
                                    <option>Fácil</option>
                                    <option>Media</option>
                                    <option>Difícil</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-carrot"></i> Ingredientes</label>
                            <textarea name="ingredientes" rows="4" placeholder="1 taza de arroz..." required></textarea>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-list-ol"></i> Instrucciones</label>
                            <textarea name="instrucciones" rows="6" placeholder="1. Calentar el aceite..." required></textarea>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-camera"></i> Fotos de la receta</label>
                            <div class="file-upload" id="fileUploadContainer">
                                <input type="file" name="fotos" accept="image/*" multiple id="photoUpload">
                                <div class="upload-content">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                    <span>Haz clic o arrastra hasta 5 fotos</span>
                                    <div class="preview-grid" id="previewContainer"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="button" class="cancel-btn" onclick="closeRecipeModal()">Cancelar</button>
                            <button type="submit" class="publish-btn">
                                <i class="fas fa-fire"></i> Publicar Receta
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="favorites" class="tab-content">
                <div class="recipes-grid">
                    <article class="recipe-card favorite">
                        <div class="recipe-header">
                            <img src="https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445" alt="Favorito">
                            <div class="favorite-badge"><i class="fas fa-heart"></i></div>
                            <div class="recipe-meta">
                                <h3>Hamburguesa Gourmet</h3>
                                <div class="recipe-stats">
                                    <span><i class="fas fa-user"></i> Chef María</span>
                                    <span><i class="fas fa-star"></i> 4.9</span>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>

            <div id="followers" class="tab-content">
                <div class="followers-grid">
                    <div class="follower-card">
                        <img src="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79" alt="Seguidor">
                        <h4>Juan Pérez</h4>
                        <p>Chef profesional</p>
                        <button class="follow-btn">Seguir</button>
                    </div>
                    <div class="follower-card">
                        <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80" alt="Seguidora">
                        <h4>Laura Gómez</h4>
                        <p>Food blogger</p>
                        <button class="follow-btn">Seguir</button>
                    </div>
                </div>
            </div>

            <div id="following" class="tab-content">
                <div class="followers-grid">
                    <div class="follower-card">
                        <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956" alt="Seguido">
                        <h4>Ana García</h4>
                        <p>Especialista en postres</p>
                        <button class="unfollow-btn">Dejar de seguir</button>
                    </div>
                    <div class="follower-card">
                        <img src="https://images.unsplash.com/photo-1547425260-76bcadfb4f2c" alt="Seguido">
                        <h4>Carlos Ruiz</h4>
                        <p>Chef internacional</p>
                        <button class="unfollow-btn">Dejar de seguir</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="${pageContext.request.contextPath}/js/scriptRecetas.js"></script>
</body>
</html>