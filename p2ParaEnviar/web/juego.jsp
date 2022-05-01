<%-- 
    Document   : juego
    Created on : 08-dic-2021, 15:03:47
    Author     : daw2
Estas navidades queremos felicitar a nuestros amigos de forma original, y para ello
desarrollaremos un juego sencillo con tecnología JSP: Descubrir parejas navideñas. 

Pagina juego.jsp

/**
 *
 * @author daw2
 * @author Mohammed Sebti Benzakour
 * @since v1.0
 * 
 */
/**
 * @version v1.12-12-2021
 */
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.List"%>
<%@page import="controlador.ElJuego"%>
<%@page import="controlador.Carta"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%
    /**
     * He utilizado la clase LocalDateTime para acostumbrarme y acordandome de
     * ella asi de como se utiliza en el futuro puedes visitar para mas
     * informacion la siguiente documentación
     *
     * @see
     * <a href="https://docs.oracle.com/javase/8/docs/api/java/time/LocalDateTime.html">LocalDateTime</a>
     *
     */

    LocalDateTime fechaYHora = LocalDateTime.now();
    DateTimeFormatter formatoFechaYHora
            = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM).withLocale(request.getLocale());

    Date fYh = new Date();
    DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.MEDIUM, request.getLocale());

    String strFechaYHora = df.format(fYh);

    /**
     * Se crea un objeto de la clase El Juego Y lo obtengo de la sesión
     */
    ElJuego juego = (ElJuego) session.getAttribute("juego");

    /**
     * Compruebo que el objeto juego no esta o que no se ha pulsado en el boton
     * reiniciar asi le doy un valor y lo guardo en la sesión
     */
    if (juego == null || request.getParameter("reiniciar") != null) {
        juego = new ElJuego();
        session.setAttribute("juego", juego);
    }
    /**
     * Creo una lista de cartas para utilizarla o tratarla
     */

    List<Carta> cartas = juego.getCartas();

    /**
     * Creo una lista de cartasAcertadas para utilizarla almacenando en ella las
     * cartas acertadas y tendra un tamaño de 8 cartas
     */
    List<String> cartasAcertadas = juego.getCartasAcertadas();

    /**
     * Obtengo el usuario que ha iniciado el juego de la sesión para conservarlo
     * hasta que decida terminar o abandonar
     */
    String usuario = (String) session.getAttribute("usuario");
    usuario = usuario.toUpperCase();

    /**
     * Obtengo del input hidden victimaI el indice o la posición de la carta en
     * ese momento enviado al pulsar la carta
     */
    String victimaI = request.getParameter("victimaI");

    int pos = 0;

    String disable = "";

    /**
     * Controlo que las cartas que no son identicas se vuelvan a esconder o
     * darse la vuelta
     */
    if (juego.isMostrandoPareja()) {

        cartas.get(juego.getCartaPulsadaAntes()).setBocaAbajo(true);

        cartas.get(juego.getCartaPulsada()).setBocaAbajo(true);

        juego.setMostrandoPareja(false);

        juego.setCartaPulsada(-1);
        juego.setCartaPulsadaAntes(-1);

    }

    /**
     * Compruebo que se ha iniciado el juego pulsando en algúna carta recibiendo
     * cualquier dato de los input hidden o no
     */
    if (victimaI != null) {
        /**
         * Convierto el indice o la posición enviada a número entero ya que el
         * formulario lo envia en forma de texto
         */

        pos = Integer.parseInt(victimaI);

        /**
         * Guardo los indices de las dos cartas pulsadas para hacer las
         * comprobaciones y las comparaciones
         */
        juego.setCartaPulsadaAntes(juego.getCartaPulsada());
        juego.setCartaPulsada(pos);

        /**
         * Verifico que despues de haber pulsado las dos cartas que son iguales
         * o no
         */
        if (juego.getCartaPulsada() != -1 && juego.getCartaPulsadaAntes() != -1) {

            /**
             * Pulso sobre las dos cartas para que se den la vuelta una vez
             * pulsada la segunda carta
             */
            cartas.get(juego.getCartaPulsada()).setBocaAbajo(false);
            cartas.get(juego.getCartaPulsadaAntes()).setBocaAbajo(false);

            /**
             * Voy contando las veces que se han pulsado las dos cartas juntas
             */
            juego.setContador(juego.getContador() + 1);

            /**
             * Comparo ahora si las cartas una vez al descubierto si son iguales
             * si es asi las mantengo asi fijando su estado en ese momento
             */
            if (cartas.get(juego.getCartaPulsada()).getNombre().equals(cartas.get(juego.getCartaPulsadaAntes()).getNombre())) {

                cartas.get(juego.getCartaPulsada()).setBocaAbajo(false);
                cartas.get(juego.getCartaPulsadaAntes()).setBocaAbajo(false);
                cartas.get(juego.getCartaPulsada()).setAcertada(true);
                cartas.get(juego.getCartaPulsadaAntes()).setAcertada(true);

                /**
                 * Añado las cartas a esta lista de cartasAcertadas para contar
                 * los aciertos
                 */
                cartasAcertadas.add(cartas.get(juego.getCartaPulsada()).getNombre());

                /**
                 * Cambio su estado para que no se vuelva y se mantienen en su
                 * estado actual ahora
                 */
                juego.setCartaPulsada(-1);
                juego.setCartaPulsadaAntes(-1);

            } else {
                /**
                 * Mantener las cartas en un estado durante unos segundos y
                 * volver a esconderlas se puede hacer de dos maneras pero la
                 * utilizada no envia parametro al refrescar Para mas
                 * información ir a :
                 *
                 * @see <a href="https://docs.oracle.com/javaee/7/api/javax/servlet/http/HttpServletResponse.html
                 * #setHeader-java.lang.String-java.lang.String-">setHeader </a>
                 */
                // response.setIntHeader("Refresh", 2);
                response.setHeader("Refresh", "2; URL=http://localhost:8080/p2/juego.jsp");

                /**
                 * Vuelvo a esconder las cartas que no son iguales o identicas
                 */
                juego.setMostrandoPareja(true);

            }
            /**
             * Compruebo que se ha ganado una vez la lista esta llena con las 8
             * cartas y lo reevio a una pagina de felicitación
             */
            if (cartasAcertadas.size() == 8) {
                response.sendRedirect("hasGanado.jsp");
            }
        }
        /**
         * Compruebo que despues de varios intentos no se ha conseguido mostrar
         * todas las cartas identicas el número 26 es orientativo y despues lo
         * redirigo a una pagina de que ha perdido.
         */

        if (juego.getContador() == 26) {
            response.sendRedirect("hasPerdido.jsp");
        }

    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel='stylesheet' href='estilos/estilos.css'>

        <title>Juego parejas</title>
    </head>
    <body>
    <center>
        <h1>Juego parejas</h1>
        <%-- 
        
        Solo muestro el usuario recogido en la sesión asi como la fecha y la
        hora en el momento del juego
        
        --%>
        <h2>El usuario es : <%= usuario%> <br> y la fecha de hoy es :<br> <%= strFechaYHora%> </h2>
            <%-- 
            
           He creado estos dos enlaces aqui para que sean accesible y facil de
            usar 
            -El volver para volver a jugar
            _ El de la sesíon para empezar de nuevo y eliminar
            datos de la sesión
            
            --%>

        <br><a href="index.jsp">Volver</a> <br>
        <br><a href="CerrarSession">CerrarSession</a> <br>
        <br>
        <%-- 
            
        He creado una tabla para mostrar la lista de cartas bien ordenadas
            
        --%>
        <table>
            <tr>  
                <%
                    for (int i = 0; i < cartas.size(); i++) {
                        Carta c = cartas.get(i);
                        String estilo = "";
                        /**
                         * Deshabilito el pulsar sobre la pareja de cartas si
                         * son las correctas y acertadas
                         */

                        if (c.isAcertada()) {
                            disable = "disabled";
                        } else {

                            disable = "";
                        }
                        /**
                         * Marco las cartas pulsadas con un marco en color para
                         * distinguir del resto
                         */
                        if (juego.getCartaPulsada() != -1 && juego.getCartaPulsadaAntes() != -1) {
                            if (juego.getCartaPulsada() == i) {
                                estilo = "border: 3px solid green;";
                            } else {
                                if (juego.getCartaPulsadaAntes() == i) {
                                    estilo = "border: 3px solid blue;";
                                }
                            }
                        }

                %>
                <td style="<%= estilo%>">
                    <form>
                        <%-- 
           
                        Recojo tanto la imagen como su nombre mientras voy recorriendo la lista
                        de cartas
           
                        --%>
                        <input type="image" src="<%= c.getImagen()%>" name="<%= c.getNombre()%>" width="100px"  <%= disable%> >
                        <%-- 
           
                        Recojo la posición de la carta en cada momento
           
                        --%>
                        <input type="hidden" name="victimaI" value="<%= i%>">
                    </form>
                </td>
                <%
                        if (i % 4 == 3 && i != cartas.size() - 1) {
                            out.println("</tr>");
                            out.println("<tr>");
                        }

                        pos++;
                    }


                %>
            </tr>
        </table>
        <br>
        <form action="juego.jsp" method="post">
            <input type="submit" name="reiniciar" value="reiniciar" id="reiniciar">
        </form>

    </center>
</body>
</html>
