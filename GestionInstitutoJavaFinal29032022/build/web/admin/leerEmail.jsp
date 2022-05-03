<%-- 
    Document   : leerEmail
    Created on : 23-abr-2022, 23:04:06
    Author     : daw2
--%>
<%@page import="central.LeerEmail"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Folder"%>
<%@page import="javax.mail.Store"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page contentType="text/html" pageEncoding="latin1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Gestion Instituto</title>
        <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilosNotas.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <div class="ps-5">
                    <a class="navbar-brand" href="login.jsp">Menu General</a>
                </div>

                <div class="ps-5">
                    <jsp:include page="../admin/encabezadoAdmin.jsp" >
                        <jsp:param name="título" value="Pagina Principal"/>
                    </jsp:include>
                </div>
                <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                    <a href="../CerrarSesion" class="pe-5">Cerrar Sesión</a>
                    <fmt:timeZone  value="Europe/Madrid" >
                        <fmt:formatDate type="both" dateStyle="full"  value="${now}"/>
                    </fmt:timeZone>
                </div>
            </div>
        </nav>
        <h1 class="d-flex justify-content-center">Leer el Correo </h1>
        <section class="container">

            <%
                Message[] mensajes = null;
                LeerEmail le = new LeerEmail();
                String res = null;
                Properties props = System.getProperties();
                props.setProperty("mail.store.protocol", "imaps");
                try {
                    Session sesion = Session.getDefaultInstance(props, null);
                    Store store = sesion.getStore("imaps");
                    store.connect("outlook.office365.com", "filip.morris.camas@outlook.es", "Msb.93345900");
                    Folder[] folders = store.getDefaultFolder().list("*");
                    for (Folder folder : folders) {
                        if (folder.getType() == 3) {
                            System.out.println(folder.getFullName() + ": " + folder.getMessageCount());

                            folder = store.getFolder(folder.getFullName());
                            folder.open(Folder.READ_ONLY);

                            mensajes = folder.getMessages();

            %>
            <div class="row">
                <%                                    for (int i = 0; i < mensajes.length; i++) {
                %>

                <div class="col col-12">
                    <div class="card m-2">
                        <div class="card-header">
                            "DE    : " + <%= mensajes[i].getFrom()[0].toString()%>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">"ASUNTO: " + <%= mensajes[i].getSubject()%></h5>
                            <p class="card-text"><%= le.getTextFromMessage(mensajes[i])%></p>
                            <a href="#" class="btn btn-primary">Responder</a>
                        </div>
                    </div>
                </div>

                <%
                                    //                        System.out.println("DE    : " + mensajes[i].getFrom()[0].toString());
                                    //                        System.out.println("ASUNTO: " + mensajes[i].getSubject());
                                }
                            }
                        }
                        store.close();
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }

                %>
            </div>
        </section>
        <footer class="container mb-5 d-flex justify-content-center align-items-center btn btn-warning shadow rounded text-uppercase botonInicio">
            <h2><a href="../inicio.jsp" class="botonInicio">Volver</a></h2>
        </footer>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="" type="text/javascript"></script>
        <script src="" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </body>
</html>
