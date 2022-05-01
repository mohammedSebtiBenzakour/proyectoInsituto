<%-- 
    Document   : encabezadoAdmin
    Created on : 20-mar-2022, 10:21:25
    Author     : daw2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty usuario}">
    <jsp:forward page="../login.jsp"/>
</c:if>
<div class="encabezado"> 
    <center>
       <c:out value="El usuario es : ${usuario.nombre} ${usuario.apellidos}"/>
    </center>
</div>
