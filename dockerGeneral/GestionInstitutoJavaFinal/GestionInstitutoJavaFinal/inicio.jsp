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
        <title>Gestion Instituto</title>
        <link href="css/inicio.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilosNotas.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <script>

        function mostrarMensaje() {
            /* alert("${param.mensaje}");*/
            Swal.fire({
                title: '${param.mensaje}',
                type: 'success'
            })
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
        <h1 class="d-flex justify-content-center">Gestion de alumnos </h1>

        <section class="container">

            <!-- https://www.codejava.net/java-ee/servlet/webservlet-annotation-examples -->

        </section>
        <section class="contenedor-imagenes pb-5">
            <div class="imagen">
                <img src="imagenes/1 (2).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/gestionAlumnos.jsp" class="esconderMenu">Gestionar Alumnos</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="imagenes/1 (3).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/gestionMaterias.jsp" class="esconderMenu">Gestionar Materias</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="imagenes/1 (4).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/gestionNiveles.jsp" class="esconderMenu">Gestionar Niveles</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="imagenes/1 (5).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/gestionCursos.jsp" class="esconderMenu">Gestionar Cursos</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="imagenes/1 (6).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/gestionEvaluaciones.jsp" class="esconderMenu">Gestionar Evaluaciones</a></h2>
                </div>
            </div>
            <div class="imagen">
                <img src="imagenes/1 (7).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/gestionMatriculas.jsp" class="esconderMenu">Gestionar Matriculas</a></h2>
                </div>
            </div>
                 <div class="imagen">
                <img src="imagenes/1 (4).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/enviarEmail.jsp" class="esconderMenu">Enviar email con imagenes o documentos</a></h2>
                </div>
            </div>
            <div class="imagen ">
                <img src="imagenes/1 (2).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/leerEmail.jsp" class="esconderMenu">Leer El correo</a></h2>
                </div>
            </div>
             <div class="imagen">
                <img src="imagenes/1 (8).jpg" alt="">
                <div class="overlay">
                    <h2><a href="admin/insertarImagenes.jsp" class="esconderMenu">Subida y Inserción de imagenes y documentos</a></h2>
                </div>
            </div>
            <div class="imagen ">
                <img src="imagenes/imagenVolver.jpg" alt="">
                <div class="overlay">
                    <h2><a href="index.html" class="esconderMenu">Volver</a></h2>
                </div>
            </div>

        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>
