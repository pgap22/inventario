<%@page import="java.util.Optional"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudventas.controlador.VentaControlador" %>
<%@page import="com.crudventas.modelo.Ventas" %>
<%@page import="java.util.List" %>
<%@page import="com.crudventas.controlador.LineaDeVentaControlador" %>
<%@page import="com.crudventas.modelo.LineaDeVenta" %>
<%
    // Obtener el ID de la venta a editar desde la solicitud
    String idVentaParam = request.getParameter("id");
    int idVenta = Integer.parseInt(idVentaParam);
    
    // Crear una instancia del controlador de ventas
    VentaControlador ventaControlador = new VentaControlador();
    Optional<Ventas> ventaOpt = ventaControlador.obtenerVentaPorId(idVenta); // Obtener la venta por ID

    // Verificar si la venta existe
    Ventas venta = ventaOpt.orElse(new Ventas()); // Obtener la venta o un nuevo objeto si no se encuentra

    // Crear una instancia del controlador de línea de venta
    LineaDeVentaControlador lineaDeVentaController = new LineaDeVentaControlador();
    List<LineaDeVenta> lineasDeVenta = lineaDeVentaController.listarLineas(); // Obtener líneas de venta
%>
<html>
<head>
    <title>Editar Venta</title>
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

        .form-container {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin: 0 auto;
            max-width: 600px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Editar Venta</h1>
        <form action="actualizarVenta.jsp" method="post">
            <input type="hidden" name="idVenta" value="<%= venta.getIdVenta() %>"/> <!-- ID oculto para actualizar -->

            <label>ID Línea:</label>
            <select name="idLinea" required>
                <%
                    // Iterar sobre la lista de líneas de venta y mostrarlas en el select
                    for (LineaDeVenta linea : lineasDeVenta) {
                %>
                <option value="<%= linea.getIdLinea() %>" <%= (linea.getIdLinea() == venta.getIdLinea() ? "selected" : "") %>><%= linea.getLinea() %></option>
                <%
                    }
                %>
            </select>

            <label>Fecha Venta:</label>
            <input type="date" name="fechaVenta" value="<%= venta.getFechaVenta() %>" required>

            <label>Descripción:</label>
            <input type="text" name="descripcion" value="<%= venta.getDescripcion() %>" required>

            <input type="submit" value="Actualizar Venta">
        </form>
    </div>
    <a href="listar.jsp">Volver al Listado</a>
</body>
</html>
