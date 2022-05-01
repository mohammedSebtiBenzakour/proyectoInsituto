/*
 Estas navidades queremos felicitar a nuestros amigos de forma original, y para ello
desarrollaremos un juego sencillo con tecnología JSP: Descubrir parejas navideñas. 

Clase El juego 
 */
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
package controlador;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Clase Java Bean "El juego"
 *
 *
 *
 */
public class ElJuego {
    
    /**
     * Atributos de clase 
     * 
     * Lista de todas las cartas del juego "cartas"
     * Lista de todas las cartas que son acertadas "cartasAcertadas" que en realidad
     * es la mitad de la lista anterior ya que las cartas están duplicadas
     */

    private List<Carta> cartas;
    private List<String> cartasAcertadas;
    
    private int cartaPulsada = -1;
    private int cartaPulsadaAntes = -1;

    private boolean mostrandoPareja = false;
    private int contador;

    /**
     * El constructor por defecto de la clase java bean mas los getters y
     * setters que son la segunda condición
     * En el inicio las dos listas:
     * La lista de las cartas con todas las cartas duplicadas para el juego 
     * y la otra lista solo la inicio pero esta vacia por el momento
     */
    public ElJuego() {

        contador = 0;
        cartasAcertadas = new ArrayList<>();

//        cartasAbajo.add(new Carta("logo"));
        cartas = new ArrayList<>();
        cartas.add(new Carta("facebook"));
        cartas.add(new Carta("movil1"));
        cartas.add(new Carta("movil2"));
        cartas.add(new Carta("movil3"));
        cartas.add(new Carta("pc1"));
        cartas.add(new Carta("pc2"));
        cartas.add(new Carta("pc3"));
        cartas.add(new Carta("twiter"));
        cartas.add(new Carta("facebook"));
        cartas.add(new Carta("movil1"));
        cartas.add(new Carta("movil2"));
        cartas.add(new Carta("movil3"));
        cartas.add(new Carta("pc1"));
        cartas.add(new Carta("pc2"));
        cartas.add(new Carta("pc3"));
        cartas.add(new Carta("twiter"));
        
        // Barajar las cartas de una manera aleatoria

        Collections.shuffle(cartas);

    }
    
    /**
     * Metodo que devuelve la lista de las cartas barajadas
     * @return la lista cartas
     */

    public List<Carta> getCartas() {

        return cartas;
    }
    
    /**
     * Metodo que devuelve la lista de las cartas acertadas 
     * @return la lista cartasAcertadas
     */

    public List<String> getCartasAcertadas() {

        return cartasAcertadas;
    }
    /**
     * Metodo para mostrar las parejas de cartas 
     * @return devuelve mostrandoPareja si se están mostrandose
     * o no 
     */

    public boolean isMostrandoPareja() {
        return mostrandoPareja;
    }
    
    /**
     * Metodo para cambiar el estado de las cartas si queremos que sequedan
     * mostradas o no
     * @param mostrandoPareja  booleano para controlar el estado
     */

    public void setMostrandoPareja(boolean mostrandoPareja) {
        this.mostrandoPareja = mostrandoPareja;
    }
    
    /**
     * Metodo que devuelve un número entero para controlar 
     * las veces o las jugadas tiradas o pulsadas
     * @return contador número entero 
     */

    public int getContador() {
        return contador;
    }
    
    /**
     * Metodo para controlar o modificar el contador si hace falta
     * @param contador número entero 
     */

    public void setContador(int contador) {
        this.contador = contador;
    }
    
    /**
     * Metodo que devuelve la segunda carta pulsada en forma de entero
     * diferente de -1 que es el valor para cambiar su estado
     * @return cartaPulsada que puede ser -1 o diferente de -1
     */

    public int getCartaPulsada() {
        return cartaPulsada;
    }
    
    /**
     * Metodo para modificar el estado de la segunda carta pulsada según
     * situación
     * @param cartaPulsada entero puede ser -1 o diferente 
     */

    public void setCartaPulsada(int cartaPulsada) {
        this.cartaPulsada = cartaPulsada;
    }
    
    /**
     * Metodo que devuelve la primera carta pulsada en forma de entero 
     * diferente de -1 que es el valor para cambiar el estado de la carta
     * @return cartaPulsadaAntes atributo de clase entero
     */

    public int getCartaPulsadaAntes() {
        return cartaPulsadaAntes;
    }
    
    /**
     * Metodo para modificar el estado de la primera carta pulsada según
     * situación
     * @param cartaPulsadaAntes entero puede ser -1 o diferente 
     */

    public void setCartaPulsadaAntes(int cartaPulsadaAntes) {
        this.cartaPulsadaAntes = cartaPulsadaAntes;
    }

}
