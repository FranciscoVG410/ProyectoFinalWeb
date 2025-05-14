<%-- 
    Document   : login
    Created on : 2 may 2025, 10:16:48 p.m.
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GastroBase - Chef Master</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloLogin.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    </head>
    <body>
        <div class="chef-container">
            <div class="carousel-container">
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
            </div>

            <div class="forms-container">
                <!-- Login Form -->
                <div class="form-box login-form active">
                    <div class="cooking-header">
                        <div class="animated-utensils">
                            <i class="fas fa-cheese animated-float"></i>
                            <i class="fas fa-utensils animated-float delay-1"></i>
                            <i class="fas fa-mortar-pestle animated-float delay-2"></i>
                        </div>
                        <h1 class="animate__animated animate__fadeIn">Acceso Chef<span class="blinking">_</span></h1>
                    </div>

                    <form class="culinary-login animate__animated animate__fadeIn animate__delay-1s" action="${pageContext.request.contextPath}/views/Home.jsp" method="POST">
                        <div class="input-group sizzle-input">
                            <input type="email" id="email" name="email"  required placeholder=" ">
                            <label for="email"><i class="fas fa-envelope"></i> Email Culinario</label>
                            <span class="input-focus-border"></span>
                        </div>

                        <div class="input-group sizzle-input">
                            <input type="password" id="password" name="password"  required placeholder=" ">
                            <label for="password"><i class="fas fa-lock"></i> Secreto de Cocina</label>
                            <span class="input-focus-border"></span>
                        </div>

                        <button type="submit" class="flame-button">
                            <span>Encender Fogones</span>
                            <div class="button-hover-effect"></div>
                        </button>

                        <div class="chef-register animate__animated animate__fadeIn animate__delay-2s">
                            <p>¿Nuevo en la cocina? <a href="#" class="switch-form">¡Obtén tu delantal digital!</a></p>
                            <div class="spices-decoration">
                                <i class="fas fa-pepper-hot"></i>
                                <i class="fas fa-leaf"></i>
                                <i class="fas fa-seedling"></i>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Signup Form -->
                <div class="form-box signup-form">
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
                            <div class="signup-column">
                                <div class="input-group sizzle-input">
                                    <input type="email" id="signup-email" name="email"  required placeholder=" ">
                                    <label for="signup-email"><i class="fas fa-envelope"></i> Email Culinario</label>
                                    <span class="input-focus-border"></span>
                                </div>

                                <div class="input-group sizzle-input">
                                    <input type="text" id="first-name" name="first-name"  required placeholder=" ">
                                    <label for="first-name"><i class="fas fa-user"></i> Nombre</label>
                                    <span class="input-focus-border"></span>
                                </div>

                                <div class="input-group sizzle-input">
                                    <input type="text" id="last-name" name="last-name"  required placeholder=" ">
                                    <label for="last-name"><i class="fas fa-users"></i> Apellido</label>
                                    <span class="input-focus-border"></span>
                                </div>
                            </div>

                            <div class="signup-column">
                                <div class="input-group sizzle-input">
                                    <input type="password" id="signup-password" name="password"  required placeholder=" ">
                                    <label for="signup-password"><i class="fas fa-lock"></i> Contraseña</label>
                                    <span class="input-focus-border"></span>
                                </div>

                                <div class="input-group sizzle-input">
                                    <input type="tel" id="phone" name="phone"  required placeholder=" ">
                                    <label for="phone"><i class="fas fa-phone"></i> Teléfono</label>
                                    <span class="input-focus-border"></span>
                                </div>

                                <div class="input-group sizzle-input">
                                    <input type="date" id="dob" name="dob" value="${param.dob}" required placeholder=" " max="<%= java.time.LocalDate.now()%>"
                                           oninput="validateDate(this)">
                                    <label for="dob"><i class="fas fa-birthday-cake"></i> Fecha Nacimiento</label>
                                    <span class="input-focus-border"></span>
                                    <c:if test="${not empty errorMap['dob']}"></c:if>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="flame-button">
                            <span>Crear Cuenta</span>
                            <div class="button-hover-effect"></div>
                        </button>

                        <div class="chef-register animate__animated animate__fadeIn animate__delay-2s">
                            <p>¿Ya tienes cuenta? <a href="#" class="switch-form">¡Inicia Sesión!</a></p>
                            <div class="spices-decoration">
                                <i class="fas fa-pepper-hot"></i>
                                <i class="fas fa-leaf"></i>
                                <i class="fas fa-seedling"></i>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/scriptLogin.js"></script>

    </body>
</html>