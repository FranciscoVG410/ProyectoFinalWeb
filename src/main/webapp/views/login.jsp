<%-- 
    Document   : login
    Created on : 2 may 2025, 10:16:48 p.m.
    Author     : OMEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - GastroBase</title>
    </head>
    <body>
        <div  class="contenedor01">
            <section  class="titulo">
                <p>Welcome back!</p>
                <h1>Log in</h1>
            </section>
            <form action="${pageContext.request.contextPath}/login" method="POST">
                <label for="email">Email</label>
                <input type="email" placeholder="your email" name="email" required autofocus>

                <label for="password">Password</label>
                <input type="password" placeholder="Write a secret password" name="password" required>

                <input type="submit" value="Log in">
                <p>Don’t have an account? <a href="./signup.jsp">Sign Up, It’s Free!</a></p>
            </form>
        </div>
    </body>
</html>

