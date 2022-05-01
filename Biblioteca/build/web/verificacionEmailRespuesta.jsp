<%-- 
    Document   : verificacionEmailRespuesta
    Created on : 01-ene-2022, 15:28:17
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
        <link href="css/welcome.css" rel="stylesheet" type="text/css"/>
        <title>verificacionEmailRespuesta</title>
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
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/user-avatar.png">
                <h2>Verificacion del Email con codigo de verificacion</h2>
                <h4>Ya hemos enviando el codigo de verificacion a tu email.</h4>
                <form action="VerificacionCodigoServlet" method="post">
                    <p>Codigo de verificacion</p>
                    <input type="text" placeholder="Codigo de verificacion" name="codigoVerificacion"  autocomplete="off">
                    <input type="submit" value="Verificar codigo">
                    <a class="text-dark rounded-pill  btn btn-warning d-flex align-items-center justify-content-center" href="index.jsp">Volver</a><br>
                    <a class="text-dark rounded-pill btn btn-warning d-flex align-items-center justify-content-center" href="cerrarSession.jsp">Cerrar session</a>
                </form>
            </div>
        </div>
        <!--        <h2><a href="registrarse.jsp">Ir a registrarse</a></h2>-->
    </center>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
