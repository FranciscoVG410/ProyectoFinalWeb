<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Receta - GastroBase</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloDetalleReceta.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Estilos adicionales para el carrusel y favoritos */
            .carousel-container {
                position: relative;
                overflow: hidden;
                border-radius: 8px;
                height: 400px;
            }
            
            .carousel-slide {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                opacity: 0;
                transition: opacity 0.5s ease-in-out;
            }
            
            .carousel-slide.active {
                opacity: 1;
            }
            
            .carousel-slide img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            
            .carousel-controls {
                position: absolute;
                top: 50%;
                width: 100%;
                display: flex;
                justify-content: space-between;
                transform: translateY(-50%);
                z-index: 10;
            }
            
            .carousel-btn {
                background: rgba(255, 255, 255, 0.7);
                border: none;
                padding: 10px;
                border-radius: 50%;
                cursor: pointer;
                transition: all 0.3s;
            }
            
            .carousel-btn:hover {
                background: rgba(255, 255, 255, 0.9);
            }
            
            .carousel-dots {
                position: absolute;
                bottom: 20px;
                left: 0;
                right: 0;
                display: flex;
                justify-content: center;
                gap: 10px;
                z-index: 10;
            }
            
            .dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.5);
                cursor: pointer;
                transition: all 0.3s;
            }
            
            .dot.active {
                background: white;
                transform: scale(1.2);
            }
            
            /* Estilos para favoritos */
            .save-recipe-btn {
                background: #ff6b6b;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 8px;
                font-weight: bold;
                transition: all 0.3s;
                margin-top: 15px;
            }
            
            .save-recipe-btn:hover {
                background: #ff5252;
                transform: translateY(-2px);
            }
            
            .save-recipe-btn.saved {
                background: #4caf50;
            }
            
            .save-recipe-btn.saved:hover {
                background: #3d8b40;
            }
            
            .saved-recipes-section {
                background: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
                margin-top: 30px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            
            .saved-recipes-section h2 {
                margin-bottom: 15px;
                color: #333;
            }
            
            .saved-recipes-list {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 15px;
            }
            
            .saved-recipe-card {
                background: white;
                border-radius: 5px;
                overflow: hidden;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                transition: transform 0.3s;
            }
            
            .saved-recipe-card:hover {
                transform: translateY(-5px);
            }
            
            .saved-recipe-img {
                height: 120px;
                width: 100%;
                object-fit: cover;
            }
            
            .saved-recipe-info {
                padding: 10px;
            }
            
            .saved-recipe-info h3 {
                margin: 0;
                font-size: 16px;
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
                        <a href="${pageContext.request.contextPath}/saved"><i class="fas fa-bookmark"></i> Mis Guardados</a>
                        <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Contenido principal -->
        <main class="recipe-container">
            <!-- Sección superior con título y metadatos -->
            <section class="recipe-header">
                <h1 class="recipe-title">Carbonara Auténtica</h1>
                <div class="recipe-meta">
                    <div class="meta-item">
                        <i class="fas fa-clock"></i>
                        <span>25 min</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-users"></i>
                        <span>2 personas</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-signal"></i>
                        <span>Media</span>
                    </div>
                    <div class="meta-item likes">
                        <i class="fas fa-heart"></i>
                        <span>328 likes</span>
                    </div>
                </div>
                
                <!-- Botón para guardar receta -->
                <button id="saveRecipeBtn" class="save-recipe-btn">
                    <i class="far fa-bookmark"></i>
                    <span>Guardar Receta</span>
                </button>
            </section>

            <!-- Sección principal con dos columnas -->
            <div class="recipe-main-content">
                <!-- Columna izquierda (fotos, ingredientes, instrucciones) -->
                <div class="recipe-content-left">
                    <!-- Carrusel de imágenes -->
                    <section class="recipe-carousel">
                        <div class="carousel-container">
                            <div class="carousel-slide active">
                                <img src="https://images.unsplash.com/photo-1588013273468-315fd88ea34c" alt="Pasta Carbonara 1">
                            </div>
                            <div class="carousel-slide">
                                <img src="https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb" alt="Pasta Carbonara 2">
                            </div>
                            <div class="carousel-slide">
                                <img src="https://images.unsplash.com/photo-1608212589631-7a685fc02755" alt="Pasta Carbonara 3">
                            </div>
                            <div class="carousel-slide">
                                <img src="https://images.unsplash.com/photo-1473093295043-cdd812d0e601" alt="Pasta Carbonara 4">
                            </div>
                            <div class="carousel-slide">
                                <img src="https://images.unsplash.com/photo-1606923829579-0cb981a83e2e" alt="Pasta Carbonara 5">
                            </div>
                        </div>
                        <div class="carousel-controls">
                            <button class="carousel-btn prev-btn"><i class="fas fa-chevron-left"></i></button>
                            <button class="carousel-btn next-btn"><i class="fas fa-chevron-right"></i></button>
                        </div>
                        <div class="carousel-dots">
                            <span class="dot active"></span>
                            <span class="dot"></span>
                            <span class="dot"></span>
                            <span class="dot"></span>
                            <span class="dot"></span>
                        </div>
                    </section>

                    <!-- Ingredientes -->
                    <section class="recipe-section ingredients">
                        <h2><i class="fas fa-carrot"></i> Ingredientes</h2>
                        <ul class="ingredients-list">
                            <li>400g de spaghetti</li>
                            <li>150g de guanciale (o panceta)</li>
                            <li>3 yemas de huevo + 1 huevo entero</li>
                            <li>50g de queso pecorino rallado</li>
                            <li>50g de queso parmesano rallado</li>
                            <li>Pimienta negra recién molida</li>
                            <li>Sal al gusto</li>
                        </ul>
                    </section>

                    <!-- Instrucciones -->
                    <section class="recipe-section instructions">
                        <h2><i class="fas fa-list-ol"></i> Instrucciones</h2>
                        <ol class="instructions-list">
                            <li>Cocinar la pasta en agua hirviendo con sal al dente.</li>
                            <li>Mientras, dorar el guanciale en una sartén hasta que esté crujiente.</li>
                            <li>En un tazón, batir las yemas y el huevo con los quesos rallados y pimienta.</li>
                            <li>Escurrir la pasta reservando un poco de agua de cocción.</li>
                            <li>Mezclar rápidamente la pasta con el guanciale y luego con la mezcla de huevo.</li>
                            <li>Añadir un poco de agua de cocción si es necesario para crear una salsa cremosa.</li>
                            <li>Servir inmediatamente con más queso rallado y pimienta.</li>
                        </ol>
                    </section>
                    
                    <!-- Sección de recetas guardadas (puede ser dinámica) -->
                    <section class="saved-recipes-section">
                        <h2><i class="fas fa-bookmark"></i> Tus Recetas Guardadas</h2>
                        <div class="saved-recipes-list">
                            <div class="saved-recipe-card">
                                <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c" alt="Ensalada" class="saved-recipe-img">
                                <div class="saved-recipe-info">
                                    <h3>Ensalada César</h3>
                                    <span>15 min</span>
                                </div>
                            </div>
                            <div class="saved-recipe-card">
                                <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd" alt="Bowl" class="saved-recipe-img">
                                <div class="saved-recipe-info">
                                    <h3>Buddha Bowl</h3>
                                    <span>20 min</span>
                                </div>
                            </div>
                            <div class="saved-recipe-card">
                                <img src="https://images.unsplash.com/photo-1484723091739-30a097e8f929" alt="Panqueques" class="saved-recipe-img">
                                <div class="saved-recipe-info">
                                    <h3>Panqueques Integrales</h3>
                                    <span>30 min</span>
                                </div>
                            </div>
                            <div class="saved-recipe-card">
                                <img src="https://images.unsplash.com/photo-1490645935967-10de6ba17061" alt="Pasta" class="saved-recipe-img">
                                <div class="saved-recipe-info">
                                    <h3>Pesto Casero</h3>
                                    <span>40 min</span>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Columna derecha (comentarios) -->
                <div class="recipe-content-right">
                    <!-- Comentarios -->
                    <section class="comments-section">
                        <div class="comments-header">
                            <h2><i class="fas fa-comments"></i> Comentarios</h2>
                            <span class="comment-count">45 comentarios</span>
                        </div>
                        
                        <!-- Formulario de comentario -->
                        <form class="comment-form">
                            <textarea placeholder="Escribe tu comentario..." required></textarea>
                            <button type="submit" class="submit-btn">Publicar comentario</button>
                        </form>
                        
                        <!-- Lista de comentarios -->
                        <div class="comments-list">
                            <div class="comment">
                                <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2" alt="Usuario" class="comment-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="comment-author">Laura Martínez</span>
                                        <span class="comment-date">Hace 2 días</span>
                                        <button class="like-comment"><i class="fas fa-thumbs-up"></i> 12</button>
                                    </div>
                                    <p class="comment-text">¡Excelente receta! La hice para mi familia y quedaron encantados. Solo tuve que ajustar un poco la sal al final. Definitivamente la volveré a hacer.</p>
                                </div>
                            </div>
                            
                            <div class="comment">
                                <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956" alt="Usuario" class="comment-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="comment-author">Carlos Fuentes</span>
                                        <span class="comment-date">Hace 1 semana</span>
                                        <button class="like-comment"><i class="fas fa-thumbs-up"></i> 5</button>
                                    </div>
                                    <p class="comment-text">Buena receta, aunque me quedó un poco seca la primera vez. La segunda vez añadí más agua de la cocción y quedó perfecta. Gracias por las instrucciones detalladas.</p>
                                </div>
                            </div>
                            
                            <div class="comment">
                                <img src="https://images.unsplash.com/photo-1599566150163-29194dcaad36" alt="Usuario" class="comment-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="comment-author">Ana López</span>
                                        <span class="comment-date">Hace 3 días</span>
                                        <button class="like-comment"><i class="fas fa-thumbs-up"></i> 8</button>
                                    </div>
                                    <p class="comment-text">La mejor carbonara que he probado. Seguí los pasos al pie de la letra y quedó espectacular. ¡Gracias por compartir!</p>
                                </div>
                            </div>
                            
                            <div class="comment">
                                <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d" alt="Usuario" class="comment-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="comment-author">Juan Pérez</span>
                                        <span class="comment-date">Hace 5 días</span>
                                        <button class="like-comment"><i class="fas fa-thumbs-up"></i> 3</button>
                                    </div>
                                    <p class="comment-text">Siempre quise hacer una auténtica carbonara y con esta receta lo logré. Los ingredientes son clave, especialmente el guanciale.</p>
                                </div>
                            </div>
                            
                            <div class="comment">
                                <img src="https://images.unsplash.com/photo-1519085360753-af0119f7cbe7" alt="Usuario" class="comment-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="comment-author">María González</span>
                                        <span class="comment-date">Ayer</span>
                                        <button class="like-comment"><i class="fas fa-thumbs-up"></i> 7</button>
                                    </div>
                                    <p class="comment-text">Perfecta para una cena especial. Mi pareja quedó impresionado con el resultado. La recomendaré a todos mis amigos.</p>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </main>

        <script>
            // Script mejorado para el carrusel
            document.addEventListener('DOMContentLoaded', function() {
                const slides = document.querySelectorAll('.carousel-slide');
                const dots = document.querySelectorAll('.dot');
                const prevBtn = document.querySelector('.prev-btn');
                const nextBtn = document.querySelector('.next-btn');
                let currentSlide = 0;
                let slideInterval;
                
                function showSlide(index) {
                    // Oculta todas las slides
                    slides.forEach(slide => slide.classList.remove('active'));
                    dots.forEach(dot => dot.classList.remove('active'));
                    
                    // Muestra la slide actual
                    slides[index].classList.add('active');
                    dots[index].classList.add('active');
                    currentSlide = index;
                }
                
                function nextSlide() {
                    let newIndex = (currentSlide < slides.length - 1) ? currentSlide + 1 : 0;
                    showSlide(newIndex);
                }
                
                function prevSlide() {
                    let newIndex = (currentSlide > 0) ? currentSlide - 1 : slides.length - 1;
                    showSlide(newIndex);
                }
                
                function startSlideShow() {
                    slideInterval = setInterval(nextSlide, 5000);
                }
                
                function stopSlideShow() {
                    clearInterval(slideInterval);
                }
                
                // Event listeners
                nextBtn.addEventListener('click', () => {
                    nextSlide();
                    stopSlideShow();
                    startSlideShow();
                });
                
                prevBtn.addEventListener('click', () => {
                    prevSlide();
                    stopSlideShow();
                    startSlideShow();
                });
                
                // Agregar eventos a los dots
                dots.forEach((dot, index) => {
                    dot.addEventListener('click', () => {
                        showSlide(index);
                        stopSlideShow();
                        startSlideShow();
                    });
                });
                
                // Pausar carrusel cuando el mouse está sobre él
                const carousel = document.querySelector('.recipe-carousel');
                if (carousel) {
                    carousel.addEventListener('mouseenter', stopSlideShow);
                    carousel.addEventListener('mouseleave', startSlideShow);
                }
                
                // Mostrar el primer slide al cargar y comenzar slideshow
                showSlide(0);
                startSlideShow();
                
                // Función para el navbar
                function toggleProfileMenu() {
                    const menu = document.querySelector('.profile-menu');
                    menu.classList.toggle('show');
                }
                
                // Cerrar menú al hacer clic fuera
                document.addEventListener('click', function(event) {
                    const profile = document.querySelector('.user-profile');
                    const menu = document.querySelector('.profile-menu');
                    if (!profile.contains(event.target)) {
                        menu.classList.remove('show');
                    }
                });
                
                // Función para guardar receta
                const saveRecipeBtn = document.getElementById('saveRecipeBtn');
                if (saveRecipeBtn) {
                    saveRecipeBtn.addEventListener('click', function() {
                        this.classList.toggle('saved');
                        const icon = this.querySelector('i');
                        const text = this.querySelector('span');
                        
                        if (this.classList.contains('saved')) {
                            icon.classList.remove('far');
                            icon.classList.add('fas');
                            text.textContent = 'Receta Guardada';
                            // Aquí podrías agregar lógica para guardar en base de datos
                            alert('Receta guardada en tus favoritos');
                        } else {
                            icon.classList.remove('fas');
                            icon.classList.add('far');
                            text.textContent = 'Guardar Receta';
                            // Aquí podrías agregar lógica para quitar de favoritos
                            alert('Receta eliminada de tus favoritos');
                        }
                    });
                }
                
                // Simular recetas guardadas (en una aplicación real esto vendría de una API)
                function loadSavedRecipes() {
                    // Aquí iría la lógica para cargar recetas guardadas del usuario
                    console.log('Cargando recetas guardadas...');
                }
                
                loadSavedRecipes();
            });
        </script>
    </body>
</html>