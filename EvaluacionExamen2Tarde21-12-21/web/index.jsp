<%-- 
    Document   : index
    Created on : 15-dic-2021, 13:24:12
    Author     : daw44
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="controlador.Matriz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //controlador 

    LocalDateTime fechaYHora = LocalDateTime.now();
    DateTimeFormatter formatoFechaYHora
            = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM).withLocale(request.getLocale());

    Date fYh = new Date();
    DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.MEDIUM, request.getLocale());

    String strFechaYHora = df.format(fYh);

    Matriz matrizA = null;
    Matriz matrizB = null;
    String error = "";
    String nombreMatrizA = "";
    String nombreMatrizB = "";

    int dimensionFilaA = 0;
    int dimensionColumnaA = 0;
    int dimensionFilaB = 0;
    int dimensionColumnaB = 0;

    if (request.getParameter("dimensionFilaA") != null) {
        nombreMatrizA = request.getParameter("nombreMatrizA");
        nombreMatrizB = request.getParameter("nombreMatrizB");

        dimensionFilaA = Integer.parseInt(request.getParameter("dimensionFilaA"));
        dimensionColumnaA = Integer.parseInt(request.getParameter("dimensionColumnaA"));
        matrizA = new Matriz(nombreMatrizA, dimensionFilaA, dimensionColumnaA);
        dimensionFilaB = Integer.parseInt(request.getParameter("dimensionFilaB"));
        dimensionColumnaB = Integer.parseInt(request.getParameter("dimensionColumnaB"));
        matrizB = new Matriz(nombreMatrizB, dimensionFilaB, dimensionColumnaB);
        session.setAttribute("matrizA", matrizA);
        session.setAttribute("matrizB", matrizB);
        System.out.println("matrices creadas");
        response.sendRedirect("mostrarMatriz.jsp");
        return;
    }

    //response.sendRedirect("mostrarMatriz.jsp");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilo.css"> 
        <link rel="stylesheet" type="text/css" href="css/estil.css"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Lobster&family=Pacifico&display=swap" rel="stylesheet">
        <title>Matrices</title>
    </head>
    <body>
    <center>
        <h1>Matrices <%= strFechaYHora%></h1>
        <!-- MANDAMOS EL FICHERO A NOSOTROS MISMOS Y HACEMOS DESPUES UN SEND REDIRECT CON RETURN PARA QUE LOS DATOS
        SE GUARDEN EN LA SESSION AL ENVIAR AL OTRO FICHERO-->
        <form method="get" >
            <label>Nombre Matriz a </label>
            <input type="text" name="nombreMatrizA"  value="a" required="">
            <label>Dimension Matriz a:</label>
            Fila <input type="number" name="dimensionFilaA" required value="3" min="0">
            Columna <input type="number" name="dimensionColumnaA" required value="4"  min="0"><br><br>
            <label>Nombre Matriz b </label>
            <input type="text" name="nombreMatrizB" required value="b">
            <label>Dimension Matriz b:</label>
            Fila <input type="number" name="dimensionFilaB" required value="4"  min="0" >
            Columna <input type="number" name="dimensionColumnaB" required value="4"  min="0"><br><br>
            <input type="submit" value="Enviar" class="introducir">
        </form>
        <h2> <a href="index.jsp" class="volver" >volver</a><a href="cession.jsp" class="cerrar" >cerrar session</a></h2>
    </center>
</body>
</html>
