<%-- 
    Document   : index
    Created on : 30-dic-2021, 22:59:40
    Author     : daw2
--%>



<%@page import="javax.swing.JOptionPane"%>
<%@page import="md5.UsarMd5"%>
<%@page import="controlador.Usuario"%>
<%@page import="controlador.UsarBaseDatos"%>
<%@page import="controlador.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="css/estiloInicial.css" rel="stylesheet" type="text/css"/>
        <link href="css/estiloNuevoFormularioReg.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/estiloNuevoFormularioReg.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <link href="css/estiloNuevoFormularioReg.css" rel="stylesheet" type="text/css"/>

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
        <header class="container pt-2">
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Identificarse para acceder a la biblioteca</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#"></a>
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
        <div class="container navbar-light bg-light">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="http://localhost/ProyectoPropioBootstrapGestionInstyituto010422">Home</a></li>
                    <li class="breadcrumb-item"><a href="http://localhost/ProyectoPropioBootstrapGestionInstyituto010422">Administración</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Acceder a la Biblioteca</li>
                </ol>
            </nav>
        </div>
        <%
            String usu = request.getParameter("usu");
            String pas = request.getParameter("pas");
            
            String[] usuu = null;
            String[] pass = null;

            try {
                usuu = usu.split("-");
                pass = pas.split("-");
                usu = usuu[1];
                pas = pass[0];
            } catch (Exception e) {
            }

            // System.out.println("la usu es " + usu);
            // System.out.println("la pas es " + pas);
            Connection con = Conexion.conectarBD();
            String elEmail = null;
            String laClave = null;
            UsarBaseDatos ubd = new UsarBaseDatos(con);

            //   Usuario u = ubd.login(email, password);
            try {
                Usuario u = ubd.login_registrar_usuarios_con_usuario(usu, pas);

                elEmail = u.getEmail();
                laClave = u.getPassword();

            } catch (Exception e) {
            }


        %>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/user-avatar.png">
                <h1>Registrarse</h1>
                <form action="ServletLogin" method="post">
                    <p>Email usuario</p>
                    <input type="text" placeholder="email" name="email" required autocomplete="off" value="<%= elEmail%>">
                    <p> Password</p>
                    <input type="password" placeholder="Password" name="password" required autocomplete="off" value="<%= laClave%>">
                    <input type="submit" value="Login">
                    <div class="span"><a href="olvidasteContrasenia.jsp">Olvidaste la contraseña?</a></div>
                    <div class="span"><a  href="registrarse.jsp">Registrarse aquí</a></div>
                    <div class="span"><a  href="cambiarContrasenia.jsp">Cambiar Contraseña</a></div>
                    <div class="span"><a href="verificacionEmail.jsp">Verificacion del Email</a></div>
                    <div class="span"><a href="cerrarSession.jsp">Cerrar session</a></div>
                    <div class="span"><a href="index.jsp">Volver</a></div>
                </form>
            </div>
        </div>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </center>
</body>
</html>
