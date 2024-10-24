package com.crudventas.dao;

import com.crudventas.config.Conexion;
import com.crudventas.interfaces.Crud;
import com.crudventas.modelo.Ventas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class VentaDAO implements Crud {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Ventas> listar() {
        List<Ventas> list = new ArrayList<>();
        String sql = "SELECT * FROM ventas";
        try {
            con = cn.getConnection(); // Inicializa la conexión aquí
            if (con != null) {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Ventas ven = new Ventas();
                    ven.setIdVenta(rs.getInt("id_venta"));
                    ven.setIdLinea(rs.getInt("id_linea"));
                    ven.setFechaVenta(rs.getDate("fecha_venta"));
                    ven.setDescripcion(rs.getString("descripcion"));
                    list.add(ven);
                }
            } else {
                System.out.println("Error: No se pudo establecer la conexión a la base de datos.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public Optional<Ventas> obtenerPorId(int id) {
        Ventas venta = null;
        String sql = "SELECT * FROM ventas WHERE id_venta = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                venta = new Ventas();
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setIdLinea(rs.getInt("id_linea"));
                venta.setFechaVenta(rs.getDate("fecha_venta")); // Convertir a LocalDate
                venta.setDescripcion(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo básico de excepciones
        } finally {
            closeResources();
        }
        return Optional.ofNullable(venta);
    }

    @Override
    public boolean agregar(Ventas venta) {
        String sql = "INSERT INTO ventas (id_linea, fecha_venta, descripcion) VALUES (?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, venta.getIdLinea());
            ps.setDate(2, venta.getFechaVenta()); // Convertir a java.sql.Date
            ps.setString(3, venta.getDescripcion());
            return ps.executeUpdate() > 0; // Retorna true si la inserción fue exitosa
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
            closeResources();
        }
    }

    @Override
    public boolean editar(Ventas venta) {
        String sql = "UPDATE ventas SET id_linea = ?, fecha_venta = ?, descripcion = ? WHERE id_venta = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, venta.getIdLinea());
            ps.setDate(2, venta.getFechaVenta()); // Convertir a java.sql.Date
            ps.setString(3, venta.getDescripcion());
            ps.setInt(4, venta.getIdVenta());
            return ps.executeUpdate() > 0; // Retorna true si la actualización fue exitosa
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
            closeResources();
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM ventas WHERE id_venta = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0; // Retorna true si la eliminación fue exitosa
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
            closeResources();
        }
    }

    // Método para cerrar recursos
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
