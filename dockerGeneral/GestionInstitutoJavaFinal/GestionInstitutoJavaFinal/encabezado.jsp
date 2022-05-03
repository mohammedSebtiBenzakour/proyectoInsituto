<%-- 
    Document   : encabezado
    Created on : 19-mar-2022, 21:47:35
    Author     : daw2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty usuario}">
    Usuario no conectado
    <jsp:forward page="login.jsp"/>
</c:if>
<div class="encabezado"> 
    <center>
       <c:out value="El usuario es : ${usuario.nombre} ${usuario.apellidos}"/>
    </center>
</div>
