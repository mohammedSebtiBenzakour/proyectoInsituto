<%-- 
    Document   : cambiarContrasenia
    Created on : 31-dic-2021, 21:39:13
    Author     : daw2
Fichero con formulario para la posibilidad para cambiar la contraseña del usuario
--%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <link href="css/estiloForgotPassword.css" rel="stylesheet" type="text/css"/>
        <title>Web registro</title>
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
    <div class="form-body">
        <div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <h3>Cambio contraseña</h3>
                        <p>Completar todos los campos.</p>
                        <form class="requires-validation" novalidate action="ChangePassword" method="post">

                            <div class="col-md-12">
                               <input class="form-control" type="password" name="current" placeholder="Contraseña actual" required>
                               <div class="valid-feedback">Username field is valid!</div>
                               <div class="invalid-feedback">Username field cannot be blank!</div>
                            </div>

                            <div class="col-md-12 mt-2">
                                <input class="form-control" type="password" name="new" placeholder="Nueva Contraseña" required>
                                 <div class="valid-feedback">Email field is valid!</div>
                                 <div class="invalid-feedback">Email field cannot be blank!</div>
                            </div>

                           <div class="col-md-12 mt-2">
                              <input class="form-control" type="password" name="confirm" placeholder="Confirmar contraseña" required>
                               <div class="valid-feedback">Password field is valid!</div>
                               <div class="invalid-feedback">Password field cannot be blank!</div>
                           </div>


                            <div class="form-button mt-3">
                                <button id="submit" type="submit" class="btn btn-primary">Cambiar contraseña</button>
                                <a class="btn btn-outline-success " href="index.jsp">Volver</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


        </section>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>