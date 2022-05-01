/*
 Crear usuarios (Profesores)
 */
package servlets;

import dao.Registrar_usuariosJpaController;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
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

/**
 *
 * @author daw2
 */
public class CrearUsuarios extends HttpServlet {

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

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaPU");

        Registrar_usuariosJpaController rujc = new Registrar_usuariosJpaController(emf);

        Registrar_usuarios ru = new Registrar_usuarios();

        ru.setDni("2");
        ru.setNombre("as");
        ru.setApellidos("as");
        ru.setPerfil("administrador");
        ru.setUsuario("as");
        ru.setClave("as");
        ru.setEmail("a@a.com");
        ru.setDepartamento("Electricidad");
        ru.setCiudad("Sevilla");
        ru.setPais("España");
        ru.setDireccion("Camas");
        String fechaR = "2022-01-23";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date d = sdf.parse(fechaR);
            ru.setFecha(d);
        } catch (ParseException ex) {
            Logger.getLogger(CrearUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ru.setTelefono("1231231235");
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        ru.setFecha_registro(timeStamp);

        try {
            rujc.create(ru);
        } catch (Exception ex) {
            Logger.getLogger(CrearUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }

        emf.close();

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet crearUsuarios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet crearUsuarios at " + request.getContextPath() + "</h1>");
            out.println("<h1>todo correcto</h1>");
            out.println("</body>");
            out.println("</html>");
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
