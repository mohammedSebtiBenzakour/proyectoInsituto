/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladorVerificacionEmail;

import controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daw2
 */
@WebServlet(name = "VerificacionCodigoServlet", urlPatterns = {"/VerificacionCodigoServlet"})
public class VerificacionCodigoServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=latin1");
        request.setCharacterEncoding("latin1");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String error = null;
            String irA = null;
            String mensaje = null;
            HttpSession ses = request.getSession();
            Usuario usuario = (Usuario) ses.getAttribute("usuario");

            String codigoVerificacion = request.getParameter("codigoVerificacion");

            String sql = "SELECT email FROM usuarios where email='" + usuario.getEmail() + "'";
            Connection con = Conexion.conectarBD();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(sql);
            rs.first();
            String filas = rs.getString(1);

            if (codigoVerificacion.equals(usuario.getCodigoVerificacion()) && filas.equals(usuario.getEmail())) {
               // error = "Verificacion correcta";
                irA = "<h2> " + "<a href=\"index.jsp\">Puedes acceder a la libreria Bienvenido identificandote con tu email</a>" + "</h2>";

            } else {
                error = "Codigo de verificacion es incorrecto";
                irA = "<h2> " + "<a href=\"index.jsp\">Volver al principio</a>" + "</h2>";
            }

            if (error == null) {
                mensaje = URLEncoder.encode("Verificacion correcta", "latin1");
                response.sendRedirect(response.encodeRedirectURL("index.jsp?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("index.jsp?mensaje=" + error));
            }

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerificacionCodigoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<center>");
            out.println("<h1>Servlet VerificacionCodigoServlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>" + error + "</h1>");
            out.println("<h1> filas : " + filas + "</h1>");
            out.println(irA);
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(VerificacionCodigoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
