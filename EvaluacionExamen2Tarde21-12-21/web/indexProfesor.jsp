<%-- 
    Document   : indexProfesor
    Created on : 15-dic-2021, 13:47:23
    Author     : daw44
--%>

<%@page import="controlador.Matriz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Matriz a = new Matriz();
    Matriz b = new Matriz();
%>
<%
    double[][] vA = a.getValores();
    for (int i = 0; i < a.getFilas(); i++) {
        for (int j = 0; j < a.getColumnas(); j++) {
            vA[i][j] = Math.random() * 100;
        }
    }
    b.setNombre("B");
    b.setColumnas(4);
    double[][] vB = b.getValores();
    for (int i = 0; i < b.getFilas(); i++) {
        for (int j = 0; j < b.getColumnas(); j++) {
            vB[i][j] = Math.random() * 100;
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matrices</title>
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
    </head>
    <body>
        <h1>Matrices</h1>
        <%= a %>
        <%= b %>
        <%= a.multiplicar(a) %>
        <%= a.multiplicar(b) %>
        <%= a.multiplicar(Matriz.identidad(a.getFilas())) %>
        <%= Matriz.identidad(b.getFilas()).multiplicar(b) %>
                
                
                
    </body>
</html>