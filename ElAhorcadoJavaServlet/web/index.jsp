<%-- 
    Document   : index
    Created on : 26-dic-2021, 17:05:54
    Author     : daw2
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="controladores.ElAhorcado"%>
<%@page import="java.util.Random"%>
<%

    request.setCharacterEncoding("UTF-8");

    ElAhorcado elA = new ElAhorcado();

    boolean juegoTerminado = false;
    String letra = request.getParameter("letra");
    Character let = 0;
    String error = "";
    String ganado = "";
    String perdido = "";
    boolean hayParametros = false;
    boolean juegoGanado = false;
    boolean algunaLetraAcertada = false;
    int intentos = 4;
    String vacio = "";

    char[] palabraGuiones = null;
    String palabraSecreta = "";

    char[] pg = null;
    String ps = "";
    if (letra != null) {
        hayParametros = true;
        let = letra.charAt(0);
    }

    palabraSecreta = ElAhorcado.getPalabraSecreta();
    palabraGuiones = ElAhorcado.getGuionesFromPalabra(palabraSecreta);
    List<Character> letrasErroneas = new LinkedList<Character>();

    session.setAttribute("palabraSecreta", palabraSecreta);
    session.setAttribute("palabraGuiones", palabraGuiones);
    session.setAttribute("letrasErroneas", letrasErroneas);
    session.setAttribute("intentos", intentos);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bad+Script&family=Corinthia:wght@700&family=Gloria+Hallelujah&family=Lobster&family=Pacifico&family=Permanent+Marker&family=Pushster&family=Rock+Salt&family=Sofia&family=Special+Elite&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css" type="text/css"/>        
        <title>EL AHORCADO</title>
    </head>
    <body>
    <center>
        <h1>EL AHORCADO!</h1>
        <h2>La palabra a adivinar es : <%= palabraSecreta%></h2>
        <h2><%= error%></h2>

        <form action="index2.jsp" method="post">
            <p> <input type="text" name="letra" placeholder="insertar letra" maxlength="1" autocomplete="off" autofocus value="" required title="Debes Introducir una letra"></p>
            <p> <input type="submit" name="submit" value="submit" id="submit"></p>
        </form>
        <a href="sesionCerrar.jsp">Cerrar session</a>
        <a href="http://localhost/ProyectoPropioBootstrapGestionInstyituto010422/index.php">Volver</a>
    </center>
</body>
</html>
