<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.crudventas.dao.VentaDAO" %>
<%
    String id = request.getParameter("id");
    VentaDAO ventaDAO = new VentaDAO();
    boolean eliminado = ventaDAO.eliminar(Integer.parseInt(id));
%>
<html>
<head>
    <title>Eliminar Venta</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .message-container {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin: 0 auto;
            max-width: 400px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <%
            if (eliminado) {
        %>
            <h1>Venta Eliminada Exitosamente</h1>
        <%
            } else {
        %>
            <h1>Error al Eliminar Venta</h1>
        <%
            }
        %>
        <a href="listar.jsp">Volver al Listado</a>
    </div>
</body>
</html>
