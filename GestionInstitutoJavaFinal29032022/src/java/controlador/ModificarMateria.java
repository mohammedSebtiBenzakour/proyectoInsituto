/*
Servlet para modificar una materia
 */
package controlador;

import dao.MateriaJpaController;
import entidades.Materia;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ModificarMateria extends HttpServlet {

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
        List<Registrar_usuarios> listaProfesores = null;

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        EntityManager em = emf.createEntityManager();
        Query consultaP = em.createQuery("Select p From Registrar_usuarios p");
        MateriaJpaController mtc = new MateriaJpaController(emf);
        listaProfesores = consultaP.getResultList();
        request.setAttribute("listaProfesores", listaProfesores);
        Registrar_usuarios prof = new Registrar_usuarios();
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String materia = request.getParameter("materia");
        String descripcion_materia = request.getParameter("descripcion_materia");
        String dniProfesor = request.getParameter("profesor");
        System.out.println("El valor es  " + descripcion_materia);
        prof.setDni(dniProfesor);

        Materia mat = new Materia();

        mat.setMateria(materia);
        mat.setDescripcion_materia(descripcion_materia);
        prof.setDni(dniProfesor);
        mat.setProfesor(prof);
        System.out.println("el parameter modificarMateria es " + request.getParameter("modificarMateria"));
        if (request.getParameter("modificarMateria") == null) {
            request.setAttribute("materia", mat.getMateria());
            request.setAttribute("descripcion_materia", mat.getDescripcion_materia());
            request.setAttribute("dniProfesor", mat.getProfesor().getDni());

            getServletContext().getRequestDispatcher("/admin/modificarMateria.jsp").forward(request, response);
        } else {
            mat.setMateria(materia);
            mat.setDescripcion_materia(descripcion_materia);
            prof.setDni(dniProfesor);
            mat.setProfesor(prof);
            mat.setFecha_creacion(timeStamp);
            try {

                Materia matOtra = mtc.findMateria(materia);

                if (matOtra.getMateria().equals(mat.getMateria())) {
                    mtc.edit(mat);
                } else {
                    error = "Error al intentar modificar la materia - 1";
                }
            } catch (Exception ex) {
                error = "Error al intentar modificar la materia -2";
            }
            emf.close();

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha modificado la materia ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoMaterias?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoMaterias?mensaje=" + error));
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
