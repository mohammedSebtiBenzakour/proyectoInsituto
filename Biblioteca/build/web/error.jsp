<%-- 
    Document   : error
    Created on : 31-dic-2021, 0:33:47
    Author     : daw2
--%>
<%

    String error = (String) session.getAttribute("error");

   response.setHeader("Refresh", "5; URL=registrarse.jsp");


%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/estiloCounterDown.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
       
        <div id="app"></div>
        <h2 style="color: black;"><%= error%></h2>

       
        <a href="index.jsp">Volver</a><br>
        <script src="js/counterDown.js"></script>
    </body>
</html>
