<%-- 
    Document   : prueba.jsp
    Created on : 12-dic-2021, 18:39:32
    Author     : daw2
Estas navidades queremos felicitar a nuestros amigos de forma original, y para ello
desarrollaremos un juego sencillo con tecnología JSP: Descubrir parejas navideñas. 

Pagina prueba.jsp invisible para el usuario

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

<%

    /**
     * Recojo el usuario enviado por el formulario de la pagina index.jsp
     */
    String usuario = request.getParameter("usuario");
    //Compruebo si el usuario no ha introducido ningún nombre le asigno un nombre 
    //por defecto

    if (usuario == null) {
        usuario = "usuario";

    } else if (usuario.equals("")) {
        usuario = "usuario";

    }
    /**
     * Guardo el nombre del usuario en la sesión
     */

    session.setAttribute("usuario", usuario);
    out.println("El usuario es " + usuario);
    /**
     * Redirijo el usuario directamente a juego.jsp
     */
    response.sendRedirect("juego.jsp");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel='stylesheet' href='estilos/estilos.css'>
        <title>Juego parejas</title>
    </head>
    <body>
        <h1>Juego parejas</h1>
    </body>
</html>
