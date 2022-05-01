/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.text.NumberFormat;
import java.util.Arrays;

/**
 *
 * @author daw44
 */
public class Matriz {

    private String nombre;
    private int filas;
    private int columnas;
    private double[][] valores;

    public Matriz() {
        this("A", 3, 3);
    }

    public Matriz(String nombre, int filas, int columnas) {
        this.nombre = nombre;
        this.filas = filas;
        this.columnas = columnas;

        valores = new double[filas][columnas];

    }

    public static Matriz identidad(int n) {
        Matriz res = new Matriz("I", n, n);
        for (int i = 0; i < n; i++) {
            res.valores[i][i] = 1;
        }
        return res;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
        valores = new double[filas][columnas];
    }

    public int getColumnas() {
        return columnas;
    }

    public void setColumnas(int columnas) {
        this.columnas = columnas;
        valores = new double[filas][columnas];
    }

    public double[][] getValores() {
        return valores;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + this.filas;
        hash = 83 * hash + this.columnas;
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < columnas; j++) {
                hash += valores[i][j];
            }
        }
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Matriz other = (Matriz) obj;
        if (this.filas != other.filas) {
            return false;
        }
        if (this.columnas != other.columnas) {
            return false;
        }
        if (!Arrays.equals(valores, other.valores)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        String cadena = "<table>\n<tr>\n<td>" + nombre + " = </td>\n<td>";
        cadena += "\n<table class='matriz'>";
        for (int i = 0; i < filas; i++) {
            cadena += "<tr>";
            for (int j = 0; j < columnas; j++) {
                cadena += "<td class='der'>" + format(valores[i][j]) + "</td>";
            }
            cadena += "\n</tr>";
        }
        cadena += "</table>\n";
        return cadena + "</td>\n</tr>\n</table>";
    }

    public String toConsoleString() {
        String cadena = nombre + " = ";
        for (int i = 0; i < filas; i++) {
            if (i != 0) {
                cadena += espacios(nombre.length() + 3);
            }
            for (int j = 0; j < columnas; j++) {
                cadena += format(valores[i][j]) + " ";
            }
            cadena += "\n";
        }
        return cadena;
    }

    private String espacios(int n) {
        char[] esp = new char[n];
        for (int i = 0; i < n; i++) {
            esp[i] = ' ';
        }
        return new String(esp);
    }

    public String format(double num) {
        NumberFormat formato = NumberFormat.getInstance();
        formato.setMaximumFractionDigits(2);
        formato.setMinimumFractionDigits(2);
        String res = formato.format(num);
        //  return espacios(10 - res.length()) + res;

        return res;
    }

    public Matriz multiplicar(Matriz otra) {
        if (columnas != otra.filas) {
            throw new IllegalArgumentException("No se puede multiplicar una matriz de "
                    + filas + "x" + columnas + " por una de " + otra.filas + "x" + otra.columnas);
        }
        Matriz res = null;

        res = new Matriz(nombre + "·" + otra.nombre, filas, otra.columnas);
        for (int f = 0; f < res.filas; f++) {
            for (int c = 0; c < res.columnas; c++) {
                double suma = 0;
                for (int i = 0; i < columnas; i++) {
                    suma += valores[f][i] * otra.valores[i][c];
                }
                res.valores[f][c] = suma;
            }
        }

        return res;
    }

    public static void main(String[] args) {
        Matriz a = new Matriz();
        System.out.println(a.toConsoleString());
    }

}
