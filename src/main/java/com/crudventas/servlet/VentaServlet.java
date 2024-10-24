package com.crudventas.servlet;

import com.crudventas.dao.VentaDAO;
import com.crudventas.modelo.Ventas;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/ventasxd")
public class VentaServlet extends HttpServlet {
    private final VentaDAO ventaDAO = new VentaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implementa el código para listar o obtener ventas según lo necesites
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int idLinea = Integer.parseInt(request.getParameter("idLinea"));
            LocalDate fechaVenta = LocalDate.parse(request.getParameter("fechaVenta")); // Suponiendo que recibes la fecha como String
            String descripcion = request.getParameter("descripcion");

            // Convertir LocalDate a java.sql.Date
            Date fechaVentaSql = Date.valueOf(fechaVenta); 

            Ventas nuevaVenta = new Ventas();
            nuevaVenta.setIdLinea(idLinea);
            nuevaVenta.setFechaVenta(fechaVentaSql); // Asigna la fecha convertida al modelo
            nuevaVenta.setDescripcion(descripcion);

            boolean resultado = ventaDAO.agregar(nuevaVenta);
            if (resultado) {
                response.sendRedirect("ventas.jsp"); // Redirige después de agregar
            } else {
                // Maneja el error de inserción
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Maneja la excepción (por ejemplo, mostrar un mensaje de error)
        }
    }

    // Implementa otros métodos (doPut, doDelete) según sea necesario
}
