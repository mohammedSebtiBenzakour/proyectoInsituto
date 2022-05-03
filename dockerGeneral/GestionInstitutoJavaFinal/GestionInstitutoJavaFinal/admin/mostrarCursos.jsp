<%-- 
    Document   : mostrarCursos
    Created on : 02-abr-2022, 13:32:27
    Author     : daw2
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
        <link href="../css/otrosEstilosGenerales.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Gestion Instituto</title>
        <script>

            function mostrarMensaje() {
                //   alert("${param.mensaje}");
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
        <h1 class="d-flex justify-content-center">Mostrar Cursos</h1>
        <section class="container ">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Año Curso</th>
                        <th scope="col">Descripción Curso</th>
                        <th scope="col">Fecha creación</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaCursos}" var="curso">
                        <tr>
                            <td><c:out value="${curso.curso}"/></td>
                            <td><c:out value="${curso.descripcion_curso}"/></td>
                            <td><c:out value="${curso.fecha_creacion}"/></td>
                            <td>
                                <a class="btn btn-danger" href="EliminarCurso?curso=${curso.curso}">Eliminar</a>
                            </td>
                            <td>
                                <a class="btn btn-warning" href="ModificarCurso?curso=${curso.curso}&descripcion_curso=${curso.descripcion_curso}">Modificar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>  

        <footer class="container mb-3">
            <a class="w-100 btn btn-warning btn-lg mt-2" href="gestionCursos.jsp">Volver</a>
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


