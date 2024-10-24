<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudventas.controlador.VentaControlador" %>
<%@page import="com.crudventas.modelo.Ventas" %>
<%
    // Obtener los parámetros del formulario
    String idVentaParam = request.getParameter("idVenta");
    int idVenta = Integer.parseInt(idVentaParam);
    int idLinea = Integer.parseInt(request.getParameter("idLinea"));
    String fechaVenta = request.getParameter("fechaVenta");
    String descripcion = request.getParameter("descripcion");

    // Crear una instancia del controlador de ventas
    VentaControlador ventaControlador = new VentaControlador();

    // Crear una nueva instancia de Ventas para actualizar
    Ventas ventaActualizada = new Ventas();
    ventaActualizada.setIdVenta(idVenta);
    ventaActualizada.setIdLinea(idLinea);
    ventaActualizada.setFechaVenta(java.sql.Date.valueOf(fechaVenta));
    ventaActualizada.setDescripcion(descripcion);

    // Actualizar la venta en la base de datos
    boolean actualizado = ventaControlador.editarVenta(ventaActualizada);
%>
<html>
<head>
    <title>Actualizar Venta</title>
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
            if (actualizado) {
        %>
            <h1>Venta Actualizada Exitosamente</h1>
        <%
            } else {
        %>
            <h1>Error al Actualizar la Venta</h1>
        <%
            }
        %>
        <p><a href="listar.jsp">Volver al Listado</a></p>
    </div>
</body>
</html>
