/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladorEditarLibro;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author daw2
 */
public class ClaseParaValidarDatos {
    public static boolean validarDatos(String nombre) {
        String patronRegular = "^[A-Za-z\\s]{1,}[\\.]{0,1}[A-Za-z\\s]{0,}$";

        String patron = "^\\pL+[\\pL\\pZ\\pP]{0,}$";
        Pattern p = Pattern.compile(patron, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();

        //^[0-9]{4}-[0-9]{4}$
    }

    public static boolean validarDatosNumeros(String nombre) {
        String patronRegular = "^[0-9]{4}-[0-9]{4}$";

        String patron = "^\\pL+[\\pL\\pZ\\pP]{0,}$";
        Pattern p = Pattern.compile(patronRegular, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();

    }

    public static boolean validarSoloNumeros(String nombre) {
        String patronRegular = "^[0-9]{4}-[0-9]{4}$";

        String patron = "^([0-9][0-0]?)$";
        Pattern p = Pattern.compile(patron, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();

    }

    public static boolean validarSoloNumerosDecimales(String nombre) {
        String patronRegular = "^[0-9]{4}-[0-9]{4}$";

        String patron = "^[0-9]{1}+([.][0-9]{1,2})?$";
        Pattern p = Pattern.compile(patron, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();

    }

    public static boolean validarSoloTexto(String nombre) {
        String patronRegular = "^[0-9]{4}-[0-9]{4}$";

        String patron = "^[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ.-]+$";
        Pattern p = Pattern.compile(patron, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();

    }
        public static boolean validarEmail(String nombre) {
        String patronRegular = "^[0-9]{4}-[0-9]{4}$";

        String patron = "^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$";
        Pattern p = Pattern.compile(patron, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();

    }
}
