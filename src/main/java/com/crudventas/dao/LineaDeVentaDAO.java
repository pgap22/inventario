package com.crudventas.dao;

import com.crudventas.config.Conexion;
import com.crudventas.modelo.LineaDeVenta;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LineaDeVentaDAO {

    private Connection con;

    public LineaDeVentaDAO() {
        this.con = new Conexion().getConnection(); // Obtener conexión a través de la clase Conexion
    }

    public List<LineaDeVenta> listar() {
        List<LineaDeVenta> lineas = new ArrayList<>();
        String sql = "SELECT * FROM lineas_de_venta";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                LineaDeVenta linea = new LineaDeVenta();
                linea.setIdLinea(rs.getInt("id_linea"));
                linea.setLinea(rs.getString("Linea"));
                lineas.add(linea);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
        }
        return lineas;
    }

    public boolean agregar(LineaDeVenta linea) {
        String sql = "INSERT INTO lineas_de_venta (Linea) VALUES (?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, linea.getLinea());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
            return false;
        }
    }

    public boolean eliminar(int idLinea) {
        String sql = "DELETE FROM lineas_de_venta WHERE id_linea = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idLinea);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
            return false;
        }
    }

    public boolean actualizar(LineaDeVenta linea) {
        String sql = "UPDATE lineas_de_venta SET Linea = ? WHERE id_linea = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, linea.getLinea());
            ps.setInt(2, linea.getIdLinea());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
            return false;
        }
    }

    public LineaDeVenta buscarPorId(int idLinea) {
        LineaDeVenta linea = null;
        String sql = "SELECT * FROM lineas_de_venta WHERE id_linea = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idLinea);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    linea = new LineaDeVenta();
                    linea.setIdLinea(rs.getInt("id_linea"));
                    linea.setLinea(rs.getString("Linea"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
        }
        return linea;
    }
}
