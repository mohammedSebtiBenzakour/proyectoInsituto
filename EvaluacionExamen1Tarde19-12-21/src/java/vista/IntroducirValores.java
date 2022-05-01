/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import controlador.Dato;
import controlador.Datos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daw44
 */
@WebServlet(name = "IntroducirValores", urlPatterns = {"/IntroducirValores"})
public class IntroducirValores extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           request.setCharacterEncoding("UTF-8");

        HttpSession sesion = request.getSession();

        String etiqueta = request.getParameter("etiqueta");
        String valor = request.getParameter("valor");

        Dato dato = null;
        Datos datos = null;
        Double valorD = 0.0;

        datos = (Datos) sesion.getAttribute("datos");

        if (datos == null) {
            datos = new Datos();
        }

        boolean hayParametros = false;

        if (etiqueta != null && valor != null) {
            hayParametros = true;
            sesion.setAttribute("datos", datos);
        }

        if (hayParametros) {

            valorD = Double.parseDouble(valor);
            dato = new Dato(etiqueta, valorD);
            datos.add(dato);

        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println(" <link rel='stylesheet' href='css/estilo.css'>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/estil.css\"> ");
            out.println(" <script src=\"grafica.js\"></script>");
            out.println("<title>Servlet IntroducirValores</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<center>");
            out.println("<h1>Intorducir valores</h1>");
            out.println("<form>");
            out.println("<label> Etiqueta </label>");
            out.println("<input type='text' name='etiqueta' required>");
            out.println("<br>");
            out.println("<br>");
            out.println("<label> Valor </label>");
            out.println("<input type='number' name='valor' step=0.1 required>");
            out.println("<br>");
            out.println("<br>");
            out.println("<input type='submit' name='añadir' value ='Añadir' class='cerrar' />");
            out.println("<br>");
            out.println("<br>");
            out.println("</form>");
            out.println("<form action='MostrarGrafica'>");
            out.println("<input type='submit' name='terminar' value ='Terminar' class='introducir' />");
            out.println("</form>");
            out.println("<table class='matriz'>");
            out.println("<tr>");
            if (hayParametros) {

                for (int i = 0; i < datos.size(); i++) {
                    out.println("<td><h4>{" + datos.get(i).getEtiqueta() + " " + datos.get(i).getValor() + "}</h4></td>");
                }

            }
            out.println("</tr>");
            out.println("</table>");
            out.println("<h4><a href='index.html' class='volver'>Volver</a></h4>");
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
