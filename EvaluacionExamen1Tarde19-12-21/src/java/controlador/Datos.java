/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author daw44
 */
public class Datos {
     private List<Dato> datos;
    
    public Datos() {
        datos = new LinkedList();
    }
    
    public void add(Dato dato) {
        datos.add(dato);
    }
    
    public int size() {
        return datos.size();
    }
    
    public Iterator<Dato> iterator() {
        return datos.iterator();
    }
    
    public Dato get(int i) {
        return datos.get(i);
    }
    
    public String toString() {
        String result = "[";
        int i;
        // Mostramos los valores separados por ',' menos el último
        for (i = 0; i < datos.size() -1 ; i++) {
            result += datos.get(i).getValor() + ", ";
        }
        // Mostramos el último, si existe
        if (i < datos.size()) {
            result += datos.get(i).getValor();
        }
        return result + "]";
    }
    
    public String getEtiquetas() {
        String result = "[";
        int i;
        // Mostramos las etiquetas separadas por ',' menos la última
        for (i = 0; i < datos.size() -1 ; i++) {
            result += "'" + datos.get(i).getEtiqueta() + "', ";
        }
        // Mostramos el último, si existe
        if (i < datos.size()) {
            result += "'" + datos.get(i).getEtiqueta() + "'";
        }
        return result + "]";
        
    }
}
