package com.crudventas.interfaces;

import com.crudventas.modelo.Ventas;
import java.util.List;
import java.util.Optional;

public interface Crud {
    
    // Método para listar todas las ventas
    public List<Ventas> listar();
    
    // Método para obtener una venta específica por ID
    public Optional<Ventas> obtenerPorId(int id); // Cambiado a Optional<Ventas>
    
    // Método para agregar una nueva venta
    public boolean agregar(Ventas venta);
    
    // Método para editar una venta existente
    public boolean editar(Ventas venta);
    
    // Método para eliminar una venta por su ID
    public boolean eliminar(int id);
}
