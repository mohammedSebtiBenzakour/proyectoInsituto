<%-- 
    Document   : enviarEmail
    Created on : 23-abr-2022, 17:28:51
    Author     : daw2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="latin1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <title>Enviar email</title>
        <style type="text/css">
            body{
                font-family: 'Permanent Marker', cursive;
                background: rgb(2,0,36);
                background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(100,119,31,1) 6%, rgba(0,212,255,1) 100%);

            }
            label{
                background-color: orange;
                border-radius: 25px;
                padding: 10px;
                margin: 2px;
                box-shadow: inset -1px 3px 8px 5px #1F87FF, 2px 5px 16px 0px #0B325E, 5px 5px 0px 5px rgba(113,74,125,0);
            }
            button{
                box-shadow: 5px 5px 5px 0px #000000, inset 4px 4px 15px 0px #000000, 5px 5px 0px 5px rgba(113,74,125,0);

            }
            h1{
                box-shadow: -10px 0px 13px -7px #000000, 10px 0px 13px -7px #000000, 5px 5px 0px 5px rgba(113,74,125,0);

            }

        </style>
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
    <body onload='${empty param.mensaje?"":"mostrarMensaje()"}' class="container">
        <div class="container">
            <h1 class="mt-4 d-flex justify-content-center align-content-center">Enviar email</h1>
            <form name="form1" enctype="multipart/form-data" method="post" action="EnviarEmailGeneral" id="application-form" class="form">

                <div class="row clearfix d-flex justify-content-center">
                    <div class="col-md-8 col-sm-12 col-xs-12 mt-3">
                        <div class="form-group">
                            <label class="form-label">Destinatario</label>
                            <input type="text" value="" placeholder="Introducir email Destinatario"  name="para" required class="form-control shadow p-3 mt-3 bg-body rounded">
                        </div>
                        <div class="form-group mt-3">
                            <label class="form-label">Asunto</label>
                            <input type="text" value="" placeholder="Introducir el Asunto" name="asunto" required class="form-control shadow p-3 mt-3 bg-body rounded">
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12 mt-3">
                        <div class="form-group">
                            <label class="form-label ">Mensaje</label>
                            <textarea name="mensaje_email" placeholder="Escribe aquí vuestro mensaje" class="form-control shadow p-3 mt-3 bg-body rounded" required></textarea>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12 mt-3 file-upload-wrapper">
                        <input type="file" id="exampleInputFile" name="file" class="form-control shadow p-3 mt-3 bg-body rounded file-upload " data-height="500"  data-default-file="" accept="image/*, .pdf" required>
                    </div>
                </div>

                <div class="form-group mt-4 mb-4 d-flex justify-content-center">
                    <a href="../inicio.jsp"   class="theme-btn dark-btn hvr-bounce-to-right btn btn-warning me-5 " name="volver">
                        <span class="fa fa-arrow-left"></span> Volver </a>
                    <button type="submit"  class="theme-btn dark-btn hvr-bounce-to-right btn btn-primary " name="enviar">
                        <span class="fa fa-envelope"></span> Enviar email </button>
                    <button type="reset"  class="theme-btn dark-btn hvr-bounce-to-right btn btn-danger ms-5 " name="reset">
                        <span class="fa fa-undo"></span> Limpiar </button>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

        <script type="text/javascript">

        </script>
    </body>
</html>
