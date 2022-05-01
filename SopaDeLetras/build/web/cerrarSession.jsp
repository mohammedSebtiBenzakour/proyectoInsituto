<%-- 
    Document   : newjsp
    Created on : 02-dic-2021, 21:44:23
    Author     : daw2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cerrar session</h1>
        
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
            
            %>
    </body>
</html>
