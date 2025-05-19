<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de Usuario - GastroBase</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloHome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloProfile.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Estilos específicos para el perfil */
            .profile-main {
                max-width: 1200px;
                margin: 2rem auto;
                padding: 0 1rem;
            }

            .profile-header {
                position: relative;
                margin-bottom: 2rem;
            }

            .profile-cover {
                position: relative;
                height: 300px;
                overflow: hidden;
                border-radius: 15px;
            }

            .profile-cover img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .profile-info {
                display: flex;
                gap: 2rem;
                margin-top: -50px;
                padding: 0 2rem;
                align-items: flex-end;
            }

            .profile-avatar {
                position: relative;
                z-index: 2;
            }

            .profile-avatar img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                border: 5px solid white;
                object-fit: cover;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }

            .profile-details {
                flex: 1;
            }

            .profile-details h1 {
                font-family: 'Playfair Display', serif;
                color: #2C3E50;
                margin-bottom: 0.5rem;
            }

            .profile-bio {
                color: #666;
                margin-bottom: 1.5rem;
                line-height: 1.6;
            }

            .profile-stats {
                display: flex;
                gap: 2rem;
            }

            .stat-item {
                text-align: center;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .stat-item:hover {
                transform: translateY(-3px);
            }

            .stat-number {
                display: block;
                font-size: 1.5rem;
                font-weight: 700;
                color: #FF6B35;
            }

            .stat-label {
                font-size: 0.9rem;
                color: #666;
            }

            /* Pestañas */
            .profile-tabs {
                display: flex;
                border-bottom: 2px solid #eee;
                margin-bottom: 2rem;
            }

            .tab-button {
                padding: 0.8rem 1.5rem;
                background: none;
                border: none;
                font-size: 1rem;
                font-weight: 600;
                color: #666;
                cursor: pointer;
                position: relative;
            }

            .tab-button.active {
                color: #FF6B35;
            }

            .tab-button.active::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 100%;
                height: 3px;
                background: #FF6B35;
            }

            /* Contenido de pestañas */
            .tab-content {
                display: none;
            }

            .tab-content.active {
                display: block;
            }

            /* Recetas en grid */
            .recipes-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
                margin: 2rem 0;
            }

            .recipe-card-mini {
                background: white;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
            }

            .recipe-card-mini:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }

            .recipe-card-mini img {
                width: 100%;
                height: 180px;
                object-fit: cover;
            }

            .recipe-info {
                padding: 1rem;
            }

            .recipe-info h3 {
                font-size: 1rem;
                margin-bottom: 0.8rem;
                color: #2C3E50;
            }

            /* Botones de acción */
            .recipe-actions-mini {
                display: flex;
                justify-content: space-between;
            }

            .like-btn, .save-btn {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 0.9rem;
                display: flex;
                align-items: center;
                gap: 5px;
                padding: 0.3rem 0.8rem;
                border-radius: 15px;
                transition: all 0.3s ease;
            }

            .like-btn {
                color: #666;
            }

            .like-btn.liked {
                color: #FF6B35;
            }

            .like-btn:hover {
                background: rgba(255,107,53,0.1);
            }

            .save-btn {
                color: #666;
            }

            .save-btn.saved {
                color: #2D1A12;
            }

            .save-btn:hover {
                background: rgba(45,26,18,0.1);
            }

            /* Botón de seguir */
            .follow-btn {
                background: linear-gradient(45deg, #FF6B35, #2ECC71);
                color: white;
                border: none;
                padding: 0.6rem 1.2rem;
                border-radius: 25px;
                cursor: pointer;
                font-weight: 600;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 0.9rem;
                margin-top: 1rem;
            }

            .follow-btn:hover {
                transform: scale(1.05);
                box-shadow: 0 5px 15px rgba(255,107,53,0.3);
            }

            .follow-btn.following {
                background: #eee;
                color: #2C3E50;
            }

            /* Modales */
            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
                align-items: center;
                justify-content: center;
                z-index: 2000;
            }

            .modal-content {
                background: white;
                width: 90%;
                max-width: 500px;
                max-height: 80vh;
                overflow-y: auto;
                padding: 25px;
                border-radius: 15px;
                box-shadow: 0 0 30px rgba(0,0,0,0.2);
                position: relative;
            }

            .modal h2 {
                margin-bottom: 1.5rem;
                color: #2C3E50;
                font-family: 'Playfair Display', serif;
            }

            .close-modal {
                position: absolute;
                top: 15px;
                right: 20px;
                font-size: 28px;
                cursor: pointer;
                color: #666;
                transition: color 0.3s ease;
            }

            .close-modal:hover {
                color: #FF6B35;
            }

            /* Lista de seguidores */
            .followers-list {
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            .follower-item {
                display: flex;
                align-items: center;
                gap: 1rem;
                padding: 0.8rem;
                border-radius: 10px;
                transition: all 0.3s ease;
            }

            .follower-item:hover {
                background: rgba(0,0,0,0.03);
            }

            .follower-item img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                object-fit: cover;
            }

            .follower-info {
                flex: 1;
            }

            .follower-info h4 {
                font-size: 1rem;
                margin-bottom: 0.3rem;
            }

            .follower-info p {
                font-size: 0.8rem;
                color: #666;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .profile-info {
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    padding: 0 1rem;
                }

                .profile-stats {
                    justify-content: center;
                }

                .recipes-grid {
                    grid-template-columns: 1fr;
                }

                .recipe-actions-mini {
                    flex-direction: column;
                    gap: 0.5rem;
                }
            }
        </style>
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

        <!-- Contenido principal del perfil -->
        <main class="profile-main">
            <!-- Encabezado del perfil -->
            <section class="profile-header">
                <div class="profile-cover">
                    <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836" alt="Portada del perfil">
                </div>

                <div class="profile-info">
                    <div class="profile-avatar">
                        <img src="https://images.unsplash.com/photo-1581299894007-aaa50297cf16" alt="Avatar del usuario">
                        <button class="follow-btn" id="followButton">
                            <i class="fas fa-user-plus"></i> Seguir
                        </button>
                    </div>

                    <div class="profile-details">
                        <h1>Carlos Gutiérrez</h1>
                        <p class="profile-bio">Chef profesional especializado en cocina fusión. Amante de los sabores intensos y las presentaciones creativas.</p>

                        <div class="profile-stats">
                            <div class="stat-item" onclick="showTab('recipes')">
                                <span class="stat-number">25</span>
                                <span class="stat-label">Recetas</span>
                            </div>
                            <div class="stat-item" onclick="showFollowers()">
                                <span class="stat-number">1.2k</span>
                                <span class="stat-label">Seguidores</span>
                            </div>
                            <div class="stat-item" onclick="showFollowing()">
                                <span class="stat-number">350</span>
                                <span class="stat-label">Siguiendo</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Pestañas -->
            <section class="profile-tabs">
                <button class="tab-button active" onclick="showTab('recipes')">
                    <i class="fas fa-utensils"></i> Recetas
                </button>
                <button class="tab-button" onclick="showTab('saved')">
                    <i class="fas fa-bookmark"></i> Guardadas
                </button>
                <button class="tab-button" onclick="showTab('favorites')">
                    <i class="fas fa-heart"></i> Favoritas
                </button>
            </section>

            <!-- Contenido: Recetas -->
            <section class="tab-content active" id="recipes-tab">
                <div class="recipes-grid">
                    <!-- Receta 1 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c" alt="Ensalada César">
                        <div class="recipe-info">
                            <h3>Ensalada César Clásica</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn" onclick="toggleLike(this)">
                                    <i class="far fa-heart"></i> <span>245</span>
                                </button>
                                <button class="save-btn" onclick="toggleSave(this)">
                                    <i class="far fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Receta 2 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd" alt="Bowl Vegano">
                        <div class="recipe-info">
                            <h3>Buddha Bowl Vegano</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn" onclick="toggleLike(this)">
                                    <i class="far fa-heart"></i> <span>189</span>
                                </button>
                                <button class="save-btn" onclick="toggleSave(this)">
                                    <i class="far fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Receta 3 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1482049016688-2d3e1b311543" alt="Tostadas Aguacate">
                        <div class="recipe-info">
                            <h3>Tostadas de Aguacate</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn liked" onclick="toggleLike(this)">
                                    <i class="fas fa-heart"></i> <span>312</span>
                                </button>
                                <button class="save-btn saved" onclick="toggleSave(this)">
                                    <i class="fas fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Receta 4 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1547592180-85f173990554" alt="Pasta Alfredo">
                        <div class="recipe-info">
                            <h3>Pasta Alfredo Cremosa</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn" onclick="toggleLike(this)">
                                    <i class="far fa-heart"></i> <span>428</span>
                                </button>
                                <button class="save-btn" onclick="toggleSave(this)">
                                    <i class="far fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                </div>

                <button class="load-more">Ver más recetas</button>
            </section>

            <!-- Contenido: Recetas guardadas -->
            <section class="tab-content" id="saved-tab">
                <div class="recipes-grid">
                    <!-- Receta guardada 1 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1484723091739-30a097e8f929" alt="Panqueques">
                        <div class="recipe-info">
                            <h3>Panqueques Especiales</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn" onclick="toggleLike(this)">
                                    <i class="far fa-heart"></i> <span>320</span>
                                </button>
                                <button class="save-btn saved" onclick="toggleSave(this)">
                                    <i class="fas fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Receta guardada 2 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1490645935967-10de6ba17061" alt="Pasta">
                        <div class="recipe-info">
                            <h3>Pasta Alfredo Especial</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn liked" onclick="toggleLike(this)">
                                    <i class="fas fa-heart"></i> <span>428</span>
                                </button>
                                <button class="save-btn saved" onclick="toggleSave(this)">
                                    <i class="fas fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                </div>
            </section>

            <!-- Contenido: Recetas favoritas -->
            <section class="tab-content" id="favorites-tab">
                <div class="recipes-grid">
                    <!-- Receta favorita 1 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c" alt="Ensalada César">
                        <div class="recipe-info">
                            <h3>Ensalada César Clásica</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn liked" onclick="toggleLike(this)">
                                    <i class="fas fa-heart"></i> <span>245</span>
                                </button>
                                <button class="save-btn" onclick="toggleSave(this)">
                                    <i class="far fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Receta favorita 2 -->
                    <article class="recipe-card-mini">
                        <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd" alt="Bowl Vegano">
                        <div class="recipe-info">
                            <h3>Buddha Bowl Vegano</h3>
                            <div class="recipe-actions-mini">
                                <button class="like-btn liked" onclick="toggleLike(this)">
                                    <i class="fas fa-heart"></i> <span>189</span>
                                </button>
                                <button class="save-btn saved" onclick="toggleSave(this)">
                                    <i class="fas fa-bookmark"></i>
                                </button>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
        </main>

        <!-- Modal de seguidores -->
        <div class="modal" id="followersModal">
            <div class="modal-content">
                <span class="close-modal" onclick="closeModal('followersModal')">&times;</span>
                <h2>Seguidores</h2>
                <div class="followers-list">
                    <!-- Seguidor 1 -->
                    <div class="follower-item">
                        <img src="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79" alt="Seguidor">
                        <div class="follower-info">
                            <h4>María López</h4>
                            <p>45 recetas</p>
                        </div>
                        <button class="follow-btn small">Seguir</button>
                    </div>

                    <!-- Seguidor 2 -->
                    <div class="follower-item">
                        <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80" alt="Seguidor">
                        <div class="follower-info">
                            <h4>Ana Martínez</h4>
                            <p>32 recetas</p>
                        </div>
                        <button class="follow-btn small following">Dejar de seguir</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de seguidos -->
        <div class="modal" id="followingModal">
            <div class="modal-content">
                <span class="close-modal" onclick="closeModal('followingModal')">&times;</span>
                <h2>Siguiendo</h2>
                <div class="followers-list">
                    <!-- Seguido 1 -->
                    <div class="follower-item">
                        <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2" alt="Seguido">
                        <div class="follower-info">
                            <h4>Yuki Tanaka</h4>
                            <p>28 recetas</p>
                        </div>
                        <button class="follow-btn small following">Dejar de seguir</button>
                    </div>

                    <!-- Seguido 2 -->
                    <div class="follower-item">
                        <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36" alt="Seguido">
                        <div class="follower-info">
                            <h4>Marco Bianchi</h4>
                            <p>36 recetas</p>
                        </div>
                        <button class="follow-btn small following">Dejar de seguir</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Función para alternar el menú de perfil
            function toggleProfileMenu() {
                const menu = document.querySelector('.profile-menu');
                menu.classList.toggle('show');
            }

            // Función para cambiar entre pestañas
            function showTab(tabId) {
                // Ocultar todos los contenidos de pestañas
                document.querySelectorAll('.tab-content').forEach(tab => {
                    tab.classList.remove('active');
                });

                // Desactivar todos los botones de pestañas
                document.querySelectorAll('.tab-button').forEach(button => {
                    button.classList.remove('active');
                });

                // Mostrar la pestaña seleccionada
                document.getElementById(tabId + '-tab').classList.add('active');

                // Activar el botón de la pestaña seleccionada
                event.currentTarget.classList.add('active');
            }

            // Función para seguir/dejar de seguir
            const followButton = document.getElementById('followButton');
            let isFollowing = false;

            followButton.addEventListener('click', function () {
                isFollowing = !isFollowing;

                if (isFollowing) {
                    this.innerHTML = '<i class="fas fa-user-check"></i> Siguiendo';
                    this.classList.add('following');
                    // Aquí iría la llamada AJAX para seguir al usuario
                    console.log('Siguiendo al usuario');
                } else {
                    this.innerHTML = '<i class="fas fa-user-plus"></i> Seguir';
                    this.classList.remove('following');
                    // Aquí iría la llamada AJAX para dejar de seguir al usuario
                    console.log('Dejando de seguir al usuario');
                }
            });

            // Función para like/dislike
            function toggleLike(button) {
                const likeIcon = button.querySelector('i');
                const likeCount = button.querySelector('span');
                let currentLikes = parseInt(likeCount.textContent);

                if (button.classList.contains('liked')) {
                    likeIcon.classList.replace('fas', 'far');
                    button.classList.remove('liked');
                    likeCount.textContent = currentLikes - 1;
                    // Aquí iría la llamada AJAX para quitar like
                    console.log('Like eliminado');
                } else {
                    likeIcon.classList.replace('far', 'fas');
                    button.classList.add('liked');
                    likeCount.textContent = currentLikes + 1;
                    // Aquí iría la llamada AJAX para dar like
                    console.log('Like añadido');
                }
            }

            // Función para guardar/desguardar receta
            function toggleSave(button) {
                const saveIcon = button.querySelector('i');

                if (button.classList.contains('saved')) {
                    saveIcon.classList.replace('fas', 'far');
                    button.classList.remove('saved');
                    // Aquí iría la llamada AJAX para quitar de guardados
                    console.log('Receta eliminada de guardados');
                } else {
                    saveIcon.classList.replace('far', 'fas');
                    button.classList.add('saved');
                    // Aquí iría la llamada AJAX para guardar receta
                    console.log('Receta guardada');
                }
            }

            // Funciones para mostrar modales de seguidores/seguidos
            function showFollowers() {
                document.getElementById('followersModal').style.display = 'flex';
            }

            function showFollowing() {
                document.getElementById('followingModal').style.display = 'flex';
            }

            function closeModal(modalId) {
                document.getElementById(modalId).style.display = 'none';
            }

            // Cerrar modales al hacer clic fuera del contenido
            window.onclick = function (event) {
                if (event.target.className === 'modal') {
                    event.target.style.display = 'none';
                }
            }

            // Función para seguir desde el modal
            document.querySelectorAll('.followers-list .follow-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    if (this.classList.contains('following')) {
                        this.innerHTML = 'Seguir';
                        this.classList.remove('following');
                        // AJAX para dejar de seguir
                    } else {
                        this.innerHTML = 'Dejar de seguir';
                        this.classList.add('following');
                        // AJAX para seguir
                    }
                });
            });
        </script>
    </body>
</html>