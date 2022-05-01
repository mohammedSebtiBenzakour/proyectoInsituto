package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import controladores.ElAhorcado;
import java.util.Random;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


    ElAhorcado elA = new ElAhorcado();

    boolean juegoTerminado = false;
    String letra = request.getParameter("letra");
    Character let = null;
    String error = "";
    String ganado = "";
    boolean hayParametros = false;
    boolean juegoGanado = false;
    boolean algunaLetraAcertada = false;
    int intentos = 3;

    char[] palabraGuiones = null;
    String palabraSecreta = "";
    
    char[] pg = null;
    String ps = "";
    if (letra != null) {
        hayParametros = true;
        let = letra.charAt(0);
    }

    if (hayParametros) {
        palabraSecreta = ElAhorcado.getPalabraSecreta();
        palabraGuiones = ElAhorcado.getGuionesFromPalabra(palabraSecreta);

        if (palabraSecreta != null) {
            session.setAttribute("palabraSecreta", palabraSecreta);
            session.setAttribute("palabraGuiones", palabraGuiones);
        }else{
            
        ps = (String) session.getAttribute("palabraSecreta");
        pg = (char[]) session.getAttribute("palabraGuiones");

        for (int i = 0; i < ps.length(); i++) {
            if (ps.charAt(i) == let) {
                algunaLetraAcertada = true;
            }
        }
        if (!algunaLetraAcertada) {
            out.print("no has acertado ninguna letra");
            --intentos;
            if (intentos == 0) {
                out.print("has perdido porque agostaste todos los intetos");
                juegoTerminado = true;
            }
        } else {
            juegoGanado = !ElAhorcado.hayGUiones(pg);
            if (juegoGanado) {
                out.println("has ganado el juego");
                juegoTerminado = true;
            }
        }
    }
 }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>EL AHORCADO</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <center>\n");
      out.write("        <h1>EL AHORCADO!</h1>\n");
      out.write("        <h2>");
      out.print( palabraSecreta);
      out.write("</h2>\n");
      out.write("        <h2>");
      out.print( palabraGuiones);
      out.write("</h2>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <h2>");
      out.print( let);
      out.write("</h2>\n");
      out.write("        <h2>");
      out.print( "");
      out.write("</h2>\n");
      out.write("\n");
      out.write("        <form action=\"\">\n");
      out.write("            <p> <input type=\"text\" name=\"letra\" placeholder=\"insertar letra\"></p>\n");
      out.write("            <p> <input type=\"submit\" name=\"submit\" value=\"submit\"></p>\n");
      out.write("        </form>\n");
      out.write("    </center>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
