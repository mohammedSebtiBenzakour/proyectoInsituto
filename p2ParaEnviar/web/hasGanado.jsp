<%-- 
    Document   : hasPerdido
    Created on : 11-dic-2021, 16:16:24
    Author     : daw2

/*
 Estas navidades queremos felicitar a nuestros amigos de forma original, y para ello
desarrollaremos un juego sencillo con tecnolog�a JSP: Descubrir parejas navide�as. 

Es una pagina en el caso que el usuario ha ganado el juego

Pagina hasGanado.jsp
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
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="controlador.ElJuego"%>
<%
    
     /**
     * He utilizado la clase LocalDateTime para acostumbrarme y acordandome de
     * ella asi de como se utiliza en el futuro puedes visitar para mas
     * informacion la siguiente documentaci�n
     *
     * @see
     * <a href="https://docs.oracle.com/javase/8/docs/api/java/time/LocalDateTime.html">LocalDateTime</a>
     *
     */
    LocalDateTime fechaYHora = LocalDateTime.now();
    DateTimeFormatter formatoFechaYHora
            = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM).withLocale(request.getLocale());

    Date fYh = new Date();
    DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.MEDIUM, request.getLocale());

    String strFechaYHora = df.format(fYh);
    
     /**
     * Obtengo el usuario que ha iniciado el juego de la sesi�n para conservarlo
     * hasta que decida terminar o abandonar
     */

    String usuario = (String) session.getAttribute("usuario");
    usuario = usuario.toUpperCase();
    
    /**
     * Se crea un objeto de la clase El Juego Y lo obtengo de la sesi�n
     */

    ElJuego juego = (ElJuego) session.getAttribute("juego");

    int contador = juego.getContador();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel='stylesheet' href='estilos/estilos.css'>
        <link rel='stylesheet' href='estilos/hasGanado.css'>
        <title>Juego parejas</title>
    </head>
    <body>
    <center>
        <h1>Juego parejas</h1>
        <h2>El usuario es : <%= usuario%> <br> y la fecha de hoy es :<br> <%= strFechaYHora%> </h2>
        <h2 class="hasGanado">Has ganado . Lo has hecho en <%= contador%> intentos.  </h2>
        <div>
            <%--
            Imagen conseguida de internet para mostrar
            --%>
            <img src="imagenes/hasGanado.jpg" name="" width="400px"  alt="hasGanado"/>
        </div>
        <br>
        <form action="juego.jsp" method="post">
            <input type="submit" name="reiniciar" value="reiniciar" id="reiniciar">
        </form>
    </center>
</body>
</html>
