<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.crudventas.dao.VentaDAO" %>
<%@ page import="com.crudventas.modelo.Ventas" %>
<%
    String idLinea = request.getParameter("idLinea");
    String fechaVenta = request.getParameter("fechaVenta");
    String descripcion = request.getParameter("descripcion");

    VentaDAO ventaDAO = new VentaDAO();
    Ventas nuevaVenta = new Ventas();
    nuevaVenta.setIdLinea(Integer.parseInt(idLinea));
    nuevaVenta.setFechaVenta(java.sql.Date.valueOf(fechaVenta));
    nuevaVenta.setDescripcion(descripcion);

    boolean agregado = ventaDAO.agregar(nuevaVenta);
%>
<html>
<head>
    <title>Agregar Venta</title>
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

        .resultado {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin: 0 auto;
            max-width: 600px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .success {
            color: #28a745; /* Color verde para éxito */
        }

        .error {
            color: #dc3545; /* Color rojo para error */
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
<%
    if (agregado) {
%>
        <div class="resultado">
            <h1 class="success">Venta Agregada Exitosamente</h1>
        </div>
<%
    } else {
%>
        <div class="resultado">
            <h1 class="error">Error al Agregar Venta</h1>
        </div>
<%
    }
%>
<a href="listar.jsp">Volver al Listado</a>
</body>
</html>
