<%-- 
    Document   : cerrarSession
    Created on : 31-dic-2021, 0:24:05
    Author     : daw2
--%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
   
    
%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
