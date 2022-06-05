/*
Servlet para modificar una evaluación
 */
package controlador;

import dao.EvaluacionJpaController;
import entidades.Evaluacion;
import entidades.Materia;
import entidades.Registrar_alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class ModificarEvaluacion extends HttpServlet {

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

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        EntityManager em = emf.createEntityManager();
        Query consultaA = em.createQuery("Select a From Registrar_alumnos a");
        List<Evaluacion> listaEvaluaciones = null;
        List<Registrar_alumnos> listaAlumnos = null;
        Evaluacion eva = new Evaluacion();
        Registrar_alumnos ra = new Registrar_alumnos();

        listaAlumnos = consultaA.getResultList();
        request.setAttribute("listaAlumnos", listaAlumnos);

        EvaluacionJpaController ejc = new EvaluacionJpaController(emf);
        long id = 0;
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String idS = request.getParameter("id");
        String nota = request.getParameter("nota");
        String observacion = request.getParameter("observacion");
        String dni_alumno = request.getParameter("dni_alumno");
        
        
        System.out.println("el id es " + idS);
        System.out.println("el dni alumno es " + dni_alumno);
        ra.setDni_alumno(dni_alumno);
        id = Long.parseLong(idS);
        eva.setAlumno(ra);
        eva.setId(id);
        eva.setNota(nota);
        eva.setObservacion(observacion);

        if (request.getParameter("modificarEvaluacion") == null) {
            request.setAttribute("id", eva.getId());
            request.setAttribute("nota", eva.getNota());
            request.setAttribute("observacion", eva.getObservacion());
            request.setAttribute("dni_alumno", eva.getAlumno().getDni_alumno());

            getServletContext().getRequestDispatcher("/admin/modificarEvaluacion.jsp").forward(request, response);
        } else {
            id = Long.parseLong(idS);
            System.out.println("el id es " + idS);

            ra.setDni_alumno(dni_alumno);

            eva.setAlumno(ra);
            eva.setId(id);
            eva.setNota(nota);
            eva.setObservacion(observacion);
            eva.setFecha_registro(timeStamp);

            try {

                Evaluacion otraEva = ejc.findEvaluacion(id);

                if (otraEva.getId().equals(eva.getId())) {
                    ejc.edit(eva);
                } else {
                    error = "Error al intentar modificar la evaluacion - 1";
                }
            } catch (Exception ex) {
                error = "Error al intentar modificar la evaluacion -2";
            }
            emf.close();

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha modificado la evaluacion ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoEvaluaciones?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoEvaluaciones?mensaje=" + error));
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
