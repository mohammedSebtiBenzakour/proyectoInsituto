/*
Servlet para eliminar una evaluación
 */
package controlador;

import dao.EvaluacionJpaController;
import dao.MateriaJpaController;
import dao.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
public class EliminarEvaluacion extends HttpServlet {

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
        String error = null;
        String mensaje = null;

        String idS = request.getParameter("id");

        HttpSession sesion = request.getSession();

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");

        EntityManager em = emf.createEntityManager();

        EvaluacionJpaController ejc = new EvaluacionJpaController(emf);
        long id = 0;
        try {
             id = Long.parseLong(idS);
            ejc.destroy(id);
        } catch (NonexistentEntityException ex) {
            System.err.println(ex.getMessage());
            error = "ERROR al intentar eliminar la evaluacion : " + id + " del alumno : " + ejc.findEvaluacion(id).getAlumno().getNombre_alumno();
        }
        emf.close();

        if (error == null) {
            mensaje = URLEncoder.encode("Se ha elimnado la evaluacion " + id, "latin1");
            response.sendRedirect(response.encodeRedirectURL("MostrarListadoEvaluaciones?mensaje=" + mensaje));
        } else {
            error = URLEncoder.encode(error, "latin1");
            response.sendRedirect(response.encodeRedirectURL("MostrarListadoEvaluaciones?mensaje=" + error));
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
