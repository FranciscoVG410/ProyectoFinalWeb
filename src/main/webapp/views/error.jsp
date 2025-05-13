<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigo = request.getParameter("codigo");
    String mensaje = "Ha ocurrido un error inesperado.";

    if ("403".equals(codigo)) {
        mensaje = "Acceso prohibido. Esta receta es secreta para ti 🍲🚫";
    } else if ("404".equals(codigo)) {
        mensaje = "No encontramos lo que buscas. ¿Tal vez te equivocaste de cocina? 🔍";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Error <%= codigo != null ? codigo : "" %> - GastroBaseApp</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fff6e5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-box {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
        }
        h1 {
            font-size: 50px;
            color: #e67e22;
        }
        p {
            font-size: 18px;
        }
        img {
            width: 100px;
            margin-top: 15px;
        }
        a {
            margin-top: 25px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #e67e22;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }
        a:hover {
            background-color: #d35400;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h1>Error <%= codigo != null ? codigo : "?" %></h1>
        <p><%= mensaje %></p>
        <a href="${pageContext.request.contextPath}/views/login.jsp">Volver al inicio</a>
        <div>
            <img src="https://cdn-icons-png.flaticon.com/512/3075/3075977.png" alt="chef triste">
        </div>
    </div>
</body>
</html>
