<%-- 
    Document   : mostrarAlumnos
    Created on : 20-mar-2022, 10:42:55
    Author     : daw2

Fichero para mostrar el listado de alumnos
--%>

<%@page import="entidades.Registrar_alumnos"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Nivel_instituto"%>
<%@page import="dao.Nivel_institutoJpaController"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
        <h1 class="d-flex justify-content-center">Mostrar Alumnos</h1>
        <section class="container ">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Perfil</th>
                        <th scope="col">Dni</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Nivel</th>
                        <th scope="col">Eliminar</th>
                        <th scope="col">Modificar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaAlumnos}" var="alumno">
                        <tr>
                            <td scope="row"><img style="width: 50px;" src="../imagenes/${alumno.imagen_alumno}"/></td>
                            <td><c:out value="${alumno.dni_alumno}"/></td>
                            <td><c:out value="${alumno.nombre_alumno}"/></td>
                            <td><c:out value="${alumno.primer_apellido_alumno} ${alumno.segundo_apellido_alumno}"/></td>
                            <td><c:out value="${alumno.email_alumno}"/></td>
                            <td><c:out value="${alumno.telefono_alumno}"/></td>
                            <td>
                                <select class="form-select"  name="">
                                    <c:forEach items="${niveles}" var="nivel">
                                        <option value="<c:out value='${nivel.id}'/>" ${alumno.nivel_alumno.nombre_nivel == nivel.nombre_nivel ? 'selected' : ''}><c:out value="${nivel.nombre_nivel}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <a class="btn btn-danger" href="">Eliminar</a>
                            </td>
                            <td>
                                <a class="btn btn-warning" href="">Modificar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>            


        <footer class="container mb-3">
            <a class="w-100 btn btn-warning btn-lg mt-2" href="gestionAlumnos.jsp">Volver</a>
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
