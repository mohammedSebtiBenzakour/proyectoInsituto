/*
 Servlet para mostrar el listado de los alumnos
 */
package controlador;

import dao.Nivel_institutoJpaController;
import dao.Registrar_alumnosJpaController;
import entidades.Nivel_instituto;
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
public class MostrarListadoAlumnos extends HttpServlet {

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
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        List<Registrar_alumnos> listaAlumnos = null;

        EntityManager em = emf.createEntityManager();

        Registrar_alumnosJpaController rajc = new Registrar_alumnosJpaController(emf);

        Nivel_institutoJpaController nijc = new Nivel_institutoJpaController(emf);

        List<Nivel_instituto> niveles = null;


        Query consultaN = em.createQuery("Select n From Nivel_instituto n");

        Query consultaA = em.createQuery("Select a From Registrar_alumnos a");

        listaAlumnos = consultaA.getResultList();

        niveles = consultaN.getResultList();

        for (Nivel_instituto as : niveles) {
            System.out.println("el resultado es " + as.getNombre_nivel());
        }
        for (Registrar_alumnos as : listaAlumnos) {
            System.out.println("el resultado 3 es " + as.getNivel_alumno().getNombre_nivel());
        }

        emf.close();
        request.setAttribute("listaAlumnos", listaAlumnos);
        request.setAttribute("niveles", niveles);

        getServletContext().getRequestDispatcher("/admin/mostrarAlumnos.jsp").forward(request, response);

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
