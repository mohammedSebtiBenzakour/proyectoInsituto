<%-- 
    Document   : enviarEmailAlumnoNota
    Created on : 27-mar-2022, 15:54:15
    Author     : daw2

Formulario para enviar por email nota alumno
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=latin1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Short+Stack&display=swap" rel="stylesheet">
    <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.css"/>
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
    <h1 class="d-flex justify-content-center">Enviar Notas Alumno por Email</h1>
    <section class="container">
        <span class="menu-bar"><i class="fa fa-bars fa-2x" aria-hidden="true"></i></span>
        <main class="form-signin" >
            <h5 class="errores d-flex justify-content-center" ${empty error?"hidden":""}>
                ${error}
            </h5>
            <form action="EnviarEmail?usuario=${param.usuario}&dni=${param.dni}" method="post">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Subject email</label>
                    <input type="text" name="subject_email" class="form-control" id="exampleFormControlInput1" placeholder="Subject email">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Notas y observaciones</label>
                    <textarea class="form-control" name="notificaciones" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <button class="w-100 btn btn-primary btn-lg" type="submit" name="enviarEmail">Enviar email</button>
            </form>
        </main>
    </section>

    <footer class="container mb-3">
        <a class="w-100 btn btn-warning btn-lg mt-2" href="gestionAlumnos.jsp">Volver</a>
        <p class="copyright">Mohammed S B  &copy; 2022 </p>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("table").DataTable();
        });
    </script>
</body>
</html>
