<%-- 
    Document   : index2
    Created on : 26-dic-2021, 19:57:40
    Author     : daw2
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="controladores.ElAhorcado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");

    String palabraSecreta = (String) session.getAttribute("palabraSecreta");
    char[] palabraGuiones = (char[]) session.getAttribute("palabraGuiones");
    ElAhorcado elA = new ElAhorcado();
    List<Character> letrasErroneas = (List<Character>) session.getAttribute("letrasErroneas");
    Integer intentos = (Integer) session.getAttribute("intentos");

    boolean juegoTerminado = false;
    String letra = request.getParameter("letra");
    Character let = null;
    String error = "";
    String ganado = "";
    String perdido = "";
    String resultado = "";
    String disabled = "";
    boolean hayParametros = false;
    boolean juegoGanado = false;
    boolean algunaLetraAcertada = false;
    
    if (letra == null) {
            response.sendRedirect("index.jsp");
            return;
        }

    if (letra != null) {
        hayParametros = true;
        let = letra.charAt(0);
    }

    if (hayParametros) {

        for (int i = 0; i < palabraSecreta.length(); i++) {
            if (palabraSecreta.charAt(i) == let) {
                palabraGuiones[i] = let;
                algunaLetraAcertada = true;
            }
        }
        if (!algunaLetraAcertada) {
            error = "No has acertado esta letra : " + let;
            //  out.print("no has acertado ninguna letra")
            letrasErroneas.add(let);
            session.setAttribute("letrasErroneas", letrasErroneas);
            --intentos;
            session.setAttribute("intentos", intentos);
            if (intentos == 0) {
                perdido = "Has perdido porque agostaste todos los intetos";
                // out.print("has perdido porque agostaste todos los intetos");
                juegoTerminado = true;
                resultado = "La palabra a adivinar era : " + palabraSecreta;
                disabled = "disabled";
            }
        } else {
            juegoGanado = !ElAhorcado.hayGUiones(palabraGuiones);
            if (juegoGanado) {
                ganado = "Has ganado el juego";
                //    out.println("has ganado el juego");
                juegoTerminado = true;
                disabled = "disabled";
            }
        }
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Bad+Script&family=Corinthia:wght@700&family=Gloria+Hallelujah&family=Lobster&family=Pacifico&family=Permanent+Marker&family=Pushster&family=Rock+Salt&family=Sofia&family=Special+Elite&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css" type="text/css"/>      
        <title>JSP Page</title>
    </head>
    <body>

    <center>
        <h1>EL AHORCADO!</h1>
        <h2>La palabra a adivinar es : <%= palabraSecreta%></h2>
        <h2>La palabra con guiones : <%= palabraGuiones%></h2>
        <h2>La lista de las letras erroneas : <%= letrasErroneas%></h2>
        <h2>Te quedan : <%= intentos%> intentos</h2>


        <h2><%= error%></h2>
        <h2><%= perdido%></h2>
        <h2><%= ganado%></h2>
        <h2><%= resultado%></h2>

        <form action="" method="post">
            <p> <input type="text" name="letra" placeholder="insertar letra" maxlength="1" autocomplete="off" autofocus <%= disabled%> required></p>
            <p> <input type="submit" name="submit" value="submit" <%= disabled%> id="submit"></p>
        </form>
        <a href="index.jsp">Volver</a>
        <a href="sesionCerrar.jsp">Cerrar session</a>
    </center>
</body>
</html>
