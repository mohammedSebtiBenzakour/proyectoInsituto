<%-- 
    Document   : graficaNotas
    Created on : 13-abr-2022, 20:29:38
    Author     : daw2

Fichero para mostrar las notas en una grafica
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="latin1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=latin1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Short+Stack&display=swap" rel="stylesheet">
        <link href="../css/inicio.css" rel="stylesheet" type="text/css"/>
        <title>Gestion Instituto</title>
        <script>
            etiquetas = [
            <c:forEach items="${listaNotas}" var="notas" varStatus="status">
            '<c:out value="${notas.alumno.nombre_alumno} "/>'
                <c:if test="${!status.last}">
            ,
                </c:if>
            </c:forEach>
            ];
            valores = [
            <c:forEach items="${listaNotas}" var="notas" varStatus="status">
                <c:out value="${notas.nota}"/>
                <c:if test="${!status.last}">
            ,
                </c:if>
            </c:forEach>

            ];
        </script>
    </head>
    <body class="fondo">
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/highcharts-3d.js"></script>
        <script src="https://code.highcharts.com/modules/cylinder.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>
        
        <header>
            <jsp:include page="encabezadoAdmin.jsp" >
                <jsp:param name="título" value="Gestion Lecturas"/>
            </jsp:include>
        </header>
        <div class="container">
            <fmt:timeZone  value="Europe/Madrid">
                FECHA DE HOY: <fmt:formatDate type="both" dateStyle="full"  value="${now}"/><br>
            </fmt:timeZone>
        </div>
        <section class="container">
            <div class="row">
                <div class="col">
                    
                </div>
            </div>
        </section>
        <section class="container">
            <div class="row">
                <div class="col">
                    <figure class="highcharts-figure">
                        <div id="container"></div>
                        <p class="highcharts-description text-center">
                            Grafica de todas las notas .
                        </p>
                    </figure>
                </div>
            </div>
        </section>
        <footer class="container d-flex justify-content-center align-items-center mb-4 shadow rounded text-uppercase btn btn-warning">
            <h2><a href="gestionEvaluaciones.jsp">Volver</a></h2>
        </footer>
        <script src="../js/graficaNotas.js" type="text/javascript"></script>
    </body>
</html>
