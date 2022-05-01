<%-- 
    Document   : forgot-process
    Created on : 31-dic-2021, 20:11:23
    Author     : daw2
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="controlador.EnviarEmail"%>
<%@page import="controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="css/estiloForgotPassword.css" rel="stylesheet" type="text/css"/>
        <title>Count Rows JSP</title>
    </head>
    <body>
        <center>
            <%
                
                //Este servlet funciona algunas veces si algunas veces no  estoy intentando saber porque
                //  request.setCharacterEncoding("UTF-8");
                String email = request.getParameter("email");
                try {

                    String sql = "SELECT password FROM usuarios where email='" + email + "'";
                    Connection con = Conexion.conectarBD();
                    Statement st = con.createStatement();

                    ResultSet rs = st.executeQuery(sql);
                    rs.first();
                    String filas = rs.getString(1);

                    if (rs.first()) {
                        /*mail code
                        paste your mail code here
                        ------------------
                        Mail code*/

                        EnviarEmail.enviarEmail(email, filas);
                        out.println("Password send to your email id successfully !");
                    } else {

                        out.println("Invalid Email Id !");
                        out.println("email !" + email);
                        out.println("filas !" + filas);
                        out.println("rs !" + rs.first());
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <h2><a href="index.jsp">Volver</a><br></h2>
        </center>
    </body>
</html>
