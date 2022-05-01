/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.Objects;

/**
 *
 * @author daw44
 */
public class Dato {
    
    private String etiqueta;
    private Double valor;

    public Dato() {
    }

    public Dato(String etiqueta, Double valor) {
        this.etiqueta = etiqueta;
        this.valor = valor;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 19 * hash + Objects.hashCode(this.etiqueta);
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
        final Dato other = (Dato) obj;
        if (!Objects.equals(this.etiqueta, other.etiqueta)) {
            return false;
        }
        return true;
    }
    
    
    
}
