/*
 Estas navidades queremos felicitar a nuestros amigos de forma original, y para ello
desarrollaremos un juego sencillo con tecnología JSP: Descubrir parejas navideñas. 

Clase Carta
 */
package controlador;

import java.util.Objects;

/**
 *
 * @author daw2
 * @author Mohammed Sebti Benzakour
 * @since v1.0
 *
 */
/**
 * @version v1.12-12-2021
 */
/**
 * Clase Java Bean "Carta"
 *
 */
public class Carta {

    /**
     * Atributos de la clase
     *
     */
    private String nombre;

    private boolean bocaAbajo;

    private boolean acertada = false;

    /**
     * Constructor por defecto una de las condiciones de clases java bean más
     * los getters y setters que son la segunda condición
     */
    public Carta() {
        this("");
    }

    /**
     * Constructor con parametro
     *
     * @param nombre representa el nombre de la carta
     */
    public Carta(String nombre) {
        this.nombre = nombre;
        bocaAbajo = true;
    }

    /**
     * @return metodo que devuelve el estado de la carta devolviendo el atributo
     * de clase bocaAbajo
     */
    public boolean isBocaAbajo() {
        return bocaAbajo;
    }

    /**
     * Metodo para modificar el estado de la carta segun situación
     *
     * @param bocaAbajo representa el estado de la carta
     *
     */
    public void setBocaAbajo(boolean bocaAbajo) {
        this.bocaAbajo = bocaAbajo;
    }

    /**
     * metodo que devuelva el nombre de la carta devolviendo el atributo de
     * clase nombre
     *
     * @return nombre de la carta que es un texto
     *
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo para modificar el nombre de la carta segun situación
     *
     * @param nombre representa el nombre de la carta
     *
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo que analiza si la carta esta boca arriba o bocaAbajo
     *
     * @return devulve el nombre completo de la carta o bien devulve la carta
     * bocaAbajo(logo)
     */
    public String getImagen() {
        if (!bocaAbajo) {
            return "imagenes/" + nombre + ".jpg";
        } else {
            return "imagenes/logo.jpg";
        }

    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    /**
     * Metodo para comparar dos cartas si son iguales o no.por sus nombres.
     *
     * @return devulve true a false según situación
     * @param obj que es una carta
     */
    @Override
    public boolean equals(Object obj) {

        final Carta other = (Carta) obj;
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        return true;
    }

    /**
     * Metodo que devuelve el estado de una carta es decir que la carta es la
     * correcta
     *
     * @return devuelva acertada que es un atributo booleano de la clase de la
     * carta
     *
     */
    public boolean isAcertada() {
        return acertada;
    }

    /**
     * Metodo para modificar si la carta que deseamos esta o no esta como tiene
     * que estar o según necesidad de la situación.
     *
     * @param acertada que es un booleano para verificar el estado de la carta
     */
    public void setAcertada(boolean acertada) {
        this.acertada = acertada;
    }

}
