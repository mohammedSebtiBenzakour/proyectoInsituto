/*
Servlet para insertar una evaluación

https://www.freeformatter.com/java-regex-tester.html#ad-output
 */
package controlador;

import central.ClaseParaValidarDatos;
import dao.EvaluacionJpaController;
import entidades.Evaluacion;
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
public class InsertarEvaluacion extends HttpServlet {

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
        Evaluacion eva = new Evaluacion();

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        List<Registrar_alumnos> listaAlumnos = null;
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        EvaluacionJpaController evjc = new EvaluacionJpaController(emf);

        Registrar_alumnos ra = new Registrar_alumnos();
        EntityManager em = emf.createEntityManager();
        Query consultaA = em.createQuery("Select a From Registrar_alumnos a");
        listaAlumnos = consultaA.getResultList();
        request.setAttribute("listaAlumnos", listaAlumnos);

        String nota = request.getParameter("nota");
        String observacion = request.getParameter("observacion");
        String dni_alumno = request.getParameter("dni_alumno");

        if (ClaseParaValidarDatos.validarSoloNumerosDecimales(nota) == true) {
            if (ClaseParaValidarDatos.validarSoloTexto(observacion) == true) {

                ra.setDni_alumno(dni_alumno);

                eva.setAlumno(ra);
                eva.setFecha_registro(timeStamp);
                eva.setNota(nota);
                eva.setObservacion(observacion);

                try {
                    evjc.create(eva);
                } catch (Exception ex) {
                    if (ex.getMessage().contains("Duplicate entry")) {
                        error = "Ya existe la evaluacion : " + eva.getId() + " para el alumno : " + eva.getAlumno().getDni_alumno();
                    } else {
                        error = "Error al insertar la evaluacion (" + ex.getMessage() + ")";
                        System.out.println("el error es " + error);
                        System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
                    }
                }
            } else {
                error = "La observacion no es correcta";
            }
        } else {
            error = "La nota no es correcta";
        }

        //Si no hay ningun error se dirige a una pagina o a otra   
        if (error == null) {
            mensaje = URLEncoder.encode("Se ha creado la evaluacion " + eva.getId() + " para el alumno : " + eva.getAlumno().getDni_alumno(), "latin1");
            response.sendRedirect(response.encodeRedirectURL("gestionEvaluaciones.jsp?mensaje=" + mensaje));

            return;
        } else {

//            request.setAttribute("error", error);
//            getServletContext().getRequestDispatcher("/admin/insertarEvaluacion.jsp").forward(request, response);
            mensaje = URLEncoder.encode("Error en la nota o observacion ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("insertarEvaluacion.jsp?mensaje=" + mensaje));

            return;
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
