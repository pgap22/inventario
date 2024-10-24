<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crudventas.modelo.Ventas" %>
<%@ page import="com.crudventas.dao.VentaDAO" %>
<%
    VentaDAO ventaDAO = new VentaDAO();
    List<Ventas> listaVentas = ventaDAO.listar();
%>
<html>
<head>
    <title>Listado de Ventas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #007bff;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #007bff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #007bff;
            color: white;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .button-container a {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
        }

        .button-container a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado de Ventas</h1>
        <table>
            <tr>
                <th>ID Venta</th>
                <th>ID Línea</th>
                <th>Fecha Venta</th>
                <th>Descripción</th>
                <th>Acciones</th>
            </tr>
            <%
            for (Ventas venta : listaVentas) {
            %>
            <tr>
                <td><%= venta.getIdVenta() %></td>
                <td><%= venta.getIdLinea() %></td>
                <td><%= venta.getFechaVenta() %></td>
                <td><%= venta.getDescripcion() %></td>
                <td>
                    <a href="editar.jsp?id=<%= venta.getIdVenta() %>">Editar</a>
                    <a href="eliminar.jsp?id=<%= venta.getIdVenta() %>">Eliminar</a>
                </td>
            </tr>
            <%
            }
            %>
        </table>
        <div class="button-container">
            <a href="agregar.jsp">Agregar Nueva Venta</a>
        </div>
    </div>
</body>
</html>
