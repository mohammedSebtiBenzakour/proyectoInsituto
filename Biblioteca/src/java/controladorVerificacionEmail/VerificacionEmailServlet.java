/*
Servlet para la verificación del email
 */
package controladorVerificacionEmail;

import controladorEditarLibro.ClaseParaValidarDatos;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
@WebServlet(name = "VerificacionEmailServlet", urlPatterns = {"/VerificacionEmailServlet"})
public class VerificacionEmailServlet extends HttpServlet {

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
        String mensaje = null;
        String error = null;
        int contador = 0;

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String nombreUsuario = request.getParameter("nombreUsuario");
            String emailUsuario = request.getParameter("emailUsuario");

            if (ClaseParaValidarDatos.validarSoloTexto(nombreUsuario) == true) {
                contador++;
                System.out.println("el contador1  " + contador);
            } else {
                error = "El nombre no es correcto";
            }
            if (ClaseParaValidarDatos.validarEmail(emailUsuario) == true) {
                contador++;
                System.out.println("el contador2  " + contador);

            } else {
                error = "El email no es correcto";
            }

            if (contador == 2) {

                EnviarEmail em = new EnviarEmail();
                String codigoVerif = em.getRandom();

                Usuario usuario = new Usuario(nombreUsuario, emailUsuario, codigoVerif);

                boolean test = em.sendEmail(usuario);

                if (test) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("usuario", usuario);
//                response.sendRedirect("verificacionEmailRespuesta.jsp");
                } else {
                    error = "Error en la verificación del email ";
                }
            } else {
                mensaje = URLEncoder.encode("Error en el nombre o el email ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("verificacionEmail.jsp?mensaje=" + mensaje));

                return;
            }

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha verificado el email ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("verificacionEmailRespuesta.jsp?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("verificacionEmail.jsp?mensaje=" + error));
            }

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
