<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dominio.Receta"%>
<%
    List<Receta> recetas = (List<Receta>) request.getAttribute("recetas");
    String imagenPorDefecto = "https://via.placeholder.com/500x300.png?text=Foto+Receta";
%>
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
        <nav class="culinary-nav">
            <div class="nav-brand">
                <i class="fas fa-mortar-pestle logo-icon"></i>
                <span>GastroBase</span>
            </div>
            <div class="nav-search">
                <input type="text" placeholder="Buscar recetas, ingredientes...">
                <button class="spice-button"><i class="fas fa-search"></i></button>
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

        <!-- Modal para nueva receta -->
        <div class="new-recipe-modal" id="recipeModal">
            <div class="modal-content">
                <span class="close-modal" onclick="closeRecipeModal()">&times;</span>
                <h2><i class="fas fa-utensils"></i> Nueva Receta</h2>
                <form class="recipe-form" action="/recetas" method="POST" enctype="multipart/form-data"  id="recipeForm">
                    <div class="form-group">
                        <label>Título de la receta</label>
                        <input name="titulo" type="text" placeholder="Ej: Paella Valenciana" required>
                    </div>

                    <div class="specs-grid">
                        <div class="form-group">
                            <label><i class="fas fa-clock"></i> Tiempo (min)</label>
                            <input name="tiempo" type="number" min="1" placeholder="30" required>
                        </div>

                        <div class="form-group">
                            <label><i class="fas fa-users"></i> Personas</label>
                            <input name="personas" type="number" min="1" placeholder="4" required>
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
                        <textarea name="ingredientes"rows="4" placeholder="1 taza de arroz..." required></textarea>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-list-ol"></i> Instrucciones</label>
                        <textarea name="instrucciones "rows="6" placeholder="1. Calentar el aceite..." required></textarea>
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

        <main class="culinary-main">
            <section class="recipe-feed">
                <h2 class="section-title">Recetas del Momento 🔥</h2>

                <% if (recetas != null) {
                        for (Receta receta : recetas) {
                %>
                <article class="recipe-card">
                    <div class="recipe-header">
                        <img src="<%= imagenPorDefecto%>" alt="<%= receta.getTitulo()%>">
                        <div class="recipe-meta">
                            <h3><%= receta.getTitulo()%></h3>
                            <div class="author-info">
                                <img src="https://via.placeholder.com/40" alt="Chef">
                                <span>Chef Anónimo</span>
                            </div>
                            <div class="recipe-stats">
                                <span><i class="fas fa-clock"></i> <%= receta.getTiempo()%> min</span>
                                <span><i class="fas fa-utensils"></i> <%= receta.getPersonas()%> personas</span>
                                <span><i class="fas fa-chart-line"></i> <%= receta.getComplejidad()%></span>
                            </div>
                        </div>
                    </div>
                    <div class="recipe-content">
                        <p><strong>Ingredientes:</strong> <%= receta.getIngredientes()%></p>
                        <p><strong>Instrucciones:</strong> <%= receta.getInstrucciones()%></p>
                        <div class="recipe-actions">
                            <button class="like-btn"><i class="fas fa-heart"></i> 0</button>
                            <button class="comment-btn"><i class="fas fa-comment"></i> 0</button>
                            <button class="save-btn"><i class="fas fa-bookmark"></i></button>
                        </div>
                    </div>
                </article>
                <% }
                    }%>
            </section>

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
                    </div>
                </div>
            </aside>
        </main>

        <div class="floating-action">
            <button class="flame-button-circle" onclick="openRecipeModal()">
                <i class="fas fa-plus"></i>
            </button>
        </div>

        <script src="${pageContext.request.contextPath}/js/scriptRecetas.js"></script>
    </body>
</html>
