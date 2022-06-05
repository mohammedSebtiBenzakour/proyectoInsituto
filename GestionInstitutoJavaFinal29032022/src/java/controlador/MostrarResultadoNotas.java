/*
Servlet para mostrar resultado notas
 */
package controlador;

import entidades.Evaluacion;
import entidades.Registrar_alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
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
public class MostrarResultadoNotas extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String error = null;
        String mensaje = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        List<Evaluacion> Evaluaciones = null;
        Evaluaciones = (List<Evaluacion>) sesion.getAttribute("Evaluaciones");

        if (Evaluaciones == null) {
            error = "No hay datos para esta materia";
            sesion.setAttribute("error", error);
            response.sendRedirect("admin/mostrarNotasAlumnos.jsp");
            return;
        } else {
            sesion.removeAttribute("error");
            Registrar_alumnos ra = new Registrar_alumnos();
            Evaluaciones = (List<Evaluacion>) sesion.getAttribute("Evaluaciones");
            ra = Evaluaciones.get(0).getAlumno();
            System.out.println("el ra es  " + ra.getDni_alumno());
            request.setAttribute("Evaluaciones", Evaluaciones);
            request.setAttribute("alumno", ra);
            System.out.println("las evaluaciones " + Evaluaciones);
            sesion.removeAttribute("Evaluaciones");
            getServletContext().getRequestDispatcher("/admin/mostrarResultadoNotas.jsp").forward(request, response);

        }
        if (error == null) {
                mensaje = URLEncoder.encode("Todo esta correcto " , "latin1");
                response.sendRedirect(response.encodeRedirectURL("admin/mostrarResultadoNotas?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("admin/mostrarResultadoNotas?mensaje=" + error));
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
