<%-- 
    Document   : mostrarTodasLasNotas
    Created on : 27-mar-2022, 13:45:19
    Author     : daw2

Fichero para mostrar el listado de todas las notas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="latin1"%>
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
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Gestion Instituto</title>
        <script>

            function mostrarMensaje() {
              //  alert("${param.mensaje}");
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
        <h1 class="d-flex justify-content-center">Mostrar todas las Notas de todos los Alumnos</h1>
       <section class="container ">
            <a class="d-flex justify-content-center btn btn-primary mb-3" href="Pdf">Generar PDF de todas las Notas de todos los Alumnos</a>
        </section>
        <section class="container ">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Dni</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Nota</th>
                        <th scope="col">Observacion</th>
                        <th scope="col">Email Alumno</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>
                        <th scope="col">Operación</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaEvaluaciones}" var="eval">
                        <tr>
                            <td><c:out value="${eval.alumno.dni_alumno}"/></td>
                            <td><c:out value="${eval.alumno.nombre_alumno}"/></td>
                            <td><c:out value="${eval.alumno.primer_apellido_alumno} ${eval.alumno.segundo_apellido_alumno}"/></td>
                            <td><c:out value="${eval.nota}"/></td>
                            <td><c:out value="${eval.observacion}"/></td>
                            <td><c:out value="${eval.alumno.email_alumno}"/></td>
                            <td>
                                <a class="btn btn-danger" href="EliminarNotaAlumno?id=${eval.id}">Eliminar</a>
                            </td>
                            <td>
                                <a class="btn btn-warning" href="ModificarNotaAlumno?id=${eval.id}&dni_alumno=${eval.alumno.dni_alumno}&nota=${eval.nota}&observacion=${eval.observacion}">Modificar</a>
                            </td>
                            <td>
                                <a class="btn btn-primary" href="enviarEmailAlumnoNota.jsp?dni=${eval.alumno.dni_alumno}">Enviar Email</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>    
        <footer class="container mt-3 mb-3 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">
            <h4><a href="../inicio.jsp" class="botonInicio">Volver</a></h4>
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
