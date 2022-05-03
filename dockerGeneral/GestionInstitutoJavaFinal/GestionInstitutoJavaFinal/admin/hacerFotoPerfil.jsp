<%-- 
    Document   : insertarImagenes
    Created on : 09-abr-2022, 17:19:23
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
        <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilosNotas.css" rel="stylesheet" type="text/css"/>
        <link href="../css/cam.css" rel="stylesheet" type="text/css"/>
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
                    <jsp:include page="encabezadoAdmin.jsp" >
                        <jsp:param name="título" value="Pagina Principal"/>
                    </jsp:include>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                    <a href="../CerrarSesion" class="pe-5">Cerrar Sesión</a>
                    <fmt:timeZone  value="Europe/Madrid" >
                        <fmt:formatDate type="both" dateStyle="full"  value="${now}"/>
                    </fmt:timeZone>
                </div>
            </div>
        </nav>
        <h1 class="d-flex justify-content-center">Hacer foto de perfil</h1>


        <section class="container mb-3">
            <label class="container mb-3 w-50 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">La captura real de la imagen </label>
        </section>

        <section class="container booth mb-5 ">
            <video id="video" width="500" height="400"  ></video>
            <a href="#" id="hacerFoto" class="booth-capture-button">Hacer foto de perfil</a>
            <canvas id="canvas" width="500" height="400" class="d-flex justify-content-center align-items-center"></canvas>
            <img id="foto" src="http://lorempixel.com/400/300" alt="Foto">
        </section>
        
        <footer class="container mb-3 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">
            <h2><a href="insertarImagenes.jsp" class="botonInicio">Volver a subida de archivos</a></h2>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="../js/photo.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>
