<%-- 
    Document   : index
    Created on : 26-nov-2021, 14:26:07
    Author     : daw44
--%>
<%@page import="java.util.Random"%>
<%@page import="modelo.Direccion"%>
<%@page import="modelo.SopaDeLetras"%>
<%  // controlador
    String error = "";
    boolean verificar = false;
    SopaDeLetras sopaDeLetras = (SopaDeLetras) session.getAttribute("sopaDeLetras");
    SopaDeLetras sopaDeLetrasCol = (SopaDeLetras) session.getAttribute("sopaDeLetrasCol");

    if (sopaDeLetras == null) {
        sopaDeLetras = new SopaDeLetras();
        session.setAttribute("sopaDeLetras", sopaDeLetras);
        session.setAttribute("sopaDeLetrasCol", sopaDeLetrasCol);
    }
    String palabra = request.getParameter("palabra");
    if (palabra != null) {
        String direccion = request.getParameter("direccion").toUpperCase();
        try {
            sopaDeLetras.insertarPalabra(palabra, Direccion.valueOf(direccion));

        } catch (IllegalArgumentException e) {
            error = e.getMessage();
        }

    }

    if (request.getParameter("rellenar") != null) {
        if (verificar == false) {
            sopaDeLetras.rellenar();
        }

        //  sopaDeLetras.rellenarLetras();
    }

    char[][] letras = sopaDeLetras.getLetras();
    char[][] letrasColor = sopaDeLetras.getLetrasColor();

%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="estilos/estilos.css" type="text/css"/>
        <title>JSP Sopa de letras</title>
    </head>
    <body>
    <center>
        <h1>Sopa de letras</h1>

        <table>
            <tr><td>
                    <table border="1">
                        <%                for (int fila = 0; fila < letras.length; fila++) {

                        %>
                        <tr>
                            <%                    for (int columna = 0; columna < letras[fila].length; columna++) {

                                    if (letras[fila][columna] == letrasColor[fila][columna]) {
                                        verificar = true;
                            %>
                            <td> <%= letras[fila][columna]%></td>
                            <%
                            } else {
                                verificar = false;
                            %>
                            <td class="azul"> <%= letras[fila][columna]%></td>
                            <%

                                    }
                                }
                            %>
                            <%
                                }
                            %>
                        </tr>
                    </table>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <table border="1">
                        <%                for (int fila = 0; fila < letrasColor.length; fila++) {

                        %>
                        <tr>
                            <%                    for (int columna = 0; columna < letrasColor[fila].length; columna++) {


                            %>
                            <td> <%= letrasColor[fila][columna]%></td>
                            <%

                                }
                            %>
                            <%
                                }
                            %>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <form method="POST">
            <label>Palabra</label>
            <input type="text" name="palabra" required=""> 
            <select name="direccion">
                <option value="derecha">Derecha</option>
                <option value="izquierda">Izquierda</option>
                <option value="arriba">Arriba</option>
                <option value="abajo">Abajo</option>
                <option value="DERECHA_ABAJO">DERECHA ABAJO</option>
                <option value="DERECHA_ARRIBA">DERECHA ARRIBA</option>
                <option value="IZQUIERDA_ABAJO">IZQUIERDA ABAJO</option>
                <option value="IZQUIERDA_ARRIBA">IZQUIERDA ARRIBA</option>
            </select> <br><br>
            <input type="submit" value="Aceptar">

        </form>
        <br><br>
        <form method="POST">
            <input type="submit" value="rellenar huecos" name="rellenar">
        </form>
        <br>
        <%
            if (!error.isEmpty()) {
        %>
        <div><%= error%></div>
        <%
            }
        %>

        <br>

        <form method="POST" action="cerrarSession.jsp">
            <input type="submit" value="Cerrar session" >
        </form>
        <a href="index.jsp">volver</a>
    </center>
</body>
</html>
