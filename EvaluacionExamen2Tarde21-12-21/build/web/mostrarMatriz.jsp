<%-- 
    Document   : mostrarMatriz
    Created on : 15-dic-2021, 13:38:15
    Author     : daw44
--%>

<%@page import="controlador.Matriz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Matriz matrizA = (Matriz) session.getAttribute("matrizA");
    Matriz matrizB = (Matriz) session.getAttribute("matrizB");

    String textoA = null;
    String textoB = null;
    String numeroA = null;
    String numeroB = null;
    double numA = 0.0;
    double numB = 0.0;
    boolean hayParametros = false;

    if (request.getParameter("vaA0-0") != null) {
        double[][] vaA = matrizA.getValores();
        System.out.println("despues del null");
        for (int i = 0; i < matrizA.getFilas(); i++) {
            for (int j = 0; j < matrizA.getColumnas(); j++) {
                textoA = "vaA" + i + "-" + j;
                numeroA = request.getParameter(textoA);
                numA = Double.parseDouble(numeroA);
                vaA[i][j] = numA;
                System.out.println("matrices creadas");
            }
        }

    }

    if (request.getParameter("vbB0-0") != null) {
        double[][] vbB = matrizB.getValores();
        System.out.println("despues del null");
        for (int i = 0; i < matrizB.getFilas(); i++) {
            for (int j = 0; j < matrizB.getColumnas(); j++) {
                textoB = "vbB" + i + "-" + j;
                numeroB = request.getParameter(textoB);
                numB = Double.parseDouble(numeroB);
                vbB[i][j] = numB;
                System.out.println("matrices creadas");
            }
        }

    }


%>
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
        <h1>Matrices</h1>
        <form method="get">
            <h3>Se pueden introducir valores negativos o positivos</h3>
            <h4>Matriz :<%= matrizA.getNombre()%></h4>
            <table class='matriz'>
                <%                    for (int i = 0; i < matrizA.getFilas(); i++) {
                %>
                <tr>
                    <%
                        for (int j = 0; j < matrizA.getColumnas(); j++) {
                            textoA = "vaA" + i + "-" + j;
                    %>
                    <td class='der'><input type="number" name="<%= textoA%>"  size="4" value="0" required=""></td>
                        <%
                            }
                        %>
                </tr>
                <%
                    }
                %>
            </table>
            <br>
            <h4>Matriz : <%= matrizB.getNombre()%></h4>
            <table class='matriz'>
                <%                    for (int i = 0; i < matrizB.getFilas(); i++) {
                %>
                <tr>
                    <%
                        for (int j = 0; j < matrizB.getColumnas(); j++) {
                            textoB = "vbB" + i + "-" + j;
                    %>
                    <td class='der'><input type="number" name="<%= textoB%>"  size="4" value="0" required="" ></td>
                        <%
                            }
                        %>
                </tr>
                <%
                    }
                %>
            </table>

            <%
                if (matrizA != null && matrizB != null) {
            %>
             <br><table class='matriz'  >
                <tr>
                    <td class='der'><%= matrizA.toString()%></td>
                    <td class='der'><%= matrizB.toString()%> </td>
                    <%
                       // try {
                    %>
                    <td class='der'><%= matrizA.multiplicar(matrizB)%></td>
                    <%--        <%

                  //  } catch (NegativeArraySizeException e) {
                    %> 
               <h3 class="error">No se pudo hacer la Multiplicacion , Error al introducir datos </h3>--%>
                <%
                 //   }


                %>

                </tr>
            </table>

            <br>   <input type="submit" name="introducir" value="Introducir Valor" class="introducir">  
        </form>
        <%            }
        %>
        <br>

        <h2> <a href="index.jsp" class="volver" >volver</a><a href="cession.jsp" class="cerrar" >cerrar session</a></h2>
    </center>
</body>
</html>
