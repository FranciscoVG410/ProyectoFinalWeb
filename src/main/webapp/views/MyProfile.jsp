<%-- 
    Document   : perfil
    Created on : 3 may 2025, 09:00:00 a.m.
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <span class="user-greeting">Hola, Chef Alejandro</span>
                    <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde" alt="Perfil">
                    <div class="profile-menu">
                        <a href="${pageContext.request.contextPath}/perfil"><i class="fas fa-user"></i> Mi Perfil</a>
                        <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
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
                        <img src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde" alt="Avatar">
                    </div>
                    <div class="profile-details">
                        <div class="profile-heading">
                            <h1>Chef Alejandro Martínez</h1>
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

            <!-- Sección de contenido -->
            <div class="profile-content">
                <!-- Información personal -->
                <section class="personal-info-section">
                    <h2><i class="fas fa-user-circle"></i> Información Personal</h2>
                    <div class="info-grid">
                        <div class="info-item">
                            <label>Nombre completo:</label>
                            <p>Alejandro Martínez Rojas</p>
                        </div>
                        <div class="info-item">
                            <label>Fecha de nacimiento:</label>
                            <p>15 Marzo 1990</p>
                        </div>
                        <div class="info-item">
                            <label>País:</label>
                            <p>🇪🇸 España</p>
                        </div>
                        <div class="info-item">
                            <label>Experiencia:</label>
                            <p>12 años en cocina profesional</p>
                        </div>
                    </div>
                </section>

                <!-- Tabs de navegación -->
                <div class="profile-tabs">
                    <button class="tab-button active" onclick="openTab('my-recipes')">
                        <i class="fas fa-book-open"></i> Mis Recetas
                    </button>
                    <button class="tab-button" onclick="openTab('favorites')">
                        <i class="fas fa-heart"></i> Favoritos
                    </button>
                    <button class="tab-button" onclick="openTab('followers')">
                        <i class="fas fa-users"></i> Seguidores
                    </button>
                    <button class="tab-button" onclick="openTab('following')">
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
                            <!-- Receta 1 -->
                            <article class="recipe-card">
                                <div class="recipe-header">
                                    <img src="https://images.unsplash.com/photo-1467003909585-2f8a72700288" alt="Salmón a la parrilla">
                                    <div class="recipe-meta">
                                        <h3>Salmón con Hierbas Provenzales</h3>
                                        <div class="recipe-stats">
                                            <span><i class="fas fa-heart"></i> 458</span>
                                            <span><i class="fas fa-comment"></i> 68</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="recipe-actions">
                                    <button class="edit-btn"><i class="fas fa-edit"></i> Editar</button>
                                    <button class="delete-btn"><i class="fas fa-trash"></i> Eliminar</button>
                                </div>
                            </article>

                            <!-- Receta 2 -->
                            <article class="recipe-card">
                                <div class="recipe-header">
                                    <img src="https://images.unsplash.com/photo-1578985545062-69928b1d9587" alt="Pastel de chocolate">
                                    <div class="recipe-meta">
                                        <h3>Volcán de Chocolate Negro</h3>
                                        <div class="recipe-stats">
                                            <span><i class="fas fa-heart"></i> 892</span>
                                            <span><i class="fas fa-comment"></i> 124</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="recipe-actions">
                                    <button class="edit-btn"><i class="fas fa-edit"></i> Editar</button>
                                    <button class="delete-btn"><i class="fas fa-trash"></i> Eliminar</button>
                                </div>
                            </article>

                            <!-- Receta 3 -->
                            <article class="recipe-card">
                                <div class="recipe-header">
                                    <img src="https://images.unsplash.com/photo-1598214886806-c87b84b7078b" alt="Risotto">
                                    <div class="recipe-meta">
                                        <h3>Risotto de Hongos Silvestres</h3>
                                        <div class="recipe-stats">
                                            <span><i class="fas fa-heart"></i> 672</span>
                                            <span><i class="fas fa-comment"></i> 89</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="recipe-actions">
                                    <button class="edit-btn"><i class="fas fa-edit"></i> Editar</button>
                                    <button class="delete-btn"><i class="fas fa-trash"></i> Eliminar</button>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>

            <div class="new-recipe-modal" id="recipeModal">
                <div class="modal-content">
                    <span class="close-modal" onclick="closeRecipeModal()">&times;</span>
                    <h2><i class="fas fa-utensils"></i> Nueva Receta</h2>
                    <form class="recipe-form" id="recipeForm">
                        <div class="form-group">
                            <label>Título de la receta</label>
                            <input type="text" placeholder="Ej: Paella Valenciana" required>
                        </div>

                        <div class="specs-grid">
                            <div class="form-group">
                                <label><i class="fas fa-clock"></i> Tiempo (min)</label>
                                <input type="number" min="1" placeholder="30" required>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-users"></i> Personas</label>
                                <input type="number" min="1" placeholder="4" required>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-signal"></i> Complejidad</label>
                                <select required>
                                    <option value="">Seleccionar...</option>
                                    <option>Fácil</option>
                                    <option>Media</option>
                                    <option>Difícil</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-carrot"></i> Ingredientes</label>
                            <textarea rows="4" placeholder="1 taza de arroz..." required></textarea>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-list-ol"></i> Instrucciones</label>
                            <textarea rows="6" placeholder="1. Calentar el aceite..." required></textarea>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-camera"></i> Fotos de la receta</label>
                            <div class="file-upload" id="fileUploadContainer">
                                <input type="file" accept="image/*" multiple id="photoUpload">
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

<script src="${pageContext.request.contextPath}/js/scriptMyProfile.js"></script>
</body>
</html>