/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dao.EvaluacionJpaController;
import entidades.Evaluacion;
import entidades.Registrar_alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ModificarNotaAlumno extends HttpServlet {

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
        EvaluacionJpaController ejc = new EvaluacionJpaController(emf);
        Registrar_alumnos ra = new Registrar_alumnos();

        String idS = request.getParameter("id");
        Long id = Long.parseLong(idS);
        String dni_alumno = request.getParameter("dni_alumno");

        System.out.println("el dni alumno es " + dni_alumno);

        String notaS = request.getParameter("nota");

        String observacion = request.getParameter("observacion");

        Evaluacion ev = new Evaluacion();

        ev.setId(id);
        ev.setNota(notaS);
        ev.setObservacion(observacion);
        ra.setDni_alumno(dni_alumno);
        ev.setAlumno(ra);

        if (request.getParameter("modificar_nota") == null) {
            request.setAttribute("id", ev.getId());
            request.setAttribute("nota", ev.getNota());
            request.setAttribute("observacion", ev.getObservacion());
            request.setAttribute("dni_alumno", ev.getAlumno().getDni_alumno());

            getServletContext().getRequestDispatcher("/admin/modificarNotaAlumno.jsp").forward(request, response);
        } else {
            ev.setId(id);
            ev.setNota(notaS);
            ev.setObservacion(observacion);
            ra.setDni_alumno(dni_alumno);
            ev.setAlumno(ra);

            try {

                Evaluacion evOtro = ejc.findEvaluacion(id);
                if (evOtro.equals(ev)) {
                    ejc.edit(ev);
                } else {
                    error = "Error al intentar modificar la nota del alumno - 1";
                }

            } catch (Exception ex) {
                error = "Error al intentar modificar la nota del alumno - 2";
            }
            emf.close();

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha modificado la nota ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarTodasLasNotas?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarTodasLasNotas?mensaje=" + error));
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
