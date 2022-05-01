/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package central;

/**
 *
 * @author daw2
 */
public class Email {

    private String from = "";
    private String to = "";
    private String subject = "";
    private String text = "";

    /**
     * Constructor por defecto
     */
    public Email() {
    }

    /**
     * Metodo para obtener el atributo from
     *
     * @return
     */
    public String getFrom() {
        return from;
    }

    /**
     * Metodo para modificar el atributo from
     *
     * @param from
     */
    public void setFrom(String from) {
        this.from = from;
    }

    /**
     * Metodo para obtener el atributo to
     *
     * @return
     */
    public String getTo() {
        return to;
    }

    /**
     * Metodo para modificar el atributo to
     *
     * @param to
     */
    public void setTo(String to) {
        this.to = to;
    }

    /**
     * Metodo para obtener el atributo subject
     *
     * @return
     */
    public String getSubject() {
        return subject;
    }

    /**
     * Metodo para modificar el atributo subkect
     *
     * @param subject
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * Metodo para obtener el atributo text
     *
     * @return
     */
    public String getText() {
        return text;
    }

    /**
     * Metodo para obtener el atributo text
     *
     * @param text
     */
    public void setText(String text) {
        this.text = text;
    }
}
