<%-- 
    Document   : introducirMatrices
    Created on : 21-dic-2021, 10:37:29
    Author     : daw44
--%>
<%@page import="controlador.Matriz"%>
<%
    String ruta = request.getContextPath();
    //Controlador
    if (request.getParameter("nombre1") == null) {
        response.sendRedirect("indexPorElProfesor.jsp");
        return;
    }
    String nombre1 = request.getParameter("nombre1");
    int filas1 = Integer.parseInt(request.getParameter("filas1"));
    int columnas1 = Integer.parseInt(request.getParameter("columnas1"));

    String nombre2 = request.getParameter("nombre2");
    int filas2 = Integer.parseInt(request.getParameter("filas2"));
    int columnas2 = Integer.parseInt(request.getParameter("columnas2"));

    Matriz m1 = new Matriz(nombre1, filas1, columnas1);
    Matriz m2 = new Matriz(nombre2, filas2, columnas2);

    session.setAttribute("m1", m1);
    session.setAttribute("m2", m2);


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
        <title>Introducir los valores Matrices</title>
    </head>
    <body>
         <center>
        <h1>Introducir los valores Matrices!</h1>
        <h2><%= m1%></h2>
        <br>
        <form action="multiplicarMatrices.jsp" method="post">
            <table>
                <tr>
                    <td><%= m1.getNombre()%> = </td>
                    <td>
                        <table class="matriz">
                            <%
                                for (int f = 0; f < m1.getFilas(); f++) {
                                    out.println("<tr>");
                                    for (int c = 0; c < m1.getColumnas(); c++) {
                                        String inputName = "m1_" + f + "_" + c;
                            %>
                            <td>
                                <input type="number" name="<%= inputName%>" required="" step="0.01">
                            </td>
                            <%
                                    }
                                    out.println("</tr>");
                                }

                            %>
                        </table>
                    </td>
                </tr>
            </table>
            <br>
            <table>
                <tr>
                    <td><%= m2.getNombre()%> = </td>
                    <td>
                        <table class="matriz">
                            <%
                                for (int f = 0; f < m2.getFilas(); f++) {
                                    out.println("<tr>");
                                    for (int c = 0; c < m2.getColumnas(); c++) {
                                        String inputName = "m2_" + f + "_" + c;
                            %>
                            <td>
                                <input type="number" name="<%= inputName%>" required="" step="0.01">
                            </td>
                            <%
                                    }
                                    out.println("</tr>");
                                }

                            %>
                        </table>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="submit" value="Aceptar">
        </form>
        <h2> <a href="indexPorElProfesor.jsp" class="volver" >volver</a></h2>
         </center>
    </body>
</html>
