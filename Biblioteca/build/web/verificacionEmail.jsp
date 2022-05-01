<%-- 
    Document   : verificacionEmail
    Created on : 01-ene-2022, 14:53:58
    Author     : daw2
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
        <link href="css/nuevosEstilos.css" rel="stylesheet" type="text/css"/>
        <title>Verificacion del Email</title>
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

        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/user-avatar.png">
                <h1>Verificacion del Email</h1>
                <form action="VerificacionEmailServlet" method="post">
                    <p>Nombre usuario</p>
                    <input type="text" placeholder="Nombre usuario" name="nombreUsuario"  autocomplete="">
                    <p> Email</p>
                    <input type="text" placeholder="email" name="emailUsuario"  autocomplete="">
                    <input type="submit" value="Verificar">
                    <a class="text-dark rounded-pill  btn btn-warning d-flex align-items-center justify-content-center" href="index.jsp">Volver</a><br>
                    <a class="text-dark rounded-pill btn btn-warning d-flex align-items-center justify-content-center" href="cerrarSession.jsp">Cerrar session</a>
                </form>
            </div>
        </div>
        <!--        <h2><a href="registrarse.jsp">Ir a registrarse</a></h2>-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
