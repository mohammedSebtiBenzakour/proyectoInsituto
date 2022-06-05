/*
 Servlet para enviar un email
 */
package controlador;

import central.Central;
import central.Email;
import dao.Registrar_alumnosJpaController;
import entidades.Registrar_alumnos;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daw2
 */
public class EnviarEmail extends HttpServlet {

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
        request.setCharacterEncoding("latin1");
        String error = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        EntityManager em = emf.createEntityManager();
        HttpSession sesion = request.getSession();
        List<Registrar_alumnos> listaAlumnos = null;
        Registrar_alumnos ra = null;
        Registrar_usuarios ru = null;
        Central central = null;
        ru = (Registrar_usuarios) sesion.getAttribute("usuario");

        Registrar_alumnosJpaController rajc = new Registrar_alumnosJpaController(emf);

        String mensaje = null;
        String usuario = request.getParameter("usuario");
        String subject_email = request.getParameter("subject_email");
        String notificaciones = request.getParameter("notificaciones");
        String dni = request.getParameter("dni");
        
        System.out.println("El dni de enviaremail " + dni);

        ra = rajc.findRegistrar_alumnos(dni);

        Email email = new Email();
        //  email.setFrom("msb.caixa@gmail.com");
        email.setFrom(ru.getEmail());
//        email.setSubject("Prueba");
        email.setSubject(subject_email);
        //   email.setTo("msebti2@gmail.com");
        email.setTo(ra.getEmail_alumno());
//        email.setText("salduos de la clase de programacion soy el administrador......................");
        email.setText(notificaciones);
        //Este objeto es donde se ubica el metodo con la configuración para enviar un email 
        central = (Central) (request.getSession().getAttribute("central"));

        try {
            central.setEnviarEmail(email, "93345900");
        } catch (MessagingException ex) {
            error = "error enviar email " + ex.getMessage().getClass() + " " + ex.getMessage();
            System.err.println("error enviar email " + ex.getMessage().getClass() + " " + ex.getMessage());
        }

        if (error == null) {
            mensaje = URLEncoder.encode("Se ha enviado el email al usuario " + usuario, "latin1");
            response.sendRedirect(response.encodeRedirectURL("SeleccionarDestinatario?mensaje=" + mensaje));
        } else {
            error = URLEncoder.encode(error, "latin1");
            response.sendRedirect(response.encodeRedirectURL("SeleccionarDestinatario?mensaje=" + error));
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
