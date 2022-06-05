<%-- 
    Document   : introducirClave
    Created on : 13-abr-2022, 15:36:59
    Author     : daw2

Fichero para la introducción de la clave para la recuperación de la contraseña
--%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <link href="css/estiloForgotPassword.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
        </style>
    </head>
    <body>
        <header class="container d-flex justify-content-center pt-2">
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Olvidaste la contraseña</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ">
                                <li class="nav-item">

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">

                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#"></a></li>
                                        <li><a class="dropdown-item" href="#"></a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="#"></a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
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
        <section class="container d-flex justify-content-center align-items-center mt-3 ">
            <div class="form-gap"></div>
            <div class="row">
                <div class="col">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3>
                                    <i class="fa fa-lock fa-4x"></i>
                                </h3>
                                <h2 class="text-center">Introducir Clave</h2>
                                <%
                                    if (request.getAttribute("message") != null) {
                                        out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
                                    }

                                %>
                                <div class="panel-body">
                                    <form id="register-form" action="ValidarClave" role="form" autocomplete="off"
                                          class="form" method="post">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope color-blue"></i></span> <input
                                                    id="opt" name="otp" placeholder="Introducir Clave"
                                                    class="form-control" type="text" required="required">
                                            </div>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input name="recover-submit"
                                                   class="btn btn-lg btn-primary btn-block"
                                                   value="Restaurar contraseña" type="submit">
                                        </div>
                                        <input type="hidden" class="hide" name="token" id="token"
                                               value="">
                                    </form>
                                    <a class="btn btn-outline-success mt-2" href="index.jsp">Volver</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>                    
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
