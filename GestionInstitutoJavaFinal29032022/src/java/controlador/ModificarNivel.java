/*
Servlet para modificar un nivel
 */
package controlador;

import dao.Nivel_institutoJpaController;
import entidades.Materia;
import entidades.Nivel_instituto;
import entidades.Registrar_usuarios;
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
public class ModificarNivel extends HttpServlet {

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
        List<Nivel_instituto> listaNiveles = null;

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        EntityManager em = emf.createEntityManager();
        Query consultaN = em.createQuery("Select n From Nivel_instituto n");

        Nivel_institutoJpaController njc = new Nivel_institutoJpaController(emf);

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String nivel = request.getParameter("nivel");
        int id = Integer.parseInt(request.getParameter("id"));

      
        Nivel_instituto ni = new Nivel_instituto();
        ni.setNombre_nivel(nivel);
        ni.setId((long) id);
       

        if (request.getParameter("modificarNivel") == null) {
            request.setAttribute("nivel", ni.getNombre_nivel());
            request.setAttribute("id", ni.getId());
            getServletContext().getRequestDispatcher("/admin/modificarNivel.jsp").forward(request, response);
        } else {
            ni.setNombre_nivel(nivel);
            ni.setId((long) id);
            ni.setCreado_el(timeStamp);
            try {

                Nivel_instituto niOtro = njc.findNivel_insituto(nivel);

                if (niOtro.getNombre_nivel().equals(ni.getNombre_nivel())) {
                    njc.edit(ni);
                } else {
                    error = "Error al intentar modificar el nivel - 1";
                }
            } catch (Exception ex) {
                error = "Error al intentar modificar el nivel -2 " + ex.getMessage();
                System.out.println(ex.getStackTrace());
                ex.getStackTrace();
            }
            emf.close();

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha modificado el nivel ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoNiveles?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoNiveles?mensaje=" + error));
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
