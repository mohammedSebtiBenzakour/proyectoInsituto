/*
Servlet para insertar un nivel
 */
package controlador;

import central.ClaseParaValidarDatos;
import dao.Nivel_institutoJpaController;
import entidades.Nivel_instituto;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class InsertarNivel extends HttpServlet {

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

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        Nivel_institutoJpaController njc = new Nivel_institutoJpaController(emf);

        Nivel_instituto ni = new Nivel_instituto();

        String nivel = request.getParameter("nivel");

        if (ClaseParaValidarDatos.validarDatos(nivel) == true) {

            ni.setNombre_nivel(nivel);
            ni.setCreado_el(timeStamp);

            try {
                njc.create(ni);
            } catch (Exception ex) {
                if (ex.getMessage().contains("Duplicate entry")) {
                    error = "Ya existe el nivel " + ni.getNombre_nivel();
                } else {
                    error = "Error al insertar el nivel (" + ex.getMessage() + ")";
                    System.out.println("el error es " + error);
                    System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
                }
            }
        } else {
             error = "El nivel no es correcto";
        }

        //Si no hay ningun error se dirige a una pagina o a otra   
        if (error == null) {
            mensaje = URLEncoder.encode("Se ha creado el nivel " + ni.getNombre_nivel(), "latin1");
            response.sendRedirect(response.encodeRedirectURL("gestionNiveles.jsp?mensaje=" + mensaje));

            return;
        } else {

//            request.setAttribute("error", error);
//            getServletContext().getRequestDispatcher("/admin/insertarNivel.jsp").forward(request, response);
            
            mensaje = URLEncoder.encode("Error en el nivel ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("insertarNivel.jsp?mensaje=" + mensaje));
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
