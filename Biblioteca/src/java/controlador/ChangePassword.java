/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daw2
 */
public class ChangePassword extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=latin1");
            request.setCharacterEncoding("latin1");
            String mensaje = null;
            String error = null;

            //Funciona muy bien
            String currentPassword = request.getParameter("current");
            String Newpass = request.getParameter("new");
            String conpass = request.getParameter("confirm");
            Connection con = Conexion.conectarBD();

            String pass = "";
            int id = 0;
            try {

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from usuarios where password='" + currentPassword + "'");
                while (rs.next()) {
                    id = rs.getInt(1);
                    pass = rs.getString(4);
                }
                System.out.println(id + " " + pass);
                if (pass.equals(currentPassword)) {
                    Statement st1 = con.createStatement();
                    int i = st1.executeUpdate("update usuarios set password='" + Newpass + "' where id='" + id + "'");
                    out.println(" <center>");
                    out.println("Password changed successfully");
                    out.println(" </center>");
                    st1.close();
                    con.close();
//                    response.sendRedirect("index.jsp");
                } else {
                    out.println(" <center>");
                    out.println("Invalid Current Password");
                    out.println(" </center>");
                    error = "Error en la modificación de la contraseña ";
//                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                out.println(e);
            }

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha modificado la contraseña ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("index.jsp?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("index.jsp?mensaje=" + error));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
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
