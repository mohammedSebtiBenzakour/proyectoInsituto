<%-- 
    Document   : inicio
    Created on : 19-mar-2022, 20:19:07
    Author     : daw2
--%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>JSP Page</title>
        <link href="css/inicio.css" rel="stylesheet" type="text/css"/>
    </head>
    <script>

        function mostrarMensaje() {
            alert("${param.mensaje}");
        }

    </script>
    <body onload='${empty param.mensaje?"":"mostrarMensaje()"}' class="container">

        <div class="container ">
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <div class="ps-5">
                    <a class="navbar-brand" href="login.jsp">Menu General</a>
                </div>

                <div class="ps-5">
                    <jsp:include page="encabezado.jsp" >
                        <jsp:param name="título" value="Pagina Principal"/>
                    </jsp:include>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                    <a href="CerrarSesion" class="pe-5">Cerrar Sesión</a>
                    <fmt:timeZone  value="Europe/Madrid" >
                        <fmt:formatDate type="both" dateStyle="full"  value="${now}"/>
                    </fmt:timeZone>
                </div>
            </div>
        </nav>
        <h1 class="d-flex justify-content-center">Gestion de alumnos</h1>

        <section class="container">

            <h3> <a href="admin/gestionAlumnos.jsp">Gestionar Alumnos</a></h3>
            <h3> <a href="admin/gestionMaterias.jsp">Gestionar Materias</a></h3>

            <h3> <a href="index.html">Volver</a></h3>
            <!-- https://www.codejava.net/java-ee/servlet/webservlet-annotation-examples -->

        </section>






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>
