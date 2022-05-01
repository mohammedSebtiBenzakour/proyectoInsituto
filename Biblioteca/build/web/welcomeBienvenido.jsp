<%-- 
    Document   : welcomeBienvenido
    Created on : 18-ene-2022, 17:23:19
    Author     : daw2
--%>
<%@page import="controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<% Usuario user = (Usuario) session.getAttribute("u");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/welcome.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <title>Biblioteca</title>
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
    <body onload='${empty param.mensaje?"":"mostrarMensaje()"}' class="container welcome">
    <center>
        <header class="container pt-2 ">
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Menu</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                                <li class="nav-item">
                                    <a class="nav-link" href="calendario.html">Calendario</a>
                                </li>
                            </ul>
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <div class="container">
            <button class="btn btn-primary mt-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">Datos del usuario conectado</button>

            <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasBottomLabel">Datos del usuario conectado</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body small">
                    <h3 class="blanco" >bienvenido, <%= user.getNombre()%></h3>
                    <h5 class="blanco">Tu numero ID: <%= user.getId()%> </h5>
                    <h5 class="blanco">Tu Email: <%= user.getEmail()%> </h5>
                    <h5 class="blanco">Tu Password: <%= user.getPassword()%></h5>
                </div>
            </div>
        </div>
        <section class="container mt-3">
            <div class="row">
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="img/lib.jfif" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Gestionar la biblioteca</h5>
                            <p class="card-text">Pulsa en el boton para acceder a la biblioteca.</p>
                            <a href="editarLibroIndex.jsp" class="btn btn-primary">Ir a biblioteca</a>
                        </div>
                    </div>
                </div>
                <!--div class="col">
                    <h1 class="blanco">bienvenido!  </h1>
                    <h1 class="blanco" >bienvenido, <%= user.getNombre()%></h1>
                    <h3 class="blanco">Tu numero ID: <%= user.getId()%> </h3>
                    <h3 class="blanco">Tu Email: <%= user.getEmail()%> </h3>
                    <h3 class="blanco">Tu Password: <%= user.getPassword()%></h3>
                    <h3 class="blanco">Gestionar la libreria: <a href="editarLibroIndex.jsp">Gestionar la libreria</a></h3>
                    <button><a href="Desconectar">Log Out</a></button>
                </div-->
            </div>
        </section>
        <div class="container pt-5">
            <div class="row">
                <div class="col">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Salir de la Biblioteca
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Si deseas salir pulsa en salir
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <a href="Desconectar" class="btn btn-primary">Salir</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </center>
</body>
</html>
