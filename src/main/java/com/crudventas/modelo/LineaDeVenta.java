package com.crudventas.modelo;

public class LineaDeVenta {
    private int idLinea;
    private String linea;

    public LineaDeVenta() {}

    public LineaDeVenta(int idLinea, String linea) {
        this.idLinea = idLinea;
        this.linea = linea;
    }

    public int getIdLinea() {
        return idLinea;
    }

    public void setIdLinea(int idLinea) {
        this.idLinea = idLinea;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
}
