<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.crudventas.dao.VentaDAO" %>
<%@ page import="com.crudventas.modelo.Ventas" %>
<%@ page import="java.util.List" %>
<%@ page import="com.crudventas.controlador.LineaDeVentaControlador" %>
<%@ page import="com.crudventas.modelo.LineaDeVenta" %>
<%
    // Crear una instancia del controlador
    LineaDeVentaControlador lineaDeVentaController = new LineaDeVentaControlador();

    // Obtener la lista de líneas de venta
    List<LineaDeVenta> lineasDeVenta = lineaDeVentaController.listarLineas();
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
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        select, input[type="date"], input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .link-container {
            text-align: center;
            margin-top: 20px;
        }

        .link-container a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .link-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Agregar Nueva Venta</h1>
    <form action="agregarVenta.jsp" method="post">
        <label>ID Línea:</label>
        <select name="idLinea" required>
            <%
                // Iterar sobre la lista de líneas de venta y mostrarlas en el select
                for (LineaDeVenta linea : lineasDeVenta) {
            %>
            <option value="<%= linea.getIdLinea() %>"><%= linea.getLinea() %></option>
            <%
                }
            %>
        </select>

        <label>Fecha Venta:</label>
        <input type="date" name="fechaVenta" required>

        <label>Descripción:</label>
        <input type="text" name="descripcion" required>

        <input type="submit" value="Agregar Venta">
    </form>
    <div class="link-container">
        <a href="listar.jsp">Volver al Listado</a>
    </div>
</body>
</html>
