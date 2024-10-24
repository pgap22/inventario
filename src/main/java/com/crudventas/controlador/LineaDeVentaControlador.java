package com.crudventas.controlador;

import com.crudventas.dao.LineaDeVentaDAO;
import com.crudventas.modelo.LineaDeVenta;

import java.util.List;

public class LineaDeVentaControlador {

    private LineaDeVentaDAO lineaDeVentaDAO;

    public LineaDeVentaControlador() {
        lineaDeVentaDAO = new LineaDeVentaDAO();
    }

    // Método para agregar una nueva línea de venta
    public boolean agregarLinea(LineaDeVenta lineaDeVenta) {
        return lineaDeVentaDAO.agregar(lineaDeVenta);
    }

    // Método para listar todas las líneas de venta
    public List<LineaDeVenta> listarLineas() {
        return lineaDeVentaDAO.listar();
    }

    // Método para actualizar una línea de venta
    public boolean actualizarLinea(LineaDeVenta lineaDeVenta) {
        return lineaDeVentaDAO.actualizar(lineaDeVenta);
    }

    // Método para eliminar una línea de venta
    public boolean eliminarLinea(int idLinea) {
        return lineaDeVentaDAO.eliminar(idLinea);
    }
}
