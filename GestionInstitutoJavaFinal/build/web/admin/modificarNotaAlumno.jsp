<%-- 
    Document   : modificarNotaAlumno
    Created on : 27-mar-2022, 14:37:13
    Author     : daw2
--%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Short+Stack&display=swap" rel="stylesheet">
        <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.css"/>
        <title>Gestion Instituto</title>
        <script>

            function mostrarMensaje() {
                alert("${param.mensaje}");
            }

        </script>
    </head>
    <bodyonload='${empty param.mensaje?"":"mostrarMensaje()"}'>
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
        <h1 class="d-flex justify-content-center">Modificar Nota Alumno</h1>
        <section class="container ">
        <form action="ModificarNotaAlumno" method="post">
            <div class="mb-3 row">
                <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="inputId" name="id" readonly="" value="${id}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="input_dni_alumno" class="col-sm-2 col-form-label">Dni Alumno</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="input_dni_alumno" name="dni_alumno" readonly="" value="${dni_alumno}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="input_nota" class="col-sm-2 col-form-label">Nota Alumno</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="input_nota" name="nota" value="${nota}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="input_observacion" class="col-sm-2 col-form-label">Observación</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="input_observacion" name="observacion" value="${observacion}">
                </div>
            </div>
            <button class="w-100 btn btn-success btn-lg" type="submit" name="modificar_nota" >Modificar Nota</button>
            <a class="w-100 btn btn-warning btn-lg mt-2" href="../inicio.jsp">Volver a Inicio</a>
        </form>
            </section>
        



        <footer class="container mb-3">
            <a class="w-100 btn btn-warning btn-lg mt-2" href="gestionAlumnos.jsp">Volver a Gestión Alumnos</a>
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
