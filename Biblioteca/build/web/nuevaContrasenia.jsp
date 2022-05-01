<%-- 
    Document   : newjspnuevaContrasenia
    Created on : 13-abr-2022, 15:45:52
    Author     : daw2
--%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Snippet - BBBootstrap</title>
        <link href="css/estiloForgotPassword.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/estiloNuevoFormularioReg.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <link href="css/estiloNuevoFormularioReg.css" rel="stylesheet" type="text/css"/>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>

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
        <div class="container d-flex justify-content-center align-items-center mt-3 ">
            <div class="row justify-content-center">
                <div class="col">
                    <!-- White Container -->
                    <div class="container bg-white rounded ">
                        <!-- Main Heading -->
                        <div class="row justify-content-center align-items-center pt-3">
                            <h1 class="row justify-content-center align-items-center"><strong>Restaurar Contraseña</strong></h1>
                        </div>
                        <div class="pt-3 pb-3">
                            <form class="form-horizontal" action="NuevaContrasenia" method="POST">
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="text" name="password" placeholder="&#xf084; &nbsp; New Password" class="form-control border-info placeicon" required="">
                                    </div>
                                </div>
                                <div class="form-group row justify-content-center px-3 mt-2">
                                    <div class="col-9 px-0">
                                        <input type="password" name="confPassword" required="" placeholder="&#xf084; &nbsp; Confirm New Password" class="form-control border-info placeicon">
                                    </div>
                                </div>
                                <div class="form-group row justify-content-center">
                                    <div class="col-5  mt-3">
                                        <input type="submit" value="Restaurar contraseña" class="btn btn-block btn-info">
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="mx-0 px-0 bg-light">
                            <div class="pt-2">
                                <div class="row justify-content-center">
                                    <h5>Si no estas registrado pulsa aquí? <span><a href="registrarse.jsp" class="text-danger"> Registrarse Ahora!</a></span></h5>
                                </div>
                                <div class="row justify-content-center align-items-center pt-4 pb-5">
                                    <a class="btn btn-outline-success mt-2" href="index.jsp">Volver</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
