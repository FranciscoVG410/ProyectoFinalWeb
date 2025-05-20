<%-- 
    Document   : home
    Created on : 3 may 2025, 09:00:00 a.m.
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="${pageContext.request.contextPath}/views/Home.jsp" class="nav-brand">
                <i class="fas fa-mortar-pestle logo-icon"></i>
                <span>GastroBase</span>
            </a>

            <div class="nav-search">
                <input type="text" placeholder="Buscar recetas, ingredientes...">
                <button class="spice-button">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <div class="nav-actions">
                <div class="user-profile" onclick="toggleProfileMenu()">
                    <span class="user-greeting">Hola, Chef ${sessionScope.usuario.nombre}</span>
                    <img src="${pageContext.request.contextPath}/${sessionScope.usuario.urlAvatar}" alt="Perfil">
                    <div class="profile-menu">
                        <a href="${pageContext.request.contextPath}/misRecetasServlet"><i class="fas fa-user"></i> Mi Perfil</a>
                        <a href="${pageContext.request.contextPath}/views/login.jsp"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>

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


        <!-- Contenido principal -->
        <main class="culinary-main">
            <section class="recipe-feed">
                <h2 class="section-title">Recetas del Momento 🔥</h2>

                <!-- Receta 1 - Pasta Carbonara -->
                <article class="recipe-card">
                    <div class="recipe-header">
                        <img src="https://images.unsplash.com/photo-1588013273468-315fd88ea34c" alt="Pasta Carbonara">
                        <div class="recipe-meta">
                            <h3>Carbonara Auténtica</h3>
                            <div class="author-info">
                                <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36" alt="Chef">
                                <span>Marco Bianchi</span>
                            </div>
                            <div class="recipe-stats">
                                <span><i class="fas fa-clock"></i> 25 min</span>
                                <span><i class="fas fa-utensils"></i> 2 personas</span>
                                <span><i class="fas fa-chart-line"></i> Media</span>
                            </div>
                        </div>
                    </div>
                    <div class="recipe-content">
                        <p>La verdadera carbonara romana con guanciale crujiente y salsa cremosa de huevo.</p>
                        <div class="recipe-actions">
                            <button class="like-btn">
                                <i class="fas fa-heart"></i> 328
                            </button>
                            <button class="comment-btn">
                                <i class="fas fa-comment"></i> 45
                            </button>
                            <button class="save-btn">
                                <i class="fas fa-bookmark"></i>
                            </button>
                        </div>
                    </div>
                </article>

                <!-- Receta 2 - Sushi -->
                <article class="recipe-card">
                    <div class="recipe-header">
                        <img src="https://images.unsplash.com/photo-1579871494447-9811cf80d66c" alt="Sushi">
                        <div class="recipe-meta">
                            <h3>Sushi Artesanal</h3>
                            <div class="author-info">
                                <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2" alt="Chef">
                                <span>Yuki Tanaka</span>
                            </div>
                            <div class="recipe-stats">
                                <span><i class="fas fa-clock"></i> 1.5 hrs</span>
                                <span><i class="fas fa-utensils"></i> 4 personas</span>
                                <span><i class="fas fa-chart-line"></i> Alta</span>
                            </div>
                        </div>
                    </div>
                    <div class="recipe-content">
                        <p>Rollos de salmón fresco con arroz avinagrado y wasabi casero.</p>
                        <div class="recipe-actions">
                            <button class="like-btn">
                                <i class="fas fa-heart"></i> 512
                            </button>
                            <button class="comment-btn">
                                <i class="fas fa-comment"></i> 89
                            </button>
                            <button class="save-btn">
                                <i class="fas fa-bookmark"></i>
                            </button>
                        </div>
                    </div>
                </article>            
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
                        <div class="chef-card">
                            <img src="https://images.unsplash.com/photo-1581299894007-aaa50297cf16" alt="Chef">
                            <h5>Carlos Gutiérrez</h5>
                            <p>25 recetas</p>
                            <button class="follow-btn">Seguir</button>
                        </div>
                        <div class="chef-card">
                            <div class="chef-avatar-placeholder">
                                <i class="fas fa-user"></i>
                            </div>
                            <h5>Sophie Martin</h5>
                            <p>18 recetas</p>
                            <button class="follow-btn">Seguir</button>
                        </div>
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