<%-- 
    Document   : editarLibro
    Created on : 31-dic-2021, 10:44:09
    Author     : daw2

Fichero con formulario para editar un libro
--%>
<%@page import="java.util.List"%>
<%@page import="controladorEditarLibro.Categoria"%>
<%@page import="controladorEditarLibro.Libros"%>
<%@page import="controlador.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="controladorEditarLibro.LibrosDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.css"/>
        <link href="css/nuevosEstilos.css" rel="stylesheet" type="text/css"/>
        <title>Editar libros</title>
    </head>

    <body>
        <div class="container">
            <div  class="container mt-2 bg-light">
                <nav class="navbar navbar-light">
                    <a class="navbar-brand">Bibilioteca</a>
                    <h3>Editar libros</h3>
                    <ul class="navbar-nav ml-auto mt-3 mx-5">
                        <li class="nav-item">
                            <a class="nav-link active" href="editarLibroIndex.jsp">Home</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="inner">
                <div class=" container w-50">
                    <div class="row ">
                        <div class="col-12">
                            <form action="ServletEditarLibro" method="post">
                                <div class="form-group m-2">
                                    <label>ID libro</label>
                                    <input class="form-control" name="id" value="${id}" required>
                                </div>
                                <div class="form-group m-2">
                                    <label>Nombre libro</label>
                                    <input class="form-control" name="nombre_libro" value="${nombreLibro}" required>
                                </div>
                                <div class="form-group m-2">
                                    <label>Descripción del libro</label>
                                    <input class="form-control" name="descripcion_libro" value="${descripcionLibro}" required>
                                </div>
                                <div class="form-group m-2">
                                    <label>Autor del libro</label>
                                    <input class="form-control" name="autor_libro" value="${autorLibro}" required>
                                </div>
                                <div class="form-group m-2" >
                                    <label>Categoria del libro</label>
                                    <select id="inputState" class="form-control" name="categoria_libro" >
                                        <option   value="">Seleccionar Categoria</option>
                                        <c:forEach var="cat" items="${listaCategorias}">
                                            <option value="${cat.categoriaLibro}" ${cat.categoriaLibro == categoriaLibro ? 'selected="selected"' : ''} >${cat.categoriaLibro}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" name="modificarCategoria" value="aallss" class="btn btn-success ms-2 mt-2">Modificar los datos</button>
                                <a class="btn btn-primary ms-2 mt-2" href="editarLibroIndex.jsp">Cancel</a>
                                <a href="welcomeBienvenido.jsp" class="btn btn-outline-success mt-2 ms-2">Volver</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.js"></script>
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        </div>
    </body>
</html>

