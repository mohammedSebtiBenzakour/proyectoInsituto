/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import controladorEditarLibro.ClaseParaValidarDatos;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jrockit.jfr.tools.ConCatRepository;

/**
 *
 * @author daw2
 */
@WebServlet(name = "ServletRegistrar", urlPatterns = {"/ServletRegistrar"})
public class ServletRegistrar extends HttpServlet {

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
        String error = null;
        String mensaje = null;
//        try {
        response.setContentType("text/html;charset=latin1");
        request.setCharacterEncoding("latin1");
        int contador = 0;

        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (ClaseParaValidarDatos.validarSoloTexto(nombre) == true) {
            contador++;
            System.out.println("el contador1  " + contador);
        } else {
            error = "El nombre no es correcto";
        }
        if (ClaseParaValidarDatos.validarEmail(email) == true) {
            contador++;
            System.out.println("el contador2  " + contador);

        } else {
            error = "El email no es correcto";
        }
        if (ClaseParaValidarDatos.validarSoloTexto(password) == true) {
            contador++;
            System.out.println("el contador3  " + contador);
        } else {
            error = "La contraseña no es correcta";
        }
        System.out.println("el contador  " + contador);
        if (contador == 3) {

//make user object
            Usuario usuario = new Usuario(nombre, email, password);

//create a database model
            boolean v = false;
            try {
                UsarBaseDatos ubd = new UsarBaseDatos(Conexion.conectarBD());
                v = ubd.registrarUsuario(usuario);
                if (v && ubd.buscarEmail(email) != email) {
//                    response.sendRedirect("index.jsp");
                    mensaje = URLEncoder.encode("El usuario ha sido creado correctamente ", "latin1");
                    response.sendRedirect(response.encodeRedirectURL("registrarse.jsp?mensaje=" + mensaje));
                    return;
                } else {

//                        String errorMessage = "Usuario ya existe";
//                        HttpSession sesion = request.getSession();
//                        sesion.setAttribute("errorMessage", errorMessage);
//                        response.sendRedirect("registrarse.jsp");
                    mensaje = URLEncoder.encode("Email ya existe en la base de datos", "latin1");
                    System.out.println("es aqui el eeero duplicate key");
                    System.out.println(ubd.buscarEmail(email));
                    response.sendRedirect(response.encodeRedirectURL("registrarse.jsp?mensaje=" + mensaje));

                    return;

                }
            } catch (SQLException ex) {
                ex.printStackTrace();

            }
        } else {
            mensaje = URLEncoder.encode("Error en el nombre , la contraseña o el email ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("registrarse.jsp?mensaje=" + mensaje));

            return;
        }

//        } catch (SQLException ex) {
//            ex.printStackTrace();
//
//        }
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
