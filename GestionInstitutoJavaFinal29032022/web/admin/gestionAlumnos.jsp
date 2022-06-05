<%-- 
    Document   : gestionAlumnos
    Created on : 20-mar-2022, 10:15:54
    Author     : daw2

Fichero para gestionar alumnos
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="latin1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Short+Stack&display=swap" rel="stylesheet">
        <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilosNotas.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Gestion Instituto</title>
        <script>

            function mostrarMensaje() {
               // alert("${param.mensaje}");
               Swal.fire({
                title: '${param.mensaje}',
                type: 'success'
            })
            }

        </script>
    </head>
    <body onload='${empty param.mensaje?"":"mostrarMensaje()"}'>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <div class="ps-5">
                    <a class="navbar-brand" href="../login.jsp">Menu General</a>
                </div>

                <div class="ps-5">
                    <jsp:include page="encabezadoAdmin.jsp" >
                        <jsp:param name="t�tulo" value="Pagina Principal"/>
                    </jsp:include>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                    <a href="../CerrarSesion" class="pe-5">Cerrar Sesi�n</a>
                    <fmt:timeZone  value="Europe/Madrid" >
                        <fmt:formatDate type="both" dateStyle="full"  value="${now}"/>
                    </fmt:timeZone>
                </div>
            </div>
        </nav>
        <h1 class="d-flex justify-content-center">Gestion de alumnos</h1>
        <section class="container">
            <div class="row">
                <div class="col">
                   
                </div>
            </div>
        </section>
        <section class="contenedor-imagenes">
            <div class="imagen">
                <img src="../imagenes/1 (2).jpg" alt="">
                <div class="overlay">
                    <h2><a href="MostrarListadoAlumnos" class="esconderMenu">Mostrar Listado Alumnos</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="../imagenes/1 (3).jpg" alt="">
                <div class="overlay">
                    <h2><a href="mostrarNotasAlumnos.jsp" class="esconderMenu">Mostrar Notas Por Alumnos</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="../imagenes/1 (4).jpg" alt="">
                <div class="overlay">
                    <h2><a href="MostrarTodasLasNotas" class="esconderMenu">Mostrar todas las Notas de todos los Alumnos y enviarlas por email</a></h2>
                </div>
            </div>
               <div class="imagen">
                <img src="../imagenes/1 (5).jpg" alt="">
                <div class="overlay">
                    <h2><a href="Pdf" class="esconderMenu">Generar PDF de todas las Notas de todos los Alumnos</a></h2>
                </div>
            </div>
           
                           
        </section>
        
          <!--section class="container ">
            <h2 class="d-flex justify-content-center">Generar PDF de todas las Notas de todos los Alumnos</h2>
            <a class="d-flex justify-content-center btn btn-primary mb-3" href="Pdf">Generar PDF</a>
        </section-->
        <footer class="container d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">
            <h2><a href="../inicio.jsp" class="botonInicio">Volver</a></h2>
        </footer>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>
