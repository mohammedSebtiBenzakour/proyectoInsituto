/*
Servlet para obtener el listado de evaluaciones seleccionando el destinatario
 */
package controlador;

import dao.EvaluacionJpaController;
import entidades.Evaluacion;
import entidades.Registrar_alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daw2
 */
public class SeleccionarDestinatario extends HttpServlet {

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
        HttpSession sesion = request.getSession();
        String error = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        EntityManager em = emf.createEntityManager();

        List<Registrar_alumnos> listaAlumnos = null;
        EvaluacionJpaController ejc = new EvaluacionJpaController(emf);
        List<Evaluacion> listaEvaluaciones = null;
        Registrar_alumnos ra = new Registrar_alumnos();

        Query consultaE = em.createQuery("Select e From Evaluacion e");

        listaEvaluaciones = consultaE.getResultList();

        emf.close();
        request.setAttribute("listaEvaluaciones", listaEvaluaciones);
        System.out.println("las evaluaciones " + listaEvaluaciones);

        getServletContext().getRequestDispatcher("/admin/mostrarTodasLasNotas.jsp").forward(request, response);

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
