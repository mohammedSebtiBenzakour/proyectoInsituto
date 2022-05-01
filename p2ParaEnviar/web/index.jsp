<%-- 
    Document   : index
    Created on : 08-dic-2021, 15:02:33
    Author     : daw2
Estas navidades queremos felicitar a nuestros amigos de forma original, y para ello
desarrollaremos un juego sencillo con tecnología JSP: Descubrir parejas navideñas. 

Pagina index.jsp (Inicio)

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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel='stylesheet' href='estilos/estilos.css'>
        <title>Juego parejas</title>
    </head>
    <body>
    <center>
        <h1>Juego parejas</h1>
        <%--   Un formulario para solicitar el nombre al usuario que va a jugar
                He utilizado el fichero prueba.jsp solo para guardar el usuario en la sesión
        y despues redirigir directamente el usuario a la pagina juego.jsp para iniciar el
        juego

        --%>

        <form action="prueba.jsp" method="POST">
            <label>Introduce tu nombre de usuario :</label>
            <input type="text" name="usuario" >
            <input type="submit" name="entrar" value="Entrar">
        </form>
    </center>
</body>
</html>
