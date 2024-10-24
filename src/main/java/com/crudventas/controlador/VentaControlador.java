package com.crudventas.controlador;

import com.crudventas.dao.VentaDAO;
import com.crudventas.modelo.Ventas;
import java.util.List;
import java.util.Optional;

public class VentaControlador {
    private final VentaDAO ventaDAO;

    public VentaControlador() {
        this.ventaDAO = new VentaDAO();
    }

    // Método para listar todas las ventas
    public List<Ventas> listarVentas() {
        return ventaDAO.listar();
    }

    // Método para obtener una venta por ID
    public Optional<Ventas> obtenerVentaPorId(int id) {
        return ventaDAO.obtenerPorId(id);
    }

    // Método para agregar una nueva venta
    public boolean agregarVenta(Ventas venta) {
        return ventaDAO.agregar(venta);
    }

    // Método para editar una venta existente
    public boolean editarVenta(Ventas venta) {
        return ventaDAO.editar(venta);
    }

    // Método para eliminar una venta por ID
    public boolean eliminarVenta(int id) {
        return ventaDAO.eliminar(id);
    }
}
