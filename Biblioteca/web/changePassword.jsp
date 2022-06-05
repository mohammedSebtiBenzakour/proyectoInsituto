<%-- 
    Document   : changePassword
    Created on : 31-dic-2021, 21:37:55
    Author     : daw2

Fichero con tratamiento para el cambio de contraseña
--%>

<%@page import="controlador.Conexion"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%

    //Funciona muy bien 
    String currentPassword = request.getParameter("current");
    String Newpass = request.getParameter("new");
    String conpass = request.getParameter("confirm");
    Connection con = Conexion.conectarBD();

    String pass = "";
    int id = 0;
    try {

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from usuarios where password='" + currentPassword + "'");
        while (rs.next()) {
            id = rs.getInt(1);
            pass = rs.getString(4);
        }
        System.out.println(id + " " + pass);
        if (pass.equals(currentPassword)) {
            Statement st1 = con.createStatement();
            int i = st1.executeUpdate("update usuarios set password='" + Newpass + "' where id='" + id + "'");
            out.println(" <center>");
            out.println("Password changed successfully");
            out.println(" </center>");
            st1.close();
            con.close();
        } else {
            out.println(" <center>");
            out.println("Invalid Current Password");
            out.println(" </center>");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=latin1">

        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <title>Cambio contraseña</title>
    </head>

    <body>
    <center>
        <h1>Cambio contraseña</h1>
    </center>
</body>
</html>
