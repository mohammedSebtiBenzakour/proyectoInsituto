<%-- 
    Document   : bienvenido
    Created on : 31-dic-2021, 0:12:49
    Author     : daw2
--%>

<%@page import="controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<% Usuario user = (Usuario) session.getAttribute("u");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
    //NO FUNCIONA ESTA PAGINA
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/estiloCounterDown.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <header class="container pt-2 fixed-top">
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Link</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Dropdown
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
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
            <ul class="nav navbar-light bg-light justify-content-center w-75">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Bienvenido: </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" active><%= user.getNombre()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" active>Tu Email es:</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="false" active><%= user.getEmail()%></a>
                </li>
            </ul>
        </div>
        <section class="container mt-5">
            <div class="row">
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="img/lib.jfif" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Gestionar la biblioteca</h5>
                            <p class="card-text">Pulsa en el boton para acceder a la biblioteca.</p>
                            <a href="editarLibroIndex.jsp" class="btn btn-primary">Go somewhere</a>
                            
                        </div>
                    </div>
                </div>
                <div class="col">
                    <h1 class="blanco">bienvenido!  </h1>
                    <h1 class="blanco" >bienvenido, <%= user.getNombre()%></h1>
                    <h3 class="blanco">Tu numero ID: <%= user.getId()%> </h3>
                    <h3 class="blanco">Tu Email: <%= user.getEmail()%> </h3>
                    <h3 class="blanco">Tu Password: <%= user.getPassword()%></h3>
                    <h3 class="blanco">Gestionar la libreria: <a href="editarLibroIndex.jsp">Gestionar la libreria</a></h3>
                    <button><a href="Desconectar">Log Out</a></button>
                </div>
            </div>
        </section>



        <script src="js/bootstrap.bundle.min.js"></script>
    </center>
</body>
</html>
