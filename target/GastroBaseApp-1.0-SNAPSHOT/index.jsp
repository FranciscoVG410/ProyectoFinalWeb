<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    String tipo = (sesion != null) ? (String) sesion.getAttribute("tipo") : null;

    if (tipo != null) {
        if ("admin".equals(tipo)) {
            response.sendRedirect("views/admin.jsp");
        } else {
            response.sendRedirect("views/bienvenido.jsp");
        }
    } else {
        response.sendRedirect("views/login.jsp");
    }
%>
