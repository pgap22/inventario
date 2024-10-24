package com.crudventas.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/ventas";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Asegúrate de usar el driver correcto
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("OKOKOKOKO");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Muestra el error si no se puede conectar
        }
        return con;
    }
}
