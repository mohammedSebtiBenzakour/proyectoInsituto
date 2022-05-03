<%-- 
    Document   : mostrarMatriculas
    Created on : 02-abr-2022, 20:01:55
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
        <h1 class="d-flex justify-content-center">Mostrar Matriculas</h1>
        <section class="container ">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Matricula</th>
                        <th scope="col">Descripci�n Matricula</th>
                        <th scope="col">Materia</th>
                        <th scope="col">Nombre Alumno</th>
                        <th scope="col">Fecha creaci�n</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaMatriculas}" var="matricula">
                        <tr>
                            <td><c:out value="${matricula.nombre_matricula}"/></td>
                            <td><c:out value="${matricula.descripcion}"/></td>
                            <td><c:out value="${matricula.nombre_materia.materia}"/></td>
                            <td><c:out value="${matricula.alumno.nombre_alumno} ${matricula.alumno.primer_apellido_alumno} ${matricula.alumno.segundo_apellido_alumno}"/></td>
                            <td><c:out value="${matricula.creado_el}"/></td>
                            <td>
                                <a class="btn btn-danger" href="EliminarMatricula?id=${matricula.id}">Eliminar</a>
                            </td>
                            <td>
                                <a class="btn btn-warning" href="ModificarMatricula?id=${matricula.id}&nombre_matricula=${matricula.nombre_matricula}&descripcion=${matricula.descripcion}&dni_alumno=${matricula.alumno.dni_alumno}&materia=${matricula.nombre_materia.materia}">Modificar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>  

        <footer class="container mb-3">
            <a class="w-100 btn btn-warning btn-lg mt-2" href="gestionMatriculas.jsp">Volver</a>
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