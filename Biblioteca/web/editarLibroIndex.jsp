<%-- 
    Document   : editarLibroIndex
    Created on : 31-dic-2021, 10:48:42
    Author     : daw2
--%>
<%@page import="controlador.Conexion"%>
<%@page import="java.util.LinkedList"%>
<%@page import="controladorEditarLibro.Categoria"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="controladorEditarLibro.Libros"%>
<%@page import="controladorEditarLibro.ConexionDao"%>
<%@page import="controladorEditarLibro.LibrosDao"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<%
    Connection con = Conexion.conectarBD();
    LibrosDao librosDao = new LibrosDao(con);
    List<Libros> libros = librosDao.getLibros();
    request.setAttribute("libros", libros);
%>


<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.css"/>
        <link href="css/nuevosEstilos.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="" type="text/javascript"></script>
        <title>Bibilioteca</title>

        <style>
            .inner{
                margin: 15px 0;
            }
        </style>

    </head>
    <script>

        function mostrarMensaje() {
            /* alert("${param.mensaje}");*/
            let timerInterval
            Swal.fire({
                title: '${param.mensaje}!',
                html: 'I will close in <b></b> milliseconds.',
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading()
                    const b = Swal.getHtmlContainer().querySelector('b')
                    timerInterval = setInterval(() => {
                        b.textContent = Swal.getTimerLeft()
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            }).then((result) => {
                /* Read more about handling dismissals below */
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log('I was closed by the timer')
                }
            })
        }

        function myFunction(x) {
            x.style.background = "yellow";

        }

    </script>
    <body onload='${empty param.mensaje?"":"mostrarMensaje()"}' class="container">
        <div  class="container mt-2 bg-light">
            <nav class="navbar navbar-light">
                <a class="navbar-brand">Bibilioteca</a>
                <a class="navbar-brand btn btn-warning" href="Pdf">Listado de todos los libros en PDF</a>
                <form class="d-flex gap-2 justify-content-end" action="ServletLibrosBuscar" method="post">
                    <input class="form-control w-100" type="search" placeholder="Search" aria-label="Search" name="buscar" >
                    <button class="btn btn-outline-success w-100" type="submit">Search</button>
                    <button class="btn btn-outline-success w-100" type="button"><a href="cerrarSession.jsp">Cerrar session</a></button>
                </form>
            </nav>
        </div>
        <div class="container ">
            <div class="inner">
                <div class="row">
                    <div class="col-3">
                        <h3>Introducir libros</h3>
                        <form action="ServletAniadirLibro" method="post">
                            <div class="form-group">
                                <label>Nombre libro</label>
                                <input class="form-control" name="nombreLibro" placeholder="Nombre libro" required>
                            </div>
                            <div class="form-group">
                                <label>Descripcion libro</label>
                                <input class="form-control" name="descripcionLibro" placeholder="Descripcion libro" required>
                            </div>
                            <div class="form-group">
                                <label>Autor libro</label>
                                <input class="form-control" name="autorLibro" placeholder="Autor libro" required  >
                            </div>

                            <div class="form-group" >
                                <label>Seleccionar Categoria libro</label>
                                <select name="categoriaLibro" class="form-select" required data-bs-toggle="tooltip" data-bs-html="true" title="Si no esta la categoria puedes crearla antes justo abajo..." >
                                    <option value="">Seleccionar Una categoria</option>
                                    <%
                                        List<Categoria> categorias = librosDao.getCategoriaLibros();
                                        for (Categoria cat : categorias) {
                                    %>
                                    <option value="<%=cat.getCategoriaLibro()%>"><%=cat.getCategoriaLibro()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Registrar</button>
                            <button type="reset" class="btn btn-primary mt-2">Limpiar</button>
                            <a href="welcomeBienvenido.jsp" class="btn btn-outline-success mt-2">Volver</a>
                        </form>
                        <h4 class="mt-3">Introducir Categorias</h4>
                        <form action="ServletAniadirCategoria" method="post">
                            <div class="form-group">
                                <label>Nombre Categoria</label>
                                <input class="form-control" name="categoriaLibro" placeholder="Nombre Categoria libro" required>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Registrar</button>
                            <button type="reset" class="btn btn-primary mt-2">Limpiar</button>
                            <a href="welcomeBienvenido.jsp" class="btn btn-outline-success mt-2">Volver</a>
                        </form>
                    </div>
                    <div class="col-9">
                        <h3> Listado de los libros en la biblioteca</h3>
                        <table class="table">
                            <thead class="bg-light">
                                <tr>
                                    <th scope="col">Nombre libro</th>
                                    <th scope="col">Descripcion libro</th>
                                    <th scope="col">Autor libro</th>
                                    <th scope="col">Categoria libro</th>
                                    <th scope="col">Accion(Eliminar/Modificar)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tempBook" items="${libros}">
                                    <tr>
                                        <td>${tempBook.nombreLibro }</td>
                                        <td>${tempBook.descripcionLibro }</td>
                                        <td>${tempBook.autorLibro }</td>
                                        <td>${tempBook.categoriaLibro.categoriaLibro}</td>
                                        <td><a class="btn btn-success" href="ServletEditarLibro?id=${tempBook.id}&nombre_libro=${tempBook.nombreLibro}&descripcion_libro=${tempBook.descripcionLibro}&autor_libro=${tempBook.autorLibro}&categoria_libro=${tempBook.categoriaLibro.categoriaLibro}">Modificar</a> 
                                            <a class="btn btn-danger" href="ServletEliminarLibro?id=${tempBook.id}">Eliminar</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <footer class="container mb-5 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">
            <h2><a href="welcomeBienvenido.jsp" class="botonInicio">Volver</a></h2>
        </footer>
        

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.11.5/datatables.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script type="text/javascript">
        $(document).ready(function () {
            $('table').DataTable();
        });

        </script>
    </body>
</html>
