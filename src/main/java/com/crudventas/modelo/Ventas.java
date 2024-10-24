package com.crudventas.modelo;

import java.sql.Date;

public class Ventas {

    private int idVenta;         // Coincide con la columna id_venta en la tabla ventas
    private int idLinea;         // Coincide con la columna id_linea en la tabla ventas
    private Date fechaVenta;     // Coincide con la columna fecha_venta en la tabla ventas
    private String descripcion;  // Coincide con la columna descripcion en la tabla ventas

    // Constructor vacío
    public Ventas() {
    }

    // Constructor con parámetros
    public Ventas(int idVenta, int idLinea, Date fechaVenta, String descripcion) {
        this.idVenta = idVenta;
        this.idLinea = idLinea;
        this.fechaVenta = fechaVenta;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdLinea() {
        return idLinea;
    }

    public void setIdLinea(int idLinea) {
        this.idLinea = idLinea;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    // Método toString para facilitar la visualización del objeto
    @Override
    public String toString() {
        return "Ventas{"
                + "idVenta=" + idVenta
                + ", idLinea=" + idLinea
                + ", fechaVenta=" + fechaVenta
                + ", descripcion='" + descripcion + '\''
                + '}';
    }
}
