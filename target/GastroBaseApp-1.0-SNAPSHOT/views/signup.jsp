<%-- 
    Document   : signup
    Created on : 2 may 2025, 10:16:07 p.m.
    Author     : OMEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Chef - GastroBase</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloLogin.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    </head>
    <body>
        <div class="chef-container">
            <div class="recipe-carousel">
               <div class="recipe-slide active" style="background-image: url('https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
                    <div class="recipe-overlay">
                        <h3 class="animate__animated animate__fadeInUp">Pasta Artesanal</h3>
                        <p class="animate__animated animate__fadeInUp animate__delay-1s">Receta exclusiva para chefs certificados</p>
                    </div>
                </div>
                <div class="recipe-slide" style="background-image: url('https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
                    <div class="recipe-overlay">
                        <h3 class="animate__animated animate__fadeInUp">Corte Premium</h3>
                        <p class="animate__animated animate__fadeInUp animate__delay-1s">Técnicas profesionales de carnicería</p>
                    </div>
                </div>
                <div class="recipe-slide" style="background-image: url('https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
                    <div class="recipe-overlay">
                        <h3 class="animate__animated animate__fadeInUp">Postres Creativos</h3>
                        <p class="animate__animated animate__fadeInUp animate__delay-1s">Diseños de alta repostería</p>
                    </div>
                </div>
                <div class="carousel-controls">
                    <button class="carousel-prev"><i class="fas fa-chevron-left"></i></button>
                    <button class="carousel-next"><i class="fas fa-chevron-right"></i></button>
                </div>
                <div class="carousel-indicators"></div>
            </div>

            <div class="login-section">
                <div class="cooking-header">
                    <div class="animated-utensils">
                        <i class="fas fa-cheese animated-float"></i>
                        <i class="fas fa-utensils animated-float delay-1"></i>
                        <i class="fas fa-mortar-pestle animated-float delay-2"></i>
                    </div>
                    <h1 class="animate__animated animate__fadeIn">Nuevo Chef<span class="blinking">_</span></h1>
                </div>

                <form class="culinary-login animate__animated animate__fadeIn animate__delay-1s" action="${pageContext.request.contextPath}/registro" method="POST">
                    <div class="signup-columns">
                        <!-- Columna Izquierda -->
                        <div class="signup-column">
                            <div class="input-group sizzle-input">
                                <input type="email" id="email" name="email" value="${param.email}" required>
                                <label for="email"><i class="fas fa-envelope"></i> Email Culinario</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['email']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['email']}</span>
                                </c:if>
                            </div>

                            <div class="input-group sizzle-input">
                                <input type="text" id="first-name" name="first-name" value="${param['first-name']}" required>
                                <label for="first-name"><i class="fas fa-user"></i> Nombre</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['first-name']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['first-name']}</span>
                                </c:if>
                            </div>

                            <div class="input-group sizzle-input">
                                <input type="text" id="last-name" name="last-name" value="${param['last-name']}" required>
                                <label for="last-name"><i class="fas fa-users"></i> Apellido</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['last-name']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['last-name']}</span>
                                </c:if>
                            </div>

                            <div class="input-group sizzle-input">
                                <input type="password" id="password" name="password" required>
                                <label for="password"><i class="fas fa-lock"></i> Contraseña</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['password']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['password']}</span>
                                </c:if>
                            </div>
                        </div>

                        <!-- Columna Derecha -->
                        <div class="signup-column">
                            <div class="input-group sizzle-input">
                                <input type="tel" id="phone" name="phone" value="${param.phone}" required>
                                <label for="phone"><i class="fas fa-phone"></i> Teléfono</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['phone']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['phone']}</span>
                                </c:if>
                            </div>

                            <div class="input-group sizzle-input">
                                <input type="text" id="city" name="city" value="${param.city}" required>
                                <label for="city"><i class="fas fa-city"></i> Ciudad</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['city']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['city']}</span>
                                </c:if>
                            </div>

                            <div class="input-group sizzle-input">
                                <input type="date" id="dob" name="dob" value="${param.dob}" required>
                                <label for="dob"><i class="fas fa-birthday-cake"></i> Fecha Nacimiento</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['dob']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['dob']}</span>
                                </c:if>
                            </div>

                            <div class="input-group sizzle-input">
                                <select id="gender" name="gender" required>
                                    <option value="">Género</option>
                                    <option value="MASCULINO" ${param.gender == 'MASCULINO' ? 'selected' : ''}>Masculino</option>
                                    <option value="FEMENINO" ${param.gender == 'FEMENINO' ? 'selected' : ''}>Femenino</option>
                                    <option value="NO_ESPECIFICADO" ${param.gender == 'NO_ESPECIFICADO' ? 'selected' : ''}>Prefiero no especificar</option>
                                </select>
                                <label for="gender"><i class="fas fa-venus-mars"></i> Género</label>
                                <span class="input-focus-border"></span>
                                <c:if test="${not empty errorMap['gender']}">
                                    <span class="error-message"><i class="fas fa-exclamation-circle"></i> ${errorMap['gender']}</span>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="flame-button">
                        <span>Crear Cuenta</span>
                        <div class="button-hover-effect"></div>
                    </button>

                    <div class="chef-register animate__animated animate__fadeIn animate__delay-2s">
                        <p>¿Ya tienes cuenta? <a href="login.jsp" class="register-link">¡Inicia Sesión!</a></p>
                        <div class="spices-decoration">
                            <i class="fas fa-pepper-hot"></i>
                            <i class="fas fa-leaf"></i>
                            <i class="fas fa-seedling"></i>
                        </div>
                    </div>
                </form>
            </div>
        </div>

<script>
            // Carrusel mejorado con controles
            let currentSlide = 0;
            const slides = document.querySelectorAll('.recipe-slide');
            const indicators = document.querySelector('.carousel-indicators');
            const nextBtn = document.querySelector('.carousel-next');
            const prevBtn = document.querySelector('.carousel-prev');

            // Crear indicadores
            slides.forEach((slide, index) => {
                const indicator = document.createElement('span');
                indicator.classList.add('indicator');
                if (index === 0)
                    indicator.classList.add('active');
                indicator.addEventListener('click', () => goToSlide(index));
                indicators.appendChild(indicator);
            });

            function updateCarousel() {
                slides.forEach((slide, index) => {
                    slide.classList.remove('active');
                    slide.querySelector('h3').classList.remove('animate__fadeInUp');
                    slide.querySelector('p').classList.remove('animate__fadeInUp');

                    if (index === currentSlide) {
                        slide.classList.add('active');
                        setTimeout(() => {
                            slide.querySelector('h3').classList.add('animate__fadeInUp');
                            slide.querySelector('p').classList.add('animate__fadeInUp');
                        }, 100);
                    }
                });

                document.querySelectorAll('.indicator').forEach((indicator, index) => {
                    indicator.classList.toggle('active', index === currentSlide);
                });
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % slides.length;
                updateCarousel();
            }

            function prevSlide() {
                currentSlide = (currentSlide - 1 + slides.length) % slides.length;
                updateCarousel();
            }

            function goToSlide(index) {
                currentSlide = index;
                updateCarousel();
            }

            nextBtn.addEventListener('click', nextSlide);
            prevBtn.addEventListener('click', prevSlide);

            // Auto-avance cada 5 segundos
            let slideInterval = setInterval(nextSlide, 5000);

            // Pausar al interactuar
            const carousel = document.querySelector('.recipe-carousel');
            carousel.addEventListener('mouseenter', () => clearInterval(slideInterval));
            carousel.addEventListener('mouseleave', () => {
                clearInterval(slideInterval);
                slideInterval = setInterval(nextSlide, 5000);
            });

            // Efecto hover para los inputs
            const inputs = document.querySelectorAll('.sizzle-input input');
            inputs.forEach(input => {
                input.addEventListener('focus', function () {
                    this.parentElement.querySelector('.input-focus-border').style.width = '100%';
                });

                input.addEventListener('blur', function () {
                    if (!this.value) {
                        this.parentElement.querySelector('.input-focus-border').style.width = '0';
                    }
                });
            });
        </script>
    </body>
</html>