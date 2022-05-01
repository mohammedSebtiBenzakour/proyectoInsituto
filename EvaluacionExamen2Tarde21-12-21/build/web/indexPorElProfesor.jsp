<%-- 
    Document   : indexPorElProfesor
    Created on : 21-dic-2021, 10:17:12
    Author     : daw44
--%>

<%
    session.invalidate();
%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link rel="stylesheet" type="text/css" href="css/estilo.css"> 
        <link rel="stylesheet" type="text/css" href="css/estil.css"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&family=Lobster&family=Pacifico&display=swap" rel="stylesheet">
        <title>Matrices</title>
    </head>
    <body>
    <center>
        <h1>Matrices!</h1>
        <br>
        <h3>Introduzca los nombres y las dimensiones de las dos matrices</h3>
        <form action="introducirMatrices.jsp" method="post">
            <label>Matriz 1</label>
            <br>
            <label>Nombre</label>
            <input type="text" name="nombre1" required="" maxlength="10">
            <label>Filas</label>
            <input type="number" name="filas1" required="" min="1" >
            <label>Columnas</label>
            <input type="number" name="columnas1" required="" min="1">
            <br> <br>
            <label>Matriz 2</label>
            <br>
            <label>Nombre</label>
            <input type="text" name="nombre2" required="" maxlength="10">
            <label>Filas</label>
            <input type="number" name="filas2" required="" min="1" >
            <label>Columnas</label>
            <input type="number" name="columnas2" required="" min="1">
            <br> <br>
            <input type="submit" name="aceptar" value="Aceptar">
        </form>
    </center>
</body>
</html>
