<%-- 
    Document   : modificarMatricula
    Created on : 02-abr-2022, 20:21:08
    Author     : daw2
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
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
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
                        <jsp:param name="t?tulo" value="Pagina Principal"/>
                    </jsp:include>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                    <a href="../CerrarSesion" class="pe-5">Cerrar Sesi?n</a>
                    <fmt:timeZone  value="Europe/Madrid" >
                        <fmt:formatDate type="both" dateStyle="full"  value="${now}"/>
                    </fmt:timeZone>
                </div>
            </div>
        </nav>
        <section class="container">
            <div class="form-body">
                <div class="row">
                    <div class="form-holder">
                        <div class="form-content">
                            <div class="form-items">
                                <h3>Modificar una Matricula</h3>

                                <form class="requires-validation" novalidate action="ModificarMatricula" method="post">

                                    <div class="col-md-12">
                                        <input class="form-control" type="number" name="id" placeholder="Id Matricula" value="${id}" required>
                                        <div class="valid-feedback">Id Matricula field is valid!</div>
                                        <div class="invalid-feedback">Id Matricula field cannot be blank!</div>
                                    </div>


                                    <div class="col-md-12">
                                        <input class="form-control" type="text" name="nombre_matricula" placeholder="Nombre Matricula" value="${nombre_matricula}" required>
                                        <div class="valid-feedback">Nombre Matricula field is valid!</div>
                                        <div class="invalid-feedback">Nombre Matricula field cannot be blank!</div>
                                    </div>

                                    <div class="col-md-12">
                                        <input class="form-control" type="text" name="descripcion" value="${descripcion}" placeholder="Descripci?n Matricula" required>
                                        <div class="valid-feedback">Descripci?n Matricula field is valid!</div>
                                        <div class="invalid-feedback">Descripci?n Matricula field cannot be blank!</div>
                                    </div>

                                    <div class="col-md-12">
                                        <select class="form-select mt-3" required name="dni_alumno">
                                            <option   value="">Seleccionar Alumno</option>
                                            <c:forEach var="al" items="${listaAlumnos}">
                                                <option value="${al.dni_alumno}" ${al.dni_alumno == dni_alumno ? 'selected="selected"' : ''}>${al.nombre_alumno} ${al.primer_apellido_alumno} ${al.segundo_apellido_alumno}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="valid-feedback">You selected a position!</div>
                                        <div class="invalid-feedback">Please select a position!</div>
                                    </div>

                                    <div class="col-md-12">
                                        <select class="form-select mt-3" required name="materia">
                                            <option   value="">Seleccionar Materia</option>
                                            <c:forEach var="mat" items="${listaMaterias}">
                                                <option value="${mat.materia}" ${mat.materia == materia ? 'selected="selected"' : ''}>${mat.materia}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="valid-feedback">You selected a position!</div>
                                        <div class="invalid-feedback">Please select a position!</div>
                                    </div>


                                    <div class="form-button mt-3">
                                        <button id="submit" type="submit" class="btn btn-primary" name="modificarMatricula">Modificar Materia</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="../js/login.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>


