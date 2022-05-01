<%-- 
    Document   : login
    Created on : 19-mar-2022, 17:39:00
    Author     : daw2
--%>

<%@page contentType="text/html" pageEncoding="latin1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Gestion Instituto</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header class="container ">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="login.jsp">Menu General</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                        <fmt:timeZone  value="Europe/Madrid" >
                            <fmt:formatDate type="both" dateStyle="full"  value="${now}"/>
                        </fmt:timeZone>
                    </div>
                </div>
            </nav>
        </header>
        <section class="container w-50">

            <div class="form-body">
                <div class="row">
                    <div class="form-holder">
                        <div class="form-content">
                            <div class="form-items">

                                <h3>  Iniciar Session</h3>
                                <p>Porfavor completar todos los campos.</p>
                                <form class="requires-validation" novalidate method="post" action="Login">

                                    <div class="col-md-12">
                                        <input class="form-control" type="text" name="dni" placeholder="DNI" value="1" required autocomplete="off">
                                        <div class="valid-feedback">El Usuario es valido!</div>
                                        <div class="invalid-feedback">El Usuario no puede estar vacio!</div>
                                    </div>

                                    <div class="col-md-12">
                                        <input class="form-control" type="password" name="clave" value="a" placeholder="Contraseña" required>
                                        <div class="valid-feedback">Password field is valid!</div>
                                        <div class="invalid-feedback">Password field cannot be blank!</div>
                                    </div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" checked="" id="invalidCheck" required>
                                        <label class="form-check-label">I confirm that all data are correct</label>
                                        <div class="invalid-feedback">Porfavor confirmar que los datos introducidos son los correctos!</div>
                                    </div>


                                    <div class="form-button mt-3">
                                        <button id="submit" type="submit" class="btn btn-primary">Aceptar</button>
                                    </div>
                                </form>
                                <p class="copyright mt-3 d-flex justify-content-end">Mohammed S B  &copy; 2022</p>
                                <h5 class="errores">
                                    ${error}
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="js/login.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>
